import UIKit


enum StaffEnstruction:Error{
    case moreStaff
    case complains
    
}
protocol User {
    var name : String { get }
}
struct Employee {
    
    var name : String
    var salary : Int
    
    
    
    
    
    static func getTheSalarys(salarys: [Int]) throws -> Int {
        var counterSalary = 0
        for salary in salarys {
            counterSalary += salary
        }
        
        guard counterSalary < 35000 else {
            throw StaffEnstruction.moreStaff
        }
        return counterSalary
    }
    
}

struct CustmerComplainAndSuggestions {
    
    var complaints:[String]
    var suggestions:[String]
    
    
    func costmerComplainAndSuggestions(numberComplain:Int) {
        
        let number = 1
        
        for suggestion in suggestions {
       
            
            if numberComplain >= number {print(complaints)
                
            } else{
            print(suggestion,complaints)
                
        
        }
    }
        
}
}
class ProjectMangment {
    var sealesOnline:Int?
    var salesIncom: Int?
    var variableCost:Int?
    var constsntCost:Int?
    var revenu:Int?
    var totalCost:Int?
    var lowIncom:Int?
    
    var descrption : String {
        return "our sales online are \(sealesOnline ?? 0 ) and our sales income \(salesIncom ?? 0)"
    }
    
    
    init(sealesOnline:Int?, salesIncome:Int?,variableCost:Int?,constsntCost:Int?,totalCost:Int?,revenu:Int?,lowIncom:Int?){
        self.sealesOnline = sealesOnline
        self.salesIncom = salesIncome
        self.variableCost = variableCost
        self.constsntCost = constsntCost
        self.totalCost = totalCost
        self.revenu = revenu
        self.lowIncom = lowIncom
        
    }
    func calculatRevenu (sealesOnline:Int,salesIncom:Int) -> Int{
        let revenu = sealesOnline + salesIncom
        return revenu
    }
    
    
    func calculatTotalCost(variableCost:Int , constsntCost:Int) -> Int {
        let totalCost = variableCost + constsntCost
        return totalCost
    }
    
    func netProfit(revenu: Int,totalCost:Int) -> Int  {
        let Netprofite =   revenu - totalCost
        return Netprofite
    }
}
class Manager: ProjectMangment {
    
    func sum(x:Int,y:Int,z:Int) -> Int {
        
        return x + y + z
    }
    
    func devide(x:Int,shops:Int) -> Int{
        
        return x / shops
    }
    func choicbad(x:Int) -> String {
        guard (x > 5000 ) else
        {   return "*<>*<>* your income very low* <>*<>*\n <><> plese follow instruction <><>\n 1-cut your loses\n 2-minimize staff\n 3-eliminate battel nick\n 4-lesson to costemer complain\n 5-find the invesible factor"
        }
        return "you did a great job keep the good work"
    }
    
}



var emloyeeStaffExpert = Employee(name: "faiz", salary:10000)
var emloyeeStaffLeader = Employee(name: "rmdan", salary:9000)
var emloyeeStafconsoltent = Employee(name:"hazem", salary:8000)
var emloyeeStaffspeshlist = Employee(name:"qassem", salary:7000)




var shopOne = ProjectMangment(sealesOnline: 23000, salesIncome: 22000, variableCost: nil, constsntCost: nil, totalCost: nil, revenu: nil, lowIncom: nil)
var shopOneTotalCost = shopOne.calculatTotalCost(variableCost: 9000, constsntCost: 34000)
var shopRevenuOne = shopOne.calculatRevenu(sealesOnline: 23000, salesIncom: 22000)
var shopOneNettProfit = shopOne.netProfit(revenu: shopRevenuOne,totalCost: shopOneTotalCost)


let projectName = "manege your busniess"
let description = "It ia an applocaition that help you runing your busnies by ussing calculated methods and show you reports and more . "
print(projectName)
print(description)

print("----------------------------------------------------")

var ourEmployees = [emloyeeStaffExpert, emloyeeStaffLeader, emloyeeStafconsoltent, emloyeeStaffspeshlist]

print("our employees:")
for employee in ourEmployees {
    print("\(employee.name) and his salary: \(employee.salary)")
}

