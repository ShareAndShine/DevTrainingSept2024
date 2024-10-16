@RestResource(urlMapping='/productinfoservice/*')
global class ProductInfoWebservice {
    
    @HttpGet
    global static List<ProductInfo> getProductInfoByCode()
    {
        String productCode = RestContext.request.params.get('code'); // Will get code from URL  
        List<Product2> products = [SELECT Name, Description, Family, IsActive FROM Product2 WHERE ProductCode = :productCode];
        
        
        // Scenario #1: Return only one product
        /*if (products.size() > 0) {
            ProductInfo productInfo = new ProductInfo();
            productInfo.name = products[0].Name;
            productInfo.family = products[0].Family;
            productInfo.status = products[0].IsActive ? 'Active' : 'Inactive';

            return productInfo;
        } 
        else {
            throw new MyException('Product with given code not found');
        }*/


        // Scenario 2 : Return all match products but only Name and Id info were shared

        // Scenario 3: Return all matching products with name, description , family and Status
        List<ProductInfo> lstproductInfo = new List<ProductInfo>();

        for(Product2 prodRec :products)
        {   
            ProductInfo productInfo = new ProductInfo(); // create a class that hold name, desc, family and status
            
            // read the data and transfer it into another class that hold name, desc and status
            productInfo.name = prodRec.Name;
            productInfo.family = prodRec.Family;
            productInfo.status = prodRec.IsActive ? 'Active' : 'Inactive';

            lstproductInfo.add(productInfo); // add to the collection 


        }
        return lstproductInfo;
    }

   // post method to insert product data into the org
   @HttpPost
   global static String insertProductInfo(String productCode, String productName, String productDescription, String productFamily)
   {
        // with the input parameters upsert data into product object
        Product2 prod = new Product2();
        prod.Name = productName;
        prod.Description = productDescription;
        prod.Family = productFamily;
        prod.IsActive = true;

        // check if the product exists using product code and accordingly insert or update
        prod.ProductCode = productCode;
        upsert prod; // upsert takes list as input

        return prod.Id;

   }

    global class ProductInfo {
        public String name;
        public String description;
        public String family;
        public String status;
    }

    public class MyException extends Exception {}
}