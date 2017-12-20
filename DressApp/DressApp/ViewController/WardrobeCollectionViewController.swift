//
//  WardrobeCollectionViewController.swift
//  DressApp
//
//  Created by Giulio Izzo on 15/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class WardrobeCollectionViewController: UICollectionViewController {
    
    var imgs: [String] = ["Batman"]
    var segueID = "toAddClothe"
    var segueInfoID = "toInfo"
    
    var cellPushed: Int?
    var clothes: [Any] = []     //VETTORE DOVE METTERE I VESTITI(SE MAGLIETTE, PANTALONI ETC.)
    
//    var prova1 = TShirt(color: .red, material: Material.cashmere, description: nil, elegant: true, model: Model.short)
//    var provaPantalone = Trousers(color: .black, material: Material.jeans, description: nil, elegant: false, model: Model.long)
//    
//    var maglia: [TShirt] = []
//    var pantalone: [Trousers] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        maglia.append(prova1)
//        pantalone.append(provaPantalone)
        

        // Set the title of the views basing on the cell pushed in the previously table view
        if cellPushed == 0 {
            self.title = "T-Shirts"
        }
        else if cellPushed == 1 {
            self.title = "Shirts"
        }
        else if cellPushed == 2 {
            self.title = "Sweaters"
        }
        else if cellPushed == 3 {
            self.title = "Dresses"
        }
        else if cellPushed == 4 {
            self.title = "Trousers"
        }
        else if cellPushed == 5 {
            self.title = "Shoes"
        }
        else {
            self.title = "Skirts"
        }
        
      
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //    così se ruota a portrait aggiorna i layout
    override func viewSafeAreaInsetsDidChange() {
        //         UIDeviceOrientationIsLandscape(UIDevice.current.orientation){
        collectionView?.reloadData()
        
    }
    
    
//  PROVA SET UP ARRAY VESTITI COLLECTION. SI DEVONO CREARE I VETTORI DEI VARI VESTITI DA ASSOCIARE A TESTVECTOR
//    func setUpDress(){
//        if cellPushed == 0{
//            testVector = maglia
//            print ("MAGLIA")
//        }else if cellPushed == 1{
//            print ("PANTALONE")
//            testVector = pantalone
//        }else if cellPushed == 2{
//
//        }
//
//    }
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imgs.count
        }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WardrobeCollectionViewCell else{
            return WardrobeCollectionViewCell()
        }
    
        // Configure the cell
        
        //AGGIUNGO L'IMG NELLA CELLA (clotheImage è stato instanziato nella collectionViewCell)
        cell.clotheImage.image = UIImage(named: imgs[indexPath.row])
        
//        CONFIGURO L'IMG DEL VESTITO NELLA CELLA:
        cell.clotheImage.frame.size.width = cell.frame.size.width
        cell.clotheImage.frame.size.height = cell.frame.size.height
        cell.clotheImage.contentMode = UIViewContentMode.scaleAspectFill  //anche scaleAspectFit, dipende da te cosa vuoi
        cell.clotheImage.clipsToBounds = true
        cell.clipsToBounds = true   //PROVARE SENZA QUESTO CELL.CLIPSTOBOUNDS SE VA!!

//        AGGIUNGO BORDO ALLA CELLA:
        cell.layer.borderWidth = 1
    
        return cell
    }

}

//DA MODIFICARE I NOMI DI OGNI VARIABILE FACENDO ATTENZIONE CHE CLOTHES 

    extension WardrobeCollectionViewController: UICollectionViewDelegateFlowLayout{

        var collectionViewMargin: UIEdgeInsets{
            return UIEdgeInsets (top: 15, left: 10, bottom: 15, right: 10)
        }

        var collectionViewSpacing: (CGFloat){
            return (CGFloat(20))
        }




        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let paddingSpace = (collectionViewMargin.left + collectionViewMargin.right) + collectionViewSpacing * CGFloat(imgs.count)

            print (collectionViewMargin)

            let viewWidth = collectionView.frame.size.width


            let itemSize = (viewWidth - paddingSpace)/3

            print (itemSize)

            return CGSize(width: itemSize, height: itemSize)
        }


        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return collectionViewMargin
        }

        
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == segueID {
                if let addVC = segue.destination as? AddClothesTableViewController {
                    print ("ENTRATO")
                    if let x = cellPushed {
                        addVC.dressCategory = x
                    }
                }
            } else if segue.identifier == segueInfoID{
                if let infoVC = segue.destination as? DressInfoTableViewController{
                    if let x = cellPushed{
                    infoVC.dressCategory = x
                        print ("X:\(x)")
                    }
                    if let cellRowSelected =
                        collectionView?.indexPathsForSelectedItems?.last?.row{
                        infoVC.cellRowSelected = cellRowSelected
                        print ("Elemento: \(cellRowSelected)")

                    }

                }
            }
        }
        
}

