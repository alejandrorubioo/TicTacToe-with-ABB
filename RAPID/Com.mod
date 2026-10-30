MODULE Com
    VAR socketdev serverSocket;
    VAR socketdev clientSocket;
    VAR string data;
    PERS string posiciones;
    PERS bool isMoving := FALSE;
    PERS bool moveRobot_ := FALSE;
    
    PROC main()
        ConnectSocket;
        !Wait for the connection of the client socket
        WaitUntil SocketGetStatus(clientSocket) = SOCKET_CONNECTED;
        SocketReceive clientSocket, \Str:=data;
        SocketSend clientSocket \Str:="ack";
        TPWrite(data);
        Socket_Close;
        !Lo recibido se almacena en "posiciones". El string se procesa en el modulo de movimiento
        
        !Se habilita movimiento siempre que el robot haya finalizado la tarea
        posiciones := data;
        !WaitUntil isMoving = FALSE;
        moveRobot_ := TRUE;
        !WaitTime 1;

    ENDPROC
    
    
    PROC ConnectSocket()
       
        SocketCreate serverSocket;
        SocketBind serverSocket, "127.0.0.1", 4000;
        SocketListen serverSocket;
        SocketAccept serverSocket, clientSocket,\Time:=WAIT_MAX;
    ENDPROC
    
    PROC Socket_Close()
        SocketClose clientSocket;
        SocketClose serverSocket;
        
        ERROR 
        
        IF ERRNO=ERR_SOCK_TIMEOUT THEN

        RETRY;
        ELSEIF ERRNO=ERR_SOCK_CLOSED THEN
            SocketClose clientSocket;
            SocketClose serverSocket;
            SocketCreate serverSocket;
            SocketBind serverSocket, "127.0.0.1", 4000;
            SocketListen serverSocket;
            SocketAccept serverSocket, clientSocket,\Time:=WAIT_MAX;
        RETRY;
        
        ELSE
            stop;
        ENDIF
    ENDPROC
ENDMODULE