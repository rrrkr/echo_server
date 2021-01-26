;echo サーバ
; ver1.1 クライアントから接続切断後もサーバ継続
(defun echoserver ()
	(let ((socket (socket-server 12321)))
		(unwind-protect
			(loop while
				(with-open-stream (stream (socket-accept socket))
					(loop for input = (read-line stream)
						    while input
								if (string= input "stop")
									do (return t)
								else
									do (princ input stream))))
			(socket-server-close socket))))
