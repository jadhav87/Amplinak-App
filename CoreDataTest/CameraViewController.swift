//
//  CameraViewController.swift
//  CoreDataTest
//
//  Created by vikas on 07/06/17.
//  Copyright © 2017 vikas. All rights reserved.
//

import UIKit
import CoreData

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imag: UIImageView!
    var imagePicker: UIImagePickerController!
    
    var fname:String!
    var lname:String!
    var email:String!
    
    var users: [NSManagedObject] = []
    
    let reachability = Reachability()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewData(index: 0)
//        takePics()
//        print(email)
//        imag.image = load(fileName: "test.jpg");

        // Do any additional setup after loading the view.
//        imag.image = UploadRequest()
        
//        UploadRequest(fname: "Vikas", lname: "Jadhav", email: "vjadhav986@gmail.com")
//        UploadRequest();
    }

    func takePics() {
        print("Sulfade")
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        //1
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//        
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//        
//        //2
//        let fetchRequest =
//            NSFetchRequest<NSManagedObject>(entityName: "User")
//        
//        //3
//        do {
//            users = try managedContext.fetch(fetchRequest)
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
    }

    
    @IBAction func TakePicture(_ sender: Any) {
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        print(info)
        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let rotateImg = imageRotatedByDegrees(oldImage: imagePicked, deg: 180)
            imag.image = imagePicked
            
//            let imageData = NSData(data: UIImageJPEGRepresentation(imagePicked, 1.0)!)
            
//            SaveData(fname: "Vikas", lname: "Jadhav", email: "vjadhav986@gmail.com", image: imageData)
//            UIImageWriteToSavedPhotosAlbum(imagePicked, nil, nil, nil)
            
            //------------------------------- Save image to path -----------------------------------------//
//            let fileName = fname+"_"+lname+"_"+getTimeStamp()+".jpg"
            let fileName = fname+"_"+lname+".jpg"
            let fileURL = documentsUrl.appendingPathComponent(fileName)
            if let imageData = UIImageJPEGRepresentation(rotateImg, 1.0) {
                try? imageData.write(to: fileURL, options: .atomic)
                
                if reachability.isReachable {
                    UploadRequest(fname: fname, lname: lname, email: email, filname: fileName)
                }else{
                   SaveData(fname: fname, lname: lname, email: email, image: fileName)
                }
            }
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func SaveData(fname:String, lname:String, email:String, image:String) {
        
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//        
//        // 1
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//        
//        // 2
//        let entity =
//            NSEntityDescription.entity(forEntityName: "User",
//                                       in: managedContext)!
//        
//        let user = NSManagedObject(entity: entity,
//                                   insertInto: managedContext)
////        let objectId = managedContext.object(with: NSManagedObject.objectIDs(self))
//        
//        // 3
////        user.setValue(objectId, forKeyPath: String)
//        user.setValue(fname, forKeyPath: "fname")
//        user.setValue(lname, forKeyPath: "lname")
//        user.setValue(email, forKeyPath: "email")
//        user.setValue(image, forKeyPath: "image")
//        user.setValue(0, forKeyPath: "sync")
//        
//        
//        // 4
//        do {
//            try managedContext.save()
//            users.append(user)
//            print("Data saved sucessfully")
//            viewData(index: 0)
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
        
    }
    
    func updateName(index: Int, newName: String){
        
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//        
//        // 1
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//
//        
//        let empId = "001"
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
//        let predicate = NSPredicate(format: "empId = '\(empId)'")
//        fetchRequest.predicate = predicate
//        do
//        {
//            let test = try managedContext.fetch(fetchRequest)
//            if test.count == 1
//            {
//                let objectUpdate = test[0] as! NSManagedObject
//                objectUpdate.setValue("newName", forKey: "name")
//                objectUpdate.setValue("newDepartment", forKey: "department")
//                objectUpdate.setValue("001", forKey: "empID")
//                do{
//                    try managedContext.save()
//                }
//                catch
//                {
//                    print(error)
//                }
//            }
//        }
//        catch
//        {
//            print(error)
//        }
    }
    
    func viewData(index:Int) {
        
        //        let user = users[index]
        
//        var languages = [Any]()
        
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//        
//        // 1
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//        
//        // Assuming type has a reference to managed object context
//        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//        fetchRequest.fetchLimit = 10
//        do {
//            let fetchedEntities = try managedContext.fetch(fetchRequest) as! NSManagedObject
//            print(fetchedEntities)
//            // Do something with fetchedEntities
//        } catch {
//            // Do something in response to error condition
//        }

        
        for user in users {
            
            
            let index = user.objectID
            
            
            print(index)
            
//            let firstName = user.value(forKeyPath: "fname") as? String
//            let lastName = user.value(forKeyPath: "lname") as? String
//            let emailId = user.value(forKeyPath: "email") as? String
//            let image = user.value(forKeyPath: "image") as? String
//            let sync = user.value(forKeyPath: "sync") as? Int64
//            
//            print("First Name : \(firstName!)\nLast Name : \(lastName!)\nEmail Id : \(emailId!)\nImage : \(image!)\nsync : \(sync!)")
//            print("/** ************************************************************************ **/")
            
        }
//        print(languages);
        
    }

    func load(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func UploadRequest(fname:String, lname:String, email:String, filname:String)
    {
        //    let filname = fname+"_"+lname+".jpg"
        print("uploading...........");
        let url = URL(string: "http://192.168.1.114/amplinak/upload.php")
        
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
         if (load(fileName: filname) == nil)
        {
            return
        }
        
        let image_data = UIImagePNGRepresentation(load(fileName: filname)!)
        
        if(image_data == nil)
        {
            return
        }
        
        let body = NSMutableData()
        
        let mimetype = "image/png"
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"fname\"\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append("\(fname)\r\n".data(using: String.Encoding.utf8)!)
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"lname\"\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append("\(lname)\r\n".data(using: String.Encoding.utf8)!)
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"email\"\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append("\(email)\r\n".data(using: String.Encoding.utf8)!)
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"file\"; filename=\"\(filname)\"\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append(image_data!)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        
        request.httpBody = body as Data
        _ = URLSession.shared
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {            (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                print("error")
                return
            }
            
            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print(dataString as Any)
        }
        task.resume()
    }
    
    func generateBoundaryString() -> String
    {
        return "Boundary-\(UUID().uuidString)"
    }
    func getTimeStamp() -> String{
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd_HH:mm:ss"
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        //        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        return formatter.string(from: date as Date)
        //    print(formatter.string(from: date as Date))
    }
    
    func imageRotatedByDegrees(oldImage: UIImage, deg degrees: CGFloat) -> UIImage {
        //Calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox: UIView = UIView(frame: CGRect(x: 0, y: 0, width: oldImage.size.width, height: oldImage.size.height))
        let t: CGAffineTransform = CGAffineTransform(rotationAngle: degrees * CGFloat.pi / 180)
        rotatedViewBox.transform = t
        let rotatedSize: CGSize = rotatedViewBox.frame.size
        //Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap: CGContext = UIGraphicsGetCurrentContext()!
        //Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
        //Rotate the image context
        bitmap.rotate(by: (degrees * CGFloat.pi / 180))
        //Now, draw the rotated/scaled image into the context
        bitmap.scaleBy(x: 1.0, y: -1.0)
        bitmap.draw(oldImage.cgImage!, in: CGRect(x: -oldImage.size.width / 2, y: -oldImage.size.height / 2, width: oldImage.size.width, height: oldImage.size.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
