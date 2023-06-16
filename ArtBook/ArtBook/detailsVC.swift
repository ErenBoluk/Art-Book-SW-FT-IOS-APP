//
//  detailsVC.swift
//  ArtBook
//
//  Created by midDeveloper on 7.06.2023.
//

import UIKit
import CoreData

class detailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var artistLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //        Recognizers
                let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                view.addGestureRecognizer(gestureRecognizer)
                
                imageView.isUserInteractionEnabled = true
                let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
                imageView.addGestureRecognizer(imageTapRecognizer)
    }
    

    @objc func selectImage(){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            imageView.image = info[.originalImage] as? UIImage
            self.dismiss(animated: true, completion: nil)
        }
    @objc func hideKeyboard(){
            view.endEditing(true)
        }
    
   

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
//        attributes
        newPainting.setValue( nameLabel.text! , forKey: "name")
        newPainting.setValue( artistLabel.text! , forKey: "artist")
        if let year = Int(dateLabel.text!){
            newPainting.setValue(year, forKey: "year")
        }
        newPainting.setValue(UUID(), forKey: "id")
        
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        
        
        
        newPainting.setValue(data, forKey: "image")
        
        
        
        
        
        do {
            try context.save()
            print("core-success")
        } catch  {
            print("core-error")
        }
    }
}