print("---------------------------------------------------")


//getTheSalarys

var sumSalarys : Int = 0
do {
    sumSalarys = try Employee.getTheSalarys(salarys: [emloyeeStaffExpert.salary,emloyeeStaffLeader.salary,emloyeeStafconsoltent.salary,emloyeeStaffspeshlist.salary])
    
}
catch StaffEnstruction.moreStaff {
    print("employee must not be over 35000$ speshaly when your income below the recomnded avrege")
}
print(shopOne.descrption)
print("This is the total cost for shop one = \(shopOneTotalCost)$")
print("This is the revenu for shop one = \(shopRevenuOne)$")
print("This is shop one Netprofite = \(shopOneNettProfit)$")
print("-----------------------------------------------------")
var shopTwo = ProjectMangment(sealesOnline: 32000, salesIncome: 27000, variableCost: nil, constsntCost: nil, totalCost: nil, revenu: nil, lowIncom: nil)
print(shopTwo.descrption)
var shopTwototalcostt = shopTwo.calculatTotalCost(variableCost: 23000, constsntCost: 34000)
var shopRevenuTwo = shopTwo.calculatRevenu(sealesOnline: 32000, salesIncom: 27000)
var shopTwoNettProfit = shopTwo.netProfit(revenu: shopRevenuTwo, totalCost: shopTwototalcostt)



print("This is the total cost for shop two = \(shopTwototalcostt)$")
print("This is revenu for shop two = \(shopRevenuTwo)$")
print("This is shop two Netprofite = \(shopTwoNettProfit)$")
print("-----------------------------------------------------")
var shopThree = ProjectMangment(sealesOnline: 25000, salesIncome: 20000, variableCost: nil, constsntCost: nil, totalCost: nil, revenu: nil, lowIncom: nil)
var shopThreeTotalCost = shopThree.calculatTotalCost(variableCost: 8000, constsntCost: 34000)
var shopRevenuThree = shopThree.calculatRevenu(sealesOnline: 25000, salesIncom: 20000)
var shopThreeNettProfit = shopThree.netProfit(revenu:shopRevenuThree, totalCost: shopThreeTotalCost)

print(shopThree.descrption)
print("This is the total cost for shop three  = \(shopThreeTotalCost)$")
print("This is the revenu for shop three  = \(shopRevenuThree)$")
print("This is shop three Net profite = \(shopThreeNettProfit)$")
print("-----------------------------------------------------")
var managerCalculate = Manager(sealesOnline: nil, salesIncome: nil, variableCost: nil, constsntCost: nil, totalCost: nil, revenu: nil, lowIncom: nil)
var managerSumCosts = managerCalculate.sum(x: shopThreeTotalCost, y: shopTwototalcostt, z: shopOneTotalCost)
var managerAvergeCosts = managerCalculate.devide(x: managerSumCosts, shops: 3)
print("This is the sum salaries staff = \(sumSalarys)$")
print("This is your averge total cost = \(managerAvergeCosts)$")

var managerSumProfit = managerCalculate.sum(x: shopThreeNettProfit, y: shopTwoNettProfit, z: shopOneNettProfit)
var managerAvergeProfit = managerCalculate.devide(x: managerSumProfit, shops: 3)
var choices = Manager(sealesOnline: nil, salesIncome: nil, variableCost: nil, constsntCost: nil, totalCost: nil, revenu: nil, lowIncom: nil)
var income = choices.choicbad(x: managerAvergeProfit)
print("This is your averge total Net profit = \(managerAvergeProfit)$")
print("-----------------------------------------------------")
print(income)
print("-----------------------------------------------------")
print("the best way to improve your busniss is to lesson to costmers.")

var importantcostomer = CustmerComplainAndSuggestions(complaints: ["Your shop need to be clean"], suggestions: ["open Delivery Service"])
var commonCpstmer = CustmerComplainAndSuggestions(complaints: ["the employees need traning"], suggestions: ["discont more often"])
importantcostomer.costmerComplainAndSuggestions(numberComplain: 2)
commonCpstmer.costmerComplainAndSuggestions(numberComplain: 2)



