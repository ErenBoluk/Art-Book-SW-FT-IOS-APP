//
//  detailVC.swift
//  ArtBookProject
//
//  Created by midDeveloper on 6.06.2023.
//

import UIKit

class detailVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet var yearText: UIView!
    
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
       
        
        
    }

}
