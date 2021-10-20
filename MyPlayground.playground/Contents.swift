import UIKit


struct Introduction{

    var Hi:String{return"\n Hi"
    }
    var Welcome:String{
    return "\n Welcome to our factory. this is information, types and application ..... :"
}
    var productlist:String{
        return"this list of our product and application for it : \n"}
        func printW(){
            print(Hi)
            print(Welcome)
        }
        func printList(){
        print(productlist)
    }
}
let intro : Introduction = Introduction()
intro.printW()

// to define gears and show it for user
protocol Gears {
    var type: String {get}
    var define: String {get}
    var application : [String] {get}
    var shape : String {get}

}

struct Types:Gears {

    var type: String

    var define: String

    var application: [String]

    var shape: String

    func discriPtionGear() {
     print("The \(type) gear is \(define) and the application for this type of gear is \(application). the surface of \(type) gears is \(shape)" )
        }
    }
// this class to looping prices monthly for every material
class TypesGear {
    var geartype : [Types] = []
    
    
    func materialPriceBrass<T>( Thismonth:T, Lastmonth:T)-> [T]{

    return  [Thismonth , Lastmonth ]
    }

    func materialPriceSteel <T> ( Thismonth:T, Lastmonth:T)-> [T]{
    return  [Thismonth,Lastmonth]
    }

    func materialPriceAlmunium <T> ( Thismonth:T, Lastmonth:T)-> [T]{
        return  [Thismonth,Lastmonth]
    }
    // monthly for brass
    func getPrices(monthlyPricesBrass:[[Double]]) {
      print("For the Brass Monthly price :")
        print("This is price for Last Month:")
        for (index,Thismonth) in monthlyPricesBrass.enumerated() {
            for price in Thismonth {
                if index == 0 {
                    print(price)
                }

            }
        }
        print("This is price for This Month:")
        for (index,Lastmonth) in monthlyPricesBrass.enumerated() {
            for price in Lastmonth {
                if index == 1 {
                    print(price)
                }
            }
        }
    }
//    monthly for almunium
    func getPrices(monthlyPricesAlmunium:[[Double]]) {
      print("For Almunium Monthly prices :")
        print("This is price for Last Month:")
        for (index,Thismonth) in monthlyPricesAlmunium.enumerated() {
            for price in Thismonth {
                if index == 0 {
                    print(price)
                }

            }
        }
        print("This is price for This Month:")
        for (index,Lastmonth) in monthlyPricesAlmunium.enumerated() {
            for price in Lastmonth {
                if index == 1 {
                    print(price)
                }
            }
        }
    }
//    monthly for steel
    func getPrices(monthlyPricesSteel:[[Double]]) {
        print("For the Steel Monthly prices :")
      
        print("This is price for Last Month:")
        for (index,Thismonth) in monthlyPricesSteel.enumerated() {
            for price in Thismonth {
                if index == 0 {
                    print(price)
                }

            }
        }
        print("This is price for This Month:")
        for (index,Lastmonth) in monthlyPricesSteel.enumerated() {
            for price in Lastmonth {
                if index == 1 {
                    print(price)
                }
            }
        }
    }
// loop for print discription
    func printdef(){
        for DiscriptionGea in geartype {
            DiscriptionGea.discriPtionGear()
        }
    }
}

var brassPrice: Set  = [4.7,4.6,4.8]
var steelPrice: Set = [2.2,2.1,2.4]
var almuniumPrice: Set = [ 0.6,0.8,0.9]
let typesGear = TypesGear()
let monthlyPriceBrass = typesGear.materialPriceBrass(Thismonth:[4.7,4.6,4.8] , Lastmonth: [4.1,4.2,4.3])
let monthlyPriceSteel = typesGear.materialPriceSteel(Thismonth:[2.2,2.1,2.4] , Lastmonth: [2.8,2.7,2.5])
let monthlyPriceAlmunium = typesGear.materialPriceAlmunium(Thismonth:[3.6,3.3,3.5] , Lastmonth: [3.0,3.1,2.9])

print()
let bevelGear: Types = Types(type:"Bevel", define: " :gears are cone-shaped gears whose teeth mesh together to transmit power between two shafts that are at an angle to each othe", application: ["differential drives","hand drill","rotorcraft"], shape:"cone\n")
let spurGear : Types = Types(type: "Spur", define: " :are the simplest type of gear.", application: ["marine engines","gear pumps","Gate controlling mechanisms"], shape: "straight-cut\n")
let helicalGear :Types = Types(type: "Helical", define: " :gears are similar to spur gears except that their teeth are cut at an angle ", application:["plastic industries","elevators","compressors"], shape: "angle cut teath\n")
let wormGear :Types = Types(type: "Worm Gear", define: " :A worm drive is a gear arrangement in which a worm (which is a gear in the form of a screw) meshes with a worm wheel (which is similar in appearance to a spur gear). The two elements are also called the worm screw and worm gear", application: ["presses", "rolling mills", "conveying engineering"], shape: "which is a gear in the form of a screw\n")
let rackAndPinion :Types = Types(type: "Rack and pinion", define: " :is a type of linear actuator that comprises a circular gear (the pinion) engaging a linear gear (the rack)", application: ["automotive market","factory in production line"], shape: "bar shaped gear\n")

var definGear : TypesGear = TypesGear()

print()
intro.productlist
definGear.geartype = [helicalGear,bevelGear,spurGear,wormGear,rackAndPinion]

definGear.printdef()

//list and price gear-------------------------------------------------------------------

