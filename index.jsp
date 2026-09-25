<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Apache Tomcat Server</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #123b78, #2878c8, #65c7e8);
        }

        .container {
            width: 510px;
            padding: 35px;
            background: #142d4c;
            border-radius: 10px;
            text-align: center;
            color: white;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.35);
        }

        h1 {
            margin: 0 0 15px;
            font-size: 29px;
        }

        .message {
            font-size: 14px;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .status {
            background: #20bd62;
            padding: 10px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 22px;
        }

        .cards {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .card {
            width: 33.33%;
            padding: 15px 10px;
            background: #304765;
            border-radius: 6px;
        }

        .card-title {
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-value {
            font-size: 13px;
        }

        .button {
            display: inline-block;
            margin-top: 22px;
            padding: 9px 16px;
            background: #ff9d00;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 12px;
            font-weight: bold;
        }

        .footer {
            margin-top: 22px;
            font-size: 12px;
            color: #d5dbe3;
        }
    </style>
</head>

<body>

    <div class="container">

        <h1>🚀 Apache Tomcat Server</h1>

        <div class="message">
            Congratulations! Your web application has been successfully deployed on
            the <b>Apache Tomcat Server.</b>
        </div>

        <div class="status">
            ✓ SERVER STATUS : RUNNING
        </div>

        <div class="cards">

            <div class="card">
                <div class="card-title">Server</div>
                <div class="card-value">Tomcat</div>
            </div>

            <div class="card">
                <div class="card-title">Deployment</div>
                <div class="card-value">Successful</div>
            </div>

            <div class="card">
                <div class="card-title">Environment</div>
                <div class="card-value">Production</div>
            </div>

        </div>

        <a class="button" href="/tomcat-demo/">
            Check Deployment
        </a>

        <div class="footer">
            Powered by Java | Apache Tomcat | DevOps Deployment
        </div>

    </div>

</body>
</html>