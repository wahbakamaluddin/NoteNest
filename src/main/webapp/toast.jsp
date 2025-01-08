
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>Bootstrap Example</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0">

	<!-- Example Code -->

	<div id="myToast" class="toast fade hide" role="alert"
		aria-live="assertive" aria-atomic="true">
		<div class="toast-header">
			<svg class="bd-placeholder-img rounded me-2" width="20" height="20"
				xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
				preserveAspectRatio="xMidYMid slice" focusable="false">
                <rect width="100%" height="100%" fill="#007aff"></rect></svg>
			<strong class="me-auto">Bootstrap</strong> <small>11 mins ago</small>
			<button type="button" class="btn-close" data-bs-dismiss="toast"
				aria-label="Close"></button>
		</div>
		<div class="toast-body">Hello, world! This is a toast message.</div>
	</div>

	<button type="button" class="btn btn-primary" id="liveToastBtn">Show
		toast</button>
	<div class="toast-container position-fixed bottom-0 start-0 p-6">
		<div class="toast" id="liveToast" role="alert" aria-live="assertive"
			aria-atomic="true">
			<div class="toast-body">
				<div class="d-flex gap-4">
					<span><i class="fa-solid fa-circle-check fa-lg icon-success"></i></span>
					<div class="d-flex flex-column flex-grow-1 gap-2">
						<div class="d-flex align-items-center">
							<span class="fw-semibold">#1 Your changes were saved</span>
							<button type="button" class="btn-close btn-close-sm ms-auto"
								data-bs-dismiss="toast" aria-label="Close"></button>
						</div>
						<span>I will auto dismiss after 8 seconds.</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<button type="button" class="btn btn-primary" id="liveToastBtn">Show toast</button>
<div class="toast-container position-fixed bottom-0 start-0 p-6">
  <div class="toast" id="liveToast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-body">
      <div class="d-flex gap-4">
        <span><i class="fa-solid fa-circle-check fa-lg icon-success"></i></span>
        <div class="d-flex flex-column flex-grow-1 gap-2">
          <div class="d-flex align-items-center">
            <span class="fw-semibold">#1 Your changes were saved</span>
            <button type="button" class="btn-close btn-close-sm ms-auto" data-bs-dismiss="toast"
              aria-label="Close"></button>
          </div>
          <span>I will auto dismiss after 8 seconds.</span>
        </div>
      </div>
    </div>
  </div>
</div>
	<!-- End Example Code -->

	<!-- Add this script to initialize and show the toast -->
	<script>
        document.addEventListener('DOMContentLoaded', function () {
            var toastEl = document.getElementById('myToast');
            var toast = new bootstrap.Toast(toastEl);
            toast.show();
        });
    </script>

	<script>
      const toastTrigger = document.getElementById("liveToastBtn");
  const toastLiveExample = document.getElementById("liveToast");
  toastTrigger.addEventListener("click", () => {
    const toast = new bootstrap.Toast(toastLiveExample);
    toast.show();
  });
    </script>
</body>
</html>