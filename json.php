<?php

//header('Cache-Control: no-cache, must-revalidate');
//header('Expires: Mon, 01 Jan 1996 00:00:00 GMT');

// The JSON standard MIME header.
//header('Content-type: application/json');

//header("Transfer-Encoding: chunked");
header("Connection: keep-alive");


function list_files($path) {
    $output = array();
    $files = scandir($path);
    if ($path == "./_h5ai" || $path == "./.bak") return $output;

    foreach ($files as $file) {
        if ($file == "." || $file == ".." || strpos($file, '.html')
            || $file == ".bak" || $file == "_h5ai") {
            continue;
        }

        if (is_dir($path.'/'.$file)) {
            $output[$path.'/'.$file] = list_files($path.'/'.$file);
        } else {
            $output[] = array("filename"=>$path.'/'.$file, "timestamp"=>filemtime($path.'/'.$file));
        }
    }

    return $output;
}

echo json_encode(list_files("."));
?>
