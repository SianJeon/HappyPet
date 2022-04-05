<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="/WEB-INF/views/admin/market/market-nav.jsp" />
        <div class="p-5">
            <div class="text-center"><h1>상품 등록</h1></div>
            <form action="admin/market/insertProduct" enctype = "multipart/form-data" method="post">
            <div class="row">
                <div class = "col-2" style="padding-top : 25px;">
                    <select class="form-select" style="height :33px; text-align: center;"
                     name = "marketVo.category">
                        <option value="feed">사료</option>
                        <option value="snack">간식</option>
                        <option value="hygiene">위생</option>
                        <option value="clothing">의류 / 악세서리</option>
                    </select>
                </div>
                <div class = "col-10">
                    제목    <input type="text" class="form-control" name="marketVo.productName"
                                placeholder="제품 이름을 입력해 주세요" 
                                required oninvalid="this.setCustomValidity('제품 이름을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    회사    <input type="text" class="form-control" name="marketVo.company" 
                                placeholder="제품 회사를 입력해주세요" 
                                required oninvalid="this.setCustomValidity('제품 회사를 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
                    <div class="col-3">
                    가격    <input type="number" class="form-control" name="marketVo.productPrice"
                                
                                placeholder="제품 가격을 입력해주세요"
                                required oninvalid="this.setCustomValidity('제품 가격을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
                <div class="col-3">
                    수량    <input type="number" class="form-control" name="marketVo.productStock"
                                placeholder="제품 수량을 입력해 주세요"
                                required oninvalid="this.setCustomValidity('제품 수량을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
                <div class="col-3">
                    할인율    <input type="number" class="form-control" name="marketVo.discount"
                                placeholder="할인율을 입력해 주세요">
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    사진    <input multiple type="file" class="form-control" name="marketFileVo.mainImg"
                                required oninvalid="this.setCustomValidity('제품 사진을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
                <div class="col-6">
                    상세사진 <input type="file" class="form-control" name="marketVo.detailImg"
                                
                                required oninvalid="this.setCustomValidity('제품 상세 사진을 입력해 주세요')" 
                                oninput="setCustomValidity('')">
                </div>
            </div>
                <button class="btn btn-primary w-100 py-3 mt-5" type="submit">제품 등록</button>
            </form>
        </div>
        
    