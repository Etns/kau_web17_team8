<?php

require_once("dbdata.php");

// Create connection
$conn = new mysqli($servername, $username, $password_db, $dbname);

// Check connection
if ($conn->connect_error)
{
	die("DB Connection failed: " . $conn->connect_error);
}

session_start();

// If the session vars aren't set, try to set them with a cookie
if (!isset($_SESSION['user_data']))
{
	if (isset($_COOKIE['user_data']))
	{
		$_SESSION['user_data'] = $_COOKIE['user_data'];
	}
}

if (isset($_SESSION['user_data']))
{
	//echo "logining";
	$login = true;

	$user_id = $_SESSION['user_data'];
	$user_id = mysqli_real_escape_string($conn, trim($user_id));

	$sql = 'SELECT * FROM member WHERE id="'.$user_id.'"';
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();

	// 로그인한 계정의 타입 저장
	$type = $row['mtype'];

	if ($type != 'admin')
	{
		echo '<script>alert("접근 권한이 없습니다.");location.href="notice.php";</script>';
		exit;
	}
}
else
{
	$login = false;

	echo '<script>alert("로그인 후 시도해주세요.");location.href="login.php";</script>';
	exit;
}

// post로 요청받은 데이터가 있을 경우
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
	$title = $_POST['title'];
	$content = $_POST['content'];

	// 날짜는 작성하는 현재 날짜로 설정
	$date = date('Y-m-d');

	if (empty($title) && !empty($content))
	{
		echo '<script>alert("제목을 입력하시오.");history.back(-1);</script>';
		exit;
	}
	else if (!empty($title) && empty($content))
	{
		echo '<script>alert("내용을 입력하시오.");history.back(-1);</script>';
		exit;
	}
	else if (empty($title) && empty($content))
	{
		echo '<script>alert("제목과 내용을 입력하시오.");history.back(-1);</script>';
		exit;
	}
	// 제목과 내용을 입력했을 경우
	else
	{
		$title = mysqli_real_escape_string($conn, trim($title));
		$content = mysqli_real_escape_string($conn, trim($content));

		$sql = 'INSERT INTO notice (numbers, write_date, title, content, img_dir) values(null, "'.$date.'", "'. $title.'", "'.$content.'", null)';

		$result = $conn->query($sql);

		// query가 정상실행 되었다면,
		if($result)
		{
			// 자동 카운트된 숫자를 $no로 저장
			$no = $conn->insert_id;
			// 작성된 게시물로 바로 가려면 이동할 URL 설정
			$replaceURL = './notice_view.php?no='.$no;

			echo '<script>alert("정상적으로 글이 등록되었습니다.");location.href="notice.php";</script>';
			exit;
		}
		else
		{
			echo '<script>alert("등록에 실패했습니다.");history.back(-1);</script>';
			exit;
		}

		// Close connection
		$conn->close();
	}
}

?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="./scriptaculous/lib/prototype.js" type="text/javascript"></script>
	<script src="./scriptaculous/src/scriptaculous.js" type="text/javascript"></script>
	<script src="./slide.js" type="text/javascript"></script>
	<link type="text/css" rel="stylesheet" href="./main.css">
	<link type="text/css" rel="stylesheet" href="./media.css">
	<link type="text/css" rel="stylesheet" href="./notice_write.css">

	<title>돌재농원</title>
</head>
<body>
	<div id="frame">
		<div id="top_menu">
			<span class="slogan">
				<img src="./img_main/slogan.png">
			</span>
			<ul>
				<li><a href="./logout.php">로그아웃</a></li>
				<li><a href="./admin.php">관리자페이지</a></li>
			</ul>
		</div>
		<div id="top_menu1">
			<ul>
				<li><a href="./logout.php">로그아웃</a></li>
				<li><a href="./admin.php">관리자페이지</a></li>
			</ul>
		</div>
		<div id="header">
			<div class="ad-left">
			  <img src="./img_main/cstime1.jpg">
	    </div>
			<h1>
				<a href="./index.php"><img src="./img_main/main.png" alt="메인사진"></a>
			</h1>
			<div class="ad">
				<img src="./img_main/top-delivery.png">
			</div>
		</div>
		<div id="header1">
			<h1>
				<a href="./index.php"><img src="./img_main/main.png" alt="메인사진"></a>
			</h1>
		</div>
		<div id="menu1">
			<ul>
				<li><a href="./index.php">농장소개 (Introduce)</a></li>
				<li><a href="./product_list.php">상품 (Product)</a></li>
				<li><a href="./notice.php">공지사항 (Notice)</a></li>
			</ul>
		</div>
		<div id="menu2">
			<ul id="m1">
				<li><a href="./index.php">농장소개 (Introduce)</a></li>
			</ul id="m1">
			<ul id="m1">
				<li><a href="./product_list.php">상품 (Product)</a></li>
				<li><a href="./notice.php">공지사항 (Notice)</a></li>
			</ul id="m1">
			<ul id="m2">
				<li><a href="./index.php">농장소개 (Introduce)</a></li>
			</ul>
			<ul id="m2">
				<li><a href="./product_list.php">상품 (Product)</a></li>
			</ul>
			<ul id="m2">
				<li><a href="./notice.php">공지사항 (Notice)</a></li>
			</ul>
		</div>

    <div id="container">
			<div id="content">
				<div class="contents-inner cs-page">
					<div class="section">
    				<div class="section-header">
        			<h2 class="h2">공지사항</h2>
    				</div>
    				<div class="section-body">
	        		<div class="join-form">
	            	<form name="frmWrite" id="frmWrite" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" enctype="multipart/form-data" class="frmWrite">
	                <input type="hidden" name="bdId" value="goodsreview">
	                <input type="hidden" name="sno" value="">
	                <input type="hidden" name="mode" value="write">
	                <!--<input type="hidden" name="chkSpamKey" id="chkSpamKey">-->
	                <input type="hidden" name="returnUrl" value="bdId=goodsreview">
									<div class="table1 board-write">
										<table>
											<colgroup>
												<col style="width:133px;">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th class="ta-l">제목</th>
													<td>
														<div class="txt-field">
															<input type="text" name="title" class="text" value="<?php echo $title; ?>">
														</div>
													</td>
												</tr>
												<tr>
													<th class="ta-l">본문</th>
													<td>
														<div class="txtarea">
															<textarea cols="30" name="content" rows="10" class="w100" id="editor"><?php echo $content; ?></textarea>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="btn">
										<input type="submit" class="save" value="저장">
										<button type="button" class="cancel"><a href="notice.php">이전</a></button>
									</div>
		            </form>
							</div>
						</div>
        	</div>
    		</div>
			</div>
		</div>
	</div>
</body>
</html>
