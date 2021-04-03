import XCTest
@testable import DesignPatterns

class testAbstractFactoryPattern: XCTestCase {

    func testAbstractFactoryMethod() {
        
        #if teacherMode
        let clientCode = ClientCodeAbstractFactory(factoryType: TeacherAuthViewFactory.self)
        #else
        let clientCode = ClientCodeAbstractFactory(factoryType: StudentAuthViewFactory.self)
        #endif
        
        /// Present LogIn flow
        clientCode.presentLogin()
        print("Login screen has been presented")
        
        /// Present SignUp flow
        clientCode.presentSignUp()
        print("Sign up screen has been presented")
    }

}
