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
        print ("cella scelta: \(cellPushed!)")
        
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return clothes.count
        }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WardrobeCollectionViewCell else{
            return WardrobeCollectionViewCell()
        }
    
        // Configure the cell
        
        //AGGIUNGO L'IMG NELLA CELLA (clotheImage è stato instanziato nella collectionViewCell)
//        cell.clotheImage.image = UIImage(named: tShirts[indexPath.row].img)
        
        //CONFIGURO L'IMG DEL VESTITO NELLA CELLA:
//        cell.clotheImage.frame.size.width = cell.frame.size.width
//        cell.clotheImage.frame.size.height = cell.frame.size.height
//        cell.clotheImage.contentMode = UIViewContentMode.scaleAspectFill  //anche scaleAspectFit, dipende da te cosa vuoi
//        cell.clotheImage.clipsToBounds = true
//        cell.clipsToBounds = true   //PROVARE SENZA QUESTO CELL.CLIPSTOBOUNDS SE VA!!
//
        //AGGIUNGO BORDO ALLA CELLA:
//        cell.layer.borderWidth = 1
    
        return cell
    }

    
    
    
    
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

//DA MODIFICARE I NOMI DI OGNI VARIABILE FACENDO ATTENZIONE CHE CLOTHES 

//    extension WardrobeCollectionViewController: UICollectionViewDelegateFlowLayout{
//
//        var collectionViewMargin: UIEdgeInsets{
//            return UIEdgeInsets (top: 15, left: 10, bottom: 15, right: 10)
//        }
//
//        var collectionViewSpacing: (CGFloat){
//            return (CGFloat(20))
//        }
//
//
//
//
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//            let paddingSpace = (collectionViewMargin.left+collectionViewMargin.right) + collectionViewSpacing * CGFloat(clothes?.count)
//
//            print (collectionViewMargin)
//
//            let viewWidth = collectionView.frame.size.width
//
//
//            let itemSize = (viewWidth - paddingSpace)/3
//
//            print (itemSize)
//
//            return CGSize(width: itemSize, height: itemSize)
//        }
//
//
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//            return collectionViewMargin
//        }

        
//    }

