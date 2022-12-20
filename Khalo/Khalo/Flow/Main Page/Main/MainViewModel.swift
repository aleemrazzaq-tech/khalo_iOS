
import Foundation
import UIKit
import SwiftUI

class MainViewModel:ObservableObject
{
    @Published var array:[UIImage] = []
}

//MARK:- Getdata from json file
extension MainViewModel
{
    
    
    func getData() async-> DeliveryModel
    {
        let data =  Bundle.main.decode("data.json")
        print("\(data.restaurants.count)")
        for itr in 0...data.restaurants.count-1
        {
           let data = await downloadImage(data.restaurants[itr].imageLink)!
            await MainActor.run
            {
              self.array.append(data)
            }
        }
        print("Data\(array.count)")
        return data
    }
}


func downloadImage(_ url:String)async ->UIImage?
{
    do{
        let value  = URL(string: url)
        let (data ,response) = try await URLSession.shared.data(from: value!, delegate: nil)
        guard let image = UIImage(data:data) , let res = response as? HTTPURLResponse ,
        res.statusCode>=200 && res.statusCode<300 else {
            return nil
        }
        
        return image
    }
    catch
    {
        print("Error getting image\(error)")
        return nil
        
    }
}

extension Bundle {
    func decode(_ file: String) -> DeliveryModel {
        // Locate the JSON-file.
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(DeliveryModel.self, from: data)
          
            
            
        } catch {
            print(error)
            fatalError("Error is \(error) from bundle.")
        }
    }
}


extension UIImage {
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
  
   
}