print()
print("~~~For First step to order product it's chosen type of Gear and Material.\n note:the Cutting procces and material each of them has price. ")
// this class to show product and serch for it
class UpdatedPrice {
    
var brassGear : [String : Double] = ["Spur": 60.0,"Bevel": 65.0,"Helical":70.0,"Worm Gear":100.0,"Rack and pinion":120.0]
var almunumGear :[String:Double] = ["Spur":40.0,"Bevel":55.0,"Helical":50.0,"Worm Gear":70.0,"Rack and pinion":120.0]
var stealGear :[String:Double] = ["Spur":20.0,"Bevel":25.0,"Helical":30.0,"Worm Gear":60.0,"Rack and pinion":70.0]
//    This func to print updated price for mateial
    func printUpdatedPrices(){
        
for updatepricebrass in brassGear {
    brassGear[updatepricebrass.key] = (brassGear[updatepricebrass.key] ?? 0) * 4.2
    print(updatepricebrass)
}
for updatepricealmunum in almunumGear {
    almunumGear[updatepricealmunum.key] = (almunumGear[updatepricealmunum.key] ?? 0) * 3.5
    print(updatepricealmunum)
}
for updatepricesteal in stealGear {
    stealGear[updatepricesteal.key] = (stealGear[updatepricesteal.key] ?? 0) * 2.7
    print(updatepricesteal)
     }
  }
}

let updatedPrice: UpdatedPrice = UpdatedPrice()
print()
print("For Our prices we will be showing for you list of the matirial  monthely updated prices and you can compare it with last monthe: ")

typesGear.getPrices(monthlyPricesSteel: monthlyPriceSteel)
print()
typesGear.getPrices(monthlyPricesBrass: monthlyPriceBrass)
print()
typesGear.getPrices(monthlyPricesAlmunium: monthlyPriceAlmunium)

func getUnionPrice(){
let softmaterialPriceUion = brassPrice.union(almuniumPrice)
    print(softmaterialPriceUion)
}
// the struct to get ubpated price and show it for Today
struct PriceToday {
func getPriceTodayForBrass() {
    print("For today brass price is: 4.2SR per K")
}
func getPriceTodayForSteel() {
    print("For today steel price is: 2.7SR Per K")
}
func getPriceTodayForAlmunium() {
    print("For today Almunium price is : 3.5SR per K ")
}
}
let ppriceToday = PriceToday()
print()
print("\n ~~For Today prices of material :")

ppriceToday.getPriceTodayForBrass()
ppriceToday.getPriceTodayForAlmunium()
ppriceToday.getPriceTodayForSteel()
print()
print()
print("For cutting Procces with material price is :")
print()
print("1-For Brass :")
for (index,value) in updatedPrice.brassGear {
    print(index,value)
}
print()
print("2-For Steel :")
for (index,value) in updatedPrice.stealGear {
    print(index, value)
}
print()
print("3-For Almunium :")
for (index,value) in updatedPrice.almunumGear {
    print(index,value)
}
print()

var softMaterialPriceUion = brassPrice.union(almuniumPrice)
// this struct for get the max and min for prices
        struct MetiralMinMax {

    func getBrassMax(){
    print("The Max price monthly of Brass is :\(brassPrice.max() ?? 0)")
    }
    func getBrassMin(){
    print("The MIN price monthly of Brass is :\(brassPrice.min() ?? 0 )")
    }
    func getAlmuniumMax(){
    print("The MAX price monthle of Almunium is :\(almuniumPrice.max() ?? 0)")
    }
    func getAlmuniumMin(){
    print("The MIN price monthly of Almunium is :\(almuniumPrice.min() ?? 0 )")
    }
    func getSteelMax(){
    print("the MAX price monthly of Steel is :\(steelPrice.max() ?? 0)")
    }
    func getSteelMin(){
    print("The MIN price monthly of Steel is :\(steelPrice.min() ?? 0 )")
    }

}
    let MaxMin : MetiralMinMax = MetiralMinMax()
MaxMin.getAlmuniumMin()
MaxMin.getAlmuniumMax()
MaxMin.getBrassMax()
print("You can get the maximum and minmum by call for example : getSteelMax. ")

print()
print()

print("Now we have on our app calculator for the gear formula in 'mm' and get Module . Note: Maxmum Module is size 3.0 ")
print()
// This enum Show the Error for Order if it too large
enum ErrorSize :Error {
    case TooLargeGear
    
}

struct FormulaOfGear {

// this actual formula for calculate gear Dimentions
  static func gearFormela(numberOfTeath:Double, outDimeter:Double) throws -> Double {
    let resDP = ((outDimeter * numberOfTeath) / numberOfTeath + 2)
      let MOD = ((resDP)/numberOfTeath)
     guard MOD < 3 else { throw ErrorSize.TooLargeGear}

      return MOD}
}
// this exten to convert units to mm
    extension Double {
    var cm: Double { return self * 10.0 }
    var mm: Double { return self }
    var inch : Double { return self * 25.4 }
    var m: Double { return self * 1000.0}
    }

print("Mohammed is now using the calculator to calculate Formula of gears. With numbeTeath : 20.0.mm, and outDiamter : 52.0.mm . it's ready for cutting")
print()
print("Faris is now using the calculator to calculate Formula of gears. With numbeTeath : 7.00.mm, and outDiamter : 20.mm . and it's too large gear ")
print()
print("Khalid is now using the calculator to calculate Formula of gears. With numbeTeath : 7.00.inch, and outDiamter : 20.inch . will be confert result to mm and it's ready to cutting")
print()

do {
    let module = try FormulaOfGear.gearFormela(numberOfTeath: 7.00.inch , outDimeter: 20.inch)
    print("Ready for Cutting This size. you Gear Moudul is \(module)")
}catch ErrorSize.TooLargeGear  {
    print("sorry can't cut this gear it is too lagre. ")
}
print()
print("#Note:You can set daimention by : cm,mm,inch,m ")







