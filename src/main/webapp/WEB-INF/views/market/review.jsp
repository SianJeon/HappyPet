<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
.avgScore
{
    position: relative;
    
}
.avgScore > div
{
    position: absolute;
    left : 30%;
    top : 15%;
    
}
.score-container
{
    border : 1px solid rgb(163, 163, 163);
    border-bottom: 3px solid black;
}
</style>
<div class = "row" style="width: 100%;">
    <div class = "col-3">
        <div>
            강아지종류
        </div>
        <div>
            개
        </div>
        <div>
            고양이
        </div>
        <div>
            새
        </div>
    </div>
    <div class = "container col-9 p-4">
        <div class = "row score-container mb-4 pb-4">
            <div class = "col-6">
                <div>
                    <div class = "row">
                        <div class = "col-5 avgScore">
                            <div>
                                <div>평점</div>
                                <div>
                                    <h1>4.7</h1>(count)  
                                </div>
                                ★★★★★                                      
                            </div>
                        </div>
                        <div class = "col-7">
                            <div class = "row">
                                <div class = "col-8">
                                    <c:forEach begin = "1" end = "5" varStatus = "i">
                                    <span class="progress mt-3 pr-2">
                                        <span> ${6 - i.index}  </span>
                                        <span class="progress-bar" role="progressbar" aria-valuenow="70" 
                                            aria-valuemin="0" aria-valuemax="100" 
                                            style="width : 100%">
                                        </span>
                                    <span>100</span>
                                    </span>
                                    </c:forEach>
                                </div>
                                <div class = "col-4">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "col-6">
                이미지를 촤라라라라라라락
            </div>
        </div>

        <div class="d-flex justify-content-between">
            <div>1515개의 후기</div>
            <div>정렬 최신순</div>
        </div>
        <div class="mt-2">
            <div class="" style = "border-bottom: 1px solid #d1d1d1; border-top: 3px solid black;">
                <div class = "row m-3">
                    <div class = "col-10">
                        <div class = "d-flex">
                            <div><img src="/img/logo.png" alt=""></div>
                            <div class="d-flex flex-column">
                                <div>
                                    <span>별점</span>
                                    <span>날짜</span>
                                    <span>날짜</span>
                                </div>
                                <div>
                                    <span>이름</span>
                                    <span>이름</span>
                                    <span>이름</span>
                                    <span>이름</span>
                                </div>
                            </div>
                        </div>
                        <div>
                            text-Comment
                        </div>
                    </div>
                    <div class = "col-2">
                        <div style = "cursor: pointer;">
                            <i class="fa-thin fa-thumbs-up">좋아용</i>
                        </div>
                    </div>
                </div>
                <div class = "">
                    ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                </div>
                
            </div>
        </div>
    </div>
</div>



<jsp:include page="/WEB-INF/views/include/footer.jsp" />