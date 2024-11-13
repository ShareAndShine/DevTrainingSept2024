// special annotation that converts a normal class to custom API
@RestResource(urlMapping='/productcount/*')
global with sharing class ProductWebService {
    
    @HttpGet    
    global static Integer getProductCount() {

        Integer iRequestCount;

        AggregateResult products = [SELECT COUNT(Id) productCount FROM Product2];
        return (Integer)products.get('productCount');
    }

   

}