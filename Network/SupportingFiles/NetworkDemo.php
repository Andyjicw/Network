<?php
//Author Andyjicw 479003573@qq.com
if(isset($_SERVER["REQUEST_METHOD"])){
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
    	echo "[{\"set_name\": \"www.27270.com\",\"class\": \"xieemanhua\",\"group\": \"a560a5616b2a432eb18047ca7fe512f4\",\"file_ext\": \".jpg\",\"pic_count\": \"9\",\"pic_id\": \"1\"},{\"set_name\": \"www.27270.com\",\"class\": \"xieemanhua\",\"group\": \"bc7d22fd07b0bb99457a626ce7bf867b\",\"file_ext\": \".jpg\",\"pic_count\": \"7\",\"pic_id\": \"2\"}]";
	}
	if ($_SERVER["REQUEST_METHOD"] == "GET") {
    	echo "[{\"set_name\": \"www.27270.com\",\"class\": \"xieemanhua\",\"group\": \"a560a5616b2a432eb18047ca7fe512f4\",\"file_ext\": \".jpg\",\"pic_count\": \"9\",\"pic_id\": \"1\"},{\"set_name\": \"www.27270.com\",\"class\": \"xieemanhua\",\"group\": \"bc7d22fd07b0bb99457a626ce7bf867b\",\"file_ext\": \".jpg\",\"pic_count\": \"7\",\"pic_id\": \"2\"}]";
    }
    if ($_SERVER["REQUEST_METHOD"] == "PUT") {
        echo "{\"key\":\"success\"}";
    }
}

?>
