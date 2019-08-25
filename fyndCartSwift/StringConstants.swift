//
//  StringConstants.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 23/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import Foundation


struct apiURLs {
    static let allCategoriesURL = "http://demo3325365.mockable.io/category"
    static let jacketsURL = "http://demo3325365.mockable.io/jackets"
    static let polosURL = "http://demo3325365.mockable.io/polos"
    static let shirtsURL = "http://demo3325365.mockable.io/shirts"
    static let sweatShirtsURL = "http://demo3325365.mockable.io/sweatshirt"
}

struct SectionTitles {
    static let jackets = "Jackets"
    static let polos = "Polos"
    static let shirts = "Shirts"
    static let sweatshirts = "Sweatshirts"
}

struct TableViewCellIds {
    static let defaultCellId = "defaultCellId"
    static let productSectionHeaderTableViewCell = "ProductSectionHeaderTableViewCell"
    static let productSectionHeaderSegementedTableViewCell = "ProductSectionHeaderSegementedTableViewCell"
    static let listCollectionViewTableViewCell = "ListCollectionViewTableViewCell"
}

struct CollectionViewIds {
    static let productColletionViewCell = "ProductColletionViewCell"
}

struct NotificationsNames {
    static let sortByName = "sortByName"
    static let sortByPrice = "sortByPrice"
}

struct ViewControllersIds {
    static let showImageViewController = "ShowImageViewController"
}

struct ImagesArrayLinks {
    
    static let shirtsArray = [Shirts.shirt1,Shirts.shirt2,Shirts.shirt3,Shirts.shirt4,Shirts.shirt5,Shirts.shirt6,Shirts.shirt7,Shirts.shirt8,Shirts.shirt9,Shirts.shirt10,Shirts.shirt11,Shirts.shirt11,Shirts.shirt12,Shirts.shirt13,Shirts.shirt14,Shirts.shirt15,Shirts.shirt16,Shirts.shirt17,Shirts.shirt18,Shirts.shirt19,Shirts.shirt20,Shirts.shirt21,Shirts.shirt22,Shirts.shirt23,Shirts.shirt24,Shirts.shirt25,Shirts.shirt26]
    
    static let polosArray = [Polos.polo1,Polos.polo2,Polos.polo3,Polos.polo4,Polos.polo5,Polos.polo6,Polos.polo7,Polos.polo8,Polos.polo9,Polos.polo10,Polos.polo11]
    
    static let jacketsArray = [Jackets.jacket1,Jackets.jacket2,Jackets.jacket3,Jackets.jacket4,Jackets.jacket5,Jackets.jacket6,Jackets.jacket7,Jackets.jacket8,Jackets.jacket9,Jackets.jacket10,Jackets.jacket11,Jackets.jacket12,Jackets.jacket13,Jackets.jacket14]
    
    
    struct Shirts {
        static let shirt1 = "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt2 = "https://images.unsplash.com/photo-1542061651-ede3615bcd04?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt3 = "https://images.unsplash.com/photo-1489345745021-740d36bbda21?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt4 = "https://images.unsplash.com/photo-1497339100210-9e87df79c218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt5 = "https://images.unsplash.com/photo-1551789298-1c7b020e15ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt6 = "https://images.unsplash.com/photo-1552045058-11f1c8a4da15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt7 = "https://images.unsplash.com/photo-1497948408037-3f93f842fc5f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt8 = "https://images.unsplash.com/photo-1543471432-2702be025c10?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt9 = "https://images.unsplash.com/photo-1559718062-108b9039734b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt10 = "https://images.unsplash.com/photo-1538234369472-98ec86859ffb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt11 = "https://images.unsplash.com/photo-1485488245237-8583e6f6df6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt12 = "https://images.unsplash.com/photo-1562755339-620b6d0640c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt13 = "https://images.unsplash.com/photo-1494228766058-1430438d10fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt14 = "https://images.unsplash.com/photo-1473106995954-101fc128abc3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt15 = "https://images.unsplash.com/photo-1520048480367-7a6a4b6efb2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt16 = "https://images.unsplash.com/photo-1542984393-3d5ce67e417d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt17 = "https://images.unsplash.com/photo-1478713361921-04b7ac591569?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt18 = "https://images.unsplash.com/photo-1495708188978-c9327285bed7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt19 = "https://images.unsplash.com/photo-1491972690050-ba117db4dc09?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt20 = "https://images.unsplash.com/photo-1482555423828-633062a68666?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt21 = "https://images.unsplash.com/photo-1495064955155-9f2b086b2c4a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt22 = "https://images.unsplash.com/photo-1457727123450-0a8ed4777e77?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt23 = "https://images.unsplash.com/photo-1471424189333-0c3f7e0e255d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt24 = "https://images.unsplash.com/photo-1482697749964-bb7784da1190?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt25 = "https://images.unsplash.com/photo-1496906462649-3d15f67ba478?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let shirt26 = "https://images.unsplash.com/photo-1538880255652-ee8c3bec319e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
    }
    
    struct Polos {// 10
        static let polo1 = "https://images.unsplash.com/photo-1565562193381-576c27829023?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo2 = "https://images.unsplash.com/photo-1561526116-e2460f4d40a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo3 = "https://images.unsplash.com/photo-1562696675-17cb0e43ebb7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo4 = "https://images.unsplash.com/photo-1542776575-f1623249ce85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo5 = "https://images.unsplash.com/photo-1562862484-1453cbaf4a57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo6 = "https://images.unsplash.com/photo-1547841022-b558accc7ef8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo7 = "https://images.unsplash.com/photo-1525537452452-e8594350d0cb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo8 = "https://images.unsplash.com/photo-1556441708-814416d76cc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo9 = "https://images.unsplash.com/photo-1559042598-0c10f3025eba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo10 = "https://images.unsplash.com/photo-1550400689-0ea61ea41e07?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let polo11="https://images.unsplash.com/photo-1561284861-55d5ef9316eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
    }
    
    struct Jackets {//14
        static let jacket1 = "https://images.unsplash.com/photo-1551028719-00167b16eac5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket2 = "https://images.unsplash.com/photo-1521223890158-f9f7c3d5d504?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket3 = "https://images.unsplash.com/photo-1495105787522-5334e3ffa0ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket4 = "https://images.unsplash.com/photo-1520975916090-3105956dac38?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket5 = "https://images.unsplash.com/photo-1530645728336-ac5b9b630f1c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket6 = "https://images.unsplash.com/photo-1554440693-c57c97512100?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket7 = "https://images.unsplash.com/photo-1554440693-9b4eab5871c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket8 = "https://images.unsplash.com/photo-1542327897-d73f4005b533?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket9 = "https://images.unsplash.com/photo-1548712370-806c729f72ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket10 = "https://images.unsplash.com/photo-1564169736229-e28db6464d75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket11 = "https://images.unsplash.com/photo-1564985873756-03871e16b9d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket12 = "https://images.unsplash.com/photo-1552160827-65aa225ea330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket13 = "https://images.unsplash.com/photo-1548567137-f89f1813f523?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
        static let jacket14 = "https://images.unsplash.com/photo-1501518721094-4a68edf38f97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
    }
}
