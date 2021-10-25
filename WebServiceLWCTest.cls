@isTest
public with sharing class WebServiceLWCTest {
    public static testmethod void test1(){
        test.startTest();
        
        WebServiceLWC.WeatherData.performCallout('London');

        test.stopTest();
        
    }
}
