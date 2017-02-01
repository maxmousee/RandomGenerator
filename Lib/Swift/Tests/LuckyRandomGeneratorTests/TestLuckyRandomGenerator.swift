import XCTest
import Foundation

@testable import LuckyRandomGenerator

class TestLuckyRandomGenerator: XCTestCase {

  static var allTests: [(String, (TestLuckyRandomGenerator) -> () throws -> Void)] {
      return [
          ("testPositiveLotteryTicketsGenerator", testPositiveLotteryTicketsGenerator),
          ("testZeroLotteryTicketsGenerator", testZeroLotteryTicketsGenerator),
          ("testNegativeLotteryTicketsGenerator", testNegativeLotteryTicketsGenerator),
          ("testPositiveLengthStringGenerator", testPositiveLengthStringGenerator),
          ("testNegativeLengthStringGenerator", testNegativeLengthStringGenerator),
          ("testZeroLengthStringGenerator", testZeroLengthStringGenerator),
          ("testDifferentStringGenerator", testDifferentStringGenerator)
      ]
  }

  var luckyGenerator : LuckyRandomGenerator!

  override func setUp() {
    super.setUp()
    luckyGenerator = LuckyRandomGenerator()
  }

  func testPositiveLotteryTicketsGenerator() {
    let shouldGenerateCountNumbers = 6
    let luckyNumbers = luckyGenerator.generateLotteryTicket(numbersToGenerate: shouldGenerateCountNumbers)
    luckyGenerator.printSetOfTickets(tickets: luckyNumbers)
    XCTAssertEqual(luckyNumbers.count, shouldGenerateCountNumbers)
  }

  func testZeroLotteryTicketsGenerator() {
    let shouldGenerateCountNumbers = 0
    let luckyNumbers = luckyGenerator.generateLotteryTicket(numbersToGenerate: shouldGenerateCountNumbers)
    XCTAssertEqual(luckyNumbers.count, shouldGenerateCountNumbers)
  }

  func testNegativeLotteryTicketsGenerator() {
    let shouldGenerateCountNumbers = -2
    let luckyNumbers = luckyGenerator.generateLotteryTicket(numbersToGenerate: shouldGenerateCountNumbers)
    XCTAssertEqual(luckyNumbers.count, 0)
  }

  func testPositiveLengthStringGenerator() {
    let stringLen = 10
    let aRandomString = String().generateRandomString(length: stringLen)
    print("Generated String: " + aRandomString)
    XCTAssertEqual(aRandomString.characters.count, stringLen)
  }

  func testDifferentStringGenerator() {
    let stringLen = 10
    let randomStringA = String().generateRandomString(length: stringLen)
    let randomStringB = String().generateRandomString(length: stringLen)
    print("Generated String A: " + randomStringA)
    print("Generated String B: " + randomStringB)
    XCTAssertNotEqual(randomStringA, randomStringB)
  }

  func testNegativeLengthStringGenerator() {
    let stringLen = -1
    let aRandomString = String().generateRandomString(length: stringLen)
    XCTAssertEqual(aRandomString.characters.count, 0)
  }

  func testZeroLengthStringGenerator() {
    let stringLen = 0
    let aRandomString = String().generateRandomString(length: stringLen)
    XCTAssertEqual(aRandomString.characters.count, 0)
  }
}
