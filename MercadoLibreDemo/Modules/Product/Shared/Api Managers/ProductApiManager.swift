//
//  ProductManager.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import Foundation
import Alamofire

class ProductApiManager {
    
    //MARK: - Private enums
    
    private enum Routes: String {
        case productList = "/sites/MLM/search"
        case productDetail = "/items"
    }
    
    //MARK: - Methods
    
    public func getProducts(searchQuery: String, completion: @escaping (_ response: ApiResponse<ProductResponse>) -> Void) {
        let params = ProductSearchRequest(query: searchQuery).asDictionary()
        let url = BaseApi.baseURL + Routes.productList.rawValue
        
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseDecodable { (response: AFDataResponse<ProductResponse>) in
            
            switch response.result {
            case .success(let productResponse):
                completion(.success(productResponse))
            case .failure(let error):
                completion(.error(error))
            }
        }
    }
    
    public func getProductDetail(id: String, completion: @escaping (_ response: ApiResponse<ProductDetail>) -> Void) {
        let params = ProductDetailRequest(id: id).asDictionary()
        let url = BaseApi.baseURL + Routes.productDetail.rawValue
        
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseDecodable { (response: AFDataResponse<[ProductDetailResponse]>) in
            
            switch response.result {
            case .success(let productResponse):
                
                guard let firstReponse = productResponse.first else {
                    let reason = AFError.ResponseValidationFailureReason.unacceptableStatusCode(code: 404)
                    completion(.error(AFError.responseValidationFailed(reason: reason)))
                    return
                }
                
                guard firstReponse.code == 200 else {
                    let reason = AFError.ResponseValidationFailureReason.unacceptableStatusCode(code: firstReponse.code)
                    completion(.error(AFError.responseValidationFailed(reason: reason)))
                    return
                }
                
                completion(.success(firstReponse.body))
                
            case .failure(let error):
                completion(.error(error))
            }
        }
    }
}
