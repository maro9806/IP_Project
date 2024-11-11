<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="footer mt-0">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <h5>About Us</h5>
        <p>면접의 고수 - 더 나은 면접 준비를 위한 플랫폼</p>
      </div>
      <div class="col-md-6">
        <h5>Contact</h5>
        <p>Email: info@example.com</p>
      </div>
    </div>
    <hr>
    <div class="text-center">
      <p>&copy; 2024 면접의 고수. All rights reserved.</p>
    </div>
  </div>
</footer>
<style>
  /* 가로 이미지 스타일 */
  .banner {
    text-align: center; /* 이미지를 가운데 정렬 */
    width:100%;
    height: 200px; /* 자동으로 높이 조정 */
    background-image:url('../static/img/ai-banner11.png');
    background-size: cover; /* 배경 이미지가 요소를 꽉 채우도록 설정 */
    background-position: center; /* 배경 이미지가 가운데에 위치하도록 설정 */
    background-repeat: no-repeat; /* 이미지 반복을 막음 */
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  /* Jumbotron styling */
  .jumbotron {
    background-image: url('/resources/static/img/ai-banner11.png');
    background-size: cover; /* 배경 이미지가 요소를 꽉 채우도록 설정 */
    background-position: center; /* 배경 이미지가 가운데에 위치하도록 설정 */
    background-repeat: no-repeat; /* 이미지 반복을 막음 */
    color: #fff;
    border-radius: 10px;
    padding: 30px;
    margin-left: 10%;
    margin-right: 10%;
    margin-top:70px;
  }

  .jumbotron h1 {
    font-size: 2.5rem;
  }

  .jumbotron p {
    font-size: 1.2rem;
  }

  .content {
    padding:50px 10% 0 10%;
    display:flex;
    flex-direction: column;
    align-items:flex-start;
    font-family:'Noto Sans KR';
  }

  .title{
    font-weight: bold;
    text-align:center;
    margin-top:20px;
    font-family:'Noto Sans KR';
    /* position:relative;
    bottom:150px; */
  }

  .h-title{
    font-weight: bold;
    text-align:left;
    font-family:'Noto Sans KR';
  }
  .container{
    display:flex;
    gap:50px;
    justify-content: center;
    margin: 40px auto;
  }

  .progress.w-100.mb-5{
    height:18px;
  }
  .progress .progress-bar.bar {
    text-align:center;
    height: 100%; /* 프로그레스 바 높이 설정 */
  }

  .progress .progress-bar.bar{
    background-color: rgb(108 124 228);
  }

  .progress .progress-bar.stage{
    background-color: rgb(255 255 255);
    border-radius:5%;
    color: #605a5a;
    border: 3px solid #cfcfcf;
  }

  #box1{
    background-color: rgb(121 220 114);
    border:none;
    color: white;
    height:250px;
    font-family: 'Noto Sans KR', sans-serif;
  }

  #box1:hover {
    background-color: rgb(102, 173, 52);
  }

  #box2{
    background-color: rgb(117 201 233);
    border:none;
    color:white;
    height:250px;
    font-family: 'Noto Sans KR', sans-serif;
  }

  #box2:hover{
    background-color: rgb(69 165 202);
  }

  .box-title{
    margin:50px;
  }

  #next{
    background-color: #6c7ce4;
    border-color: #6c7ce4;
  }
  #previous{
    background-color: #6c7ce4;
    border-color: #6c7ce4;
  }

  table td{
    padding: 10px 0;
  }




  /* 모달 창 스타일 */
  .modal {
    display: none; /* 기본적으로 숨김 */
    position: fixed; /* 화면에 고정 */
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    z-index: 1; /* 모달이 다른 요소들 위에 뜨도록 설정 */
  }

  .modal-content {
    background-color: #fff;
    margin: 15% auto; /* 화면 중앙으로 위치 조정 */
    padding: 0 20px 20px 20px;
    border-radius: 8px;
    width: 80%; /* 팝업 창 크기 */
    max-width: 800px;
  }

  .close {
    color: #000000;
    margin-left: 97%;
    font-weight: bold;
    font-size: 25px;
  }

  .close:hover,
  .close:focus {
    color: darkred;
    cursor: pointer;
  }




  /* CSS */
  .footer {
    background-color: #333;
    color: white;
    padding: 20px 0;
    position: relative;
    bottom: 0;
    width: 100%;
  }

  .footer .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 15px;
  }

  .footer-left p {
    margin: 0;
  }

  .footer-right ul {
    list-style: none;
    display: flex;
    gap: 15px;
    padding: 0;
  }

  .footer-right ul li {
    display: inline;
  }

  .footer-right ul li a {
    color: white;
    text-decoration: none;
    font-size: 14px;
  }

  .footer-right ul li a:hover {
    text-decoration: underline;
  }

  /* Responsive Design */
  @media (max-width: 768px) {
    .footer .container {
      flex-direction: column;
      text-align: center;
    }

    .footer-right ul {
      flex-direction: column;
      gap: 10px;
    }
  }

</style>