@isTest
private class ProductInfoWebserviceTest {

@isTest
    static void testGetProductInfoByCode() {
        // Create a test product
        Product2 testProduct = new Product2(
            Name = 'Test Product',
            ProductCode = 'TEST123',
            Description = 'This is a test product',
            Family = 'Hardware',
            IsActive = true
        );
        insert testProduct;

        System.runAs(new User(Id = UserInfo.getUserId())) {
            // Call the web service method
            Test.startTest();
            List<ProductInfo> result = ProductInfoWebservice.getProductInfoByCode();
            Test.stopTest();

            // Assertions
            System.assertEquals(1, result.size(), 'Expected one product to be returned');
            ProductInfo productInfo = result[0];
            System.assertEquals('Test Product', productInfo.name, 'Name should match');
            System.assertEquals('Hardware', productInfo.family, 'Family should match');
            System.assertEquals('Active', productInfo.status, 'Status should be Active');
        }
    }
}