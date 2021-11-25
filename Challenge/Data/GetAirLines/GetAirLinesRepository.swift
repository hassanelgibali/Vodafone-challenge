//
//  GetAirLinesRepository.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import Foundation
import CoreData

class GetAirLinesRepository: Repository
{
    // MARK: - Shared Instance
    private static var getAirLinesRepository: GetAirLinesRepository?
    
    // MARK: - data source Instance
    private final var remoteDataSource: GetAirLineDataSource?
    
    // MARK: - get Shared Instance
    static func getAirLinesRepository(remoteDataSource: GetAirLineDataSource ) -> GetAirLinesRepository{
        
        if getAirLinesRepository == nil {
            getAirLinesRepository = GetAirLinesRepository(remoteDataSource: remoteDataSource)
        }
        
        return getAirLinesRepository!
    }
    private init(remoteDataSource: GetAirLineDataSource) {
        
        self.remoteDataSource = remoteDataSource
    }
    
    func deleteAllAirLinesRecords() {
        let context = appDelegate.persistentContainer.viewContext

        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "AirLinesData")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }
    
    func saveAirLineRecordsInDB(responseValue:AirlinesModel){
        let entity =
            NSEntityDescription.entity(forEntityName: "AirLinesData",
                                       in: context)!
        
        for index in responseValue {
            let mangedMbject = NSManagedObject(entity: entity,
                                               insertInto: context)
            mangedMbject.setValue(index.slogan, forKey: "slogan")
            mangedMbject.setValue(index.id, forKey: "id")
            mangedMbject.setValue(index.name, forKey: "name")
            mangedMbject.setValue(index.country, forKey: "country")
            mangedMbject.setValue(index.established, forKey: "established")
            mangedMbject.setValue(index.headQuaters, forKey: "headquarter")
            mangedMbject.setValue(index.website, forKey: "website")
            mangedMbject.setValue(index.logo, forKey: "logo")



            
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    
    // MARK: - implement Repository Protocol
    
    func getData(requestValue: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void){
        
        if Reachability.isConnectedToNetwork(){
            remoteDataSource?.getAirLine(requestValue: requestValue, compilationHandler: { (response, error) in
                
                guard let data = response as? Data else { return }
                
                do {
                    
                    let response = try! JSONDecoder().decode(AirlinesModel.self, from:data)
                    let  responseValue = AirlinesResponseValues.init(result:response)
                    compilationHandler(responseValue,error)
                    self.deleteAllAirLinesRecords()
                    self.saveAirLineRecordsInDB(responseValue: responseValue.result)
                  
                }
                catch {
                    print("JSONSerialization error:")
                }
                
            })
        }else{
           if let reqV = requestValue as? AirlinesRequestValues {
            GetAirLineLocalDataSource.sharedInstance.getAirLine(requestValue: reqV) { (response, error) in
                if response != nil{
                    var localAirLinesList = [AirlinesModelElement]()
                    for airLine in response as![AirLinesData]{
                        let localAirLine = AirlinesModelElement(id: Int(airLine.id), name: airLine.name, country: airLine.country,logo: airLine.logo, slogan: airLine.slogan, headQuaters:airLine.headquarter, requestedID: "")
                        localAirLinesList.append(localAirLine)
                    }
                    let  responseValue = AirlinesResponseValues.init(result:localAirLinesList)
                    compilationHandler(responseValue,error)
                }else{
                    let  responseValue = GenricResponseValues.init(message:"no stations data")
                    compilationHandler(responseValue ,error)
                }
        }
        

        
        
    }
        }
}

}
