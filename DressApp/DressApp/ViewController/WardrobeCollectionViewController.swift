//
//  WardrobeCollectionViewController.swift
//  DressApp
//
//  Created by Giulio Izzo on 15/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class WardrobeCollectionViewController: UICollectionViewController, GetImageDelegate {
    
    func didChooseTShirtImage(tShirt: TShirt) {
        tShirtImages.append(tShirt)
    }
    
    func didChooseShirtImage(shirt: Shirt) {
        shirtImages.append(shirt)
    }
    
    func didChooseSweaterImage(sweater: Sweater) {
        sweaterImages.append(sweater)
    }
    
    func didChooseDress(dress: Dress) {
        dressImages.append(dress)
    }
    
    func didChooseTrousers(trousers: Trousers) {
        trousersImages.append(trousers)
    }
    
    func didChooseShoes(shoes: Shoes) {
        shoesImages.append(shoes)
    }
    
    func didChooseSkirt(skirt: Skirt) {
        skirtsImages.append(skirt)
    }
    
    
    
    var tShirtImages: [TShirt] = []
    var shirtImages: [Shirt] = []
    var sweaterImages: [Sweater] = []
    var dressImages: [Dress] = []
    var trousersImages: [Trousers] = []
    var shoesImages: [Shoes] = []
    var skirtsImages: [Skirt] = []
    
    var segueID = "toAddClothe"
    var segueInfoID = "toInfo"
    
    var cellPushed: Int?
    var clothes: [Any] = []     //VETTORE DOVE METTERE I VESTITI(SE MAGLIETTE, PANTALONI ETC.)
    
    var newTShirt: TShirt?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        maglia.append(prova1)
//        pantalone.append(provaPantalone)
        

        // Set the title of the views basing on the cell pushed in the previously table view
        if cellPushed == 0 {
            self.title = "T-Shirts"
            tShirtImages = Wardrobe.shared.getTShirts()
        }
        else if cellPushed == 1 {
            self.title = "Shirts"
            shirtImages = Wardrobe.shared.getShirts()
        }
        else if cellPushed == 2 {
            self.title = "Sweaters"
            sweaterImages = Wardrobe.shared.getSweaters()
        }
        else if cellPushed == 3 {
            self.title = "Dresses"
            dressImages = Wardrobe.shared.getDresses()
        }
        else if cellPushed == 4 {
            self.title = "Trousers"
            trousersImages = Wardrobe.shared.getTrousers()
        }
        else if cellPushed == 5 {
            self.title = "Shoes"
            shoesImages = Wardrobe.shared.getShoes()
        }
        else {
            self.title = "Skirts"
            skirtsImages = Wardrobe.shared.getSkirts()
        }
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
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
        if cellPushed == 0 {
            return tShirtImages.count
        }
        else if cellPushed == 1 {
            return shirtImages.count
        }
        else if cellPushed == 2 {
            return sweaterImages.count
        }
        else if cellPushed == 3 {
            return dressImages.count
        }
        else if cellPushed == 4 {
            return trousersImages.count
        }
        else if cellPushed == 5 {
           return shoesImages.count
        }
        else {
            return skirtsImages.count
        }
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WardrobeCollectionViewCell else{
            return WardrobeCollectionViewCell()
        }
        // Configure the cell
        
        //AGGIUNGO L'IMG NELLA CELLA (clotheImage è stato instanziato nella collectionViewCell)
        //cell.clotheImage.image = UIImage(named: imgs[indexPath.row])
        
//        var maglia = TShirt(color: .indigo, material: .cashmere, description: nil, elegant: true, model: .long)

        
//        cell.clotheImage.image = UIImage(named: "Batman")
        
        
//        var tShirtWardrobe = Wardrobe.shared.getTShirts()
//        var shirtWardrobe = Wardrobe.shared.getShirts()
//        var sweaterWardrobe = Wardrobe.shared.getSweaters()
//        var dressWardrobe = Wardrobe.shared.getDresses()
//        var trousersWardrobe = Wardrobe.shared.getTrousers()
//        var shoesWardrobe = Wardrobe.shared.getShoes()
//        var skirtsWardrobe = Wardrobe.shared.getSkirts()
        
        
//
//        var maglia = TShirt(color: .black, material: .cashmere, description: nil, elegant: true, model: .long)
//        cell.clotheImage.image = maglia.image()
        
        if cellPushed == 0 {
          cell.clotheImage.image = tShirtImages[indexPath.row].image()
        }
        else if cellPushed == 1 {
            cell.clotheImage.image = shirtImages[indexPath.row].image()
        }
        else if cellPushed == 2 {
            cell.clotheImage.image = sweaterImages[indexPath.row].image()
        }
        else if cellPushed == 3 {
            cell.clotheImage.image = dressImages[indexPath.row].image()
        }
        else if cellPushed == 4 {
            cell.clotheImage.image = trousersImages[indexPath.row].image()
        }
        else if cellPushed == 5 {
            cell.clotheImage.image = shoesImages[indexPath.row].image()
        }
        else if cellPushed == 6{
            cell.clotheImage.image = skirtsImages[indexPath.row].image()
        }
        
        
//        CONFIGURO L'IMG DEL VESTITO NELLA CELLA:
        cell.clotheImage.frame.size.width = cell.frame.size.width
        cell.clotheImage.frame.size.height = cell.frame.size.height
        cell.clotheImage.contentMode = UIViewContentMode.scaleAspectFit  //anche scaleAspectFit, dipende da te cosa vuoi
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


        var numberOfItems: CGFloat {
            if cellPushed == 0 {
                return CGFloat(tShirtImages.count)
            }
            else if cellPushed == 1 {
                return CGFloat(shirtImages.count)
            }
            else if cellPushed == 2 {
                return CGFloat(sweaterImages.count)
            }
            else if cellPushed == 3 {
                return CGFloat(dressImages.count)
            }
            else if cellPushed == 4 {
                return CGFloat(trousersImages.count)
            }
            else if cellPushed == 5 {
                return CGFloat(shoesImages.count)
            }
            else {
                return CGFloat(skirtsImages.count)
            }
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let paddingSpace = (collectionViewMargin.left + collectionViewMargin.right) + collectionViewSpacing 


            let viewWidth = collectionView.frame.size.width


            let itemSize = (viewWidth - paddingSpace)/3


            return CGSize(width: itemSize, height: itemSize)
        }


        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return collectionViewMargin
        }

        
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == segueID {
                if let addVC = segue.destination as? AddClothesTableViewController {
                    if let x = cellPushed {
                        addVC.dressCategory = x
                        addVC.getImageDelegate = self
                    }
                }
            } else if segue.identifier == segueInfoID{
                if let infoVC = segue.destination as? DressInfoTableViewController{
                    if let x = cellPushed{
                    infoVC.dressCategory = x
                    }
                    if let cellRowSelected =
                        collectionView?.indexPathsForSelectedItems?.last?.row{
                        infoVC.cellRowSelected = cellRowSelected

                    }

                }
            }
        }
        
}

