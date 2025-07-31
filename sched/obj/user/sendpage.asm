
obj/user/sendpage:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 7f 01 00 00       	call   8001b0 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 18             	sub    $0x18,%esp
  800039:	e8 fb 0f 00 00       	call   801039 <fork>
  80003e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  800041:	85 c0                	test   %eax,%eax
  800043:	0f 84 ab 00 00 00    	je     8000f4 <umain+0xc1>
  800049:	a1 0c 20 80 00       	mov    0x80200c,%eax
  80004e:	8b 40 48             	mov    0x48(%eax),%eax
  800051:	83 ec 04             	sub    $0x4,%esp
  800054:	6a 07                	push   $0x7
  800056:	68 00 00 a0 00       	push   $0xa00000
  80005b:	50                   	push   %eax
  80005c:	e8 bc 0b 00 00       	call   800c1d <sys_page_alloc>
  800061:	83 c4 04             	add    $0x4,%esp
  800064:	ff 35 04 20 80 00    	push   0x802004
  80006a:	e8 3f 07 00 00       	call   8007ae <strlen>
  80006f:	83 c4 0c             	add    $0xc,%esp
  800072:	83 c0 01             	add    $0x1,%eax
  800075:	50                   	push   %eax
  800076:	ff 35 04 20 80 00    	push   0x802004
  80007c:	68 00 00 a0 00       	push   $0xa00000
  800081:	e8 4f 09 00 00       	call   8009d5 <memcpy>
  800086:	6a 07                	push   $0x7
  800088:	68 00 00 a0 00       	push   $0xa00000
  80008d:	6a 00                	push   $0x0
  80008f:	ff 75 f4             	push   -0xc(%ebp)
  800092:	e8 40 11 00 00       	call   8011d7 <ipc_send>
  800097:	83 c4 1c             	add    $0x1c,%esp
  80009a:	6a 00                	push   $0x0
  80009c:	68 00 00 a0 00       	push   $0xa00000
  8000a1:	8d 45 f4             	lea    -0xc(%ebp),%eax
  8000a4:	50                   	push   %eax
  8000a5:	e8 cd 10 00 00       	call   801177 <ipc_recv>
  8000aa:	a1 0c 20 80 00       	mov    0x80200c,%eax
  8000af:	8b 40 48             	mov    0x48(%eax),%eax
  8000b2:	68 00 00 a0 00       	push   $0xa00000
  8000b7:	ff 75 f4             	push   -0xc(%ebp)
  8000ba:	50                   	push   %eax
  8000bb:	68 a0 15 80 00       	push   $0x8015a0
  8000c0:	e8 df 01 00 00       	call   8002a4 <cprintf>
  8000c5:	83 c4 14             	add    $0x14,%esp
  8000c8:	ff 35 00 20 80 00    	push   0x802000
  8000ce:	e8 db 06 00 00       	call   8007ae <strlen>
  8000d3:	83 c4 0c             	add    $0xc,%esp
  8000d6:	50                   	push   %eax
  8000d7:	ff 35 00 20 80 00    	push   0x802000
  8000dd:	68 00 00 a0 00       	push   $0xa00000
  8000e2:	e8 d9 07 00 00       	call   8008c0 <strncmp>
  8000e7:	83 c4 10             	add    $0x10,%esp
  8000ea:	85 c0                	test   %eax,%eax
  8000ec:	0f 84 a9 00 00 00    	je     80019b <umain+0x168>
  8000f2:	c9                   	leave
  8000f3:	c3                   	ret
  8000f4:	83 ec 04             	sub    $0x4,%esp
  8000f7:	6a 00                	push   $0x0
  8000f9:	68 00 00 b0 00       	push   $0xb00000
  8000fe:	8d 45 f4             	lea    -0xc(%ebp),%eax
  800101:	50                   	push   %eax
  800102:	e8 70 10 00 00       	call   801177 <ipc_recv>
  800107:	a1 0c 20 80 00       	mov    0x80200c,%eax
  80010c:	8b 40 48             	mov    0x48(%eax),%eax
  80010f:	68 00 00 b0 00       	push   $0xb00000
  800114:	ff 75 f4             	push   -0xc(%ebp)
  800117:	50                   	push   %eax
  800118:	68 a0 15 80 00       	push   $0x8015a0
  80011d:	e8 82 01 00 00       	call   8002a4 <cprintf>
  800122:	83 c4 14             	add    $0x14,%esp
  800125:	ff 35 04 20 80 00    	push   0x802004
  80012b:	e8 7e 06 00 00       	call   8007ae <strlen>
  800130:	83 c4 0c             	add    $0xc,%esp
  800133:	50                   	push   %eax
  800134:	ff 35 04 20 80 00    	push   0x802004
  80013a:	68 00 00 b0 00       	push   $0xb00000
  80013f:	e8 7c 07 00 00       	call   8008c0 <strncmp>
  800144:	83 c4 10             	add    $0x10,%esp
  800147:	85 c0                	test   %eax,%eax
  800149:	74 3e                	je     800189 <umain+0x156>
  80014b:	83 ec 0c             	sub    $0xc,%esp
  80014e:	ff 35 00 20 80 00    	push   0x802000
  800154:	e8 55 06 00 00       	call   8007ae <strlen>
  800159:	83 c4 0c             	add    $0xc,%esp
  80015c:	83 c0 01             	add    $0x1,%eax
  80015f:	50                   	push   %eax
  800160:	ff 35 00 20 80 00    	push   0x802000
  800166:	68 00 00 b0 00       	push   $0xb00000
  80016b:	e8 65 08 00 00       	call   8009d5 <memcpy>
  800170:	6a 07                	push   $0x7
  800172:	68 00 00 b0 00       	push   $0xb00000
  800177:	6a 00                	push   $0x0
  800179:	ff 75 f4             	push   -0xc(%ebp)
  80017c:	e8 56 10 00 00       	call   8011d7 <ipc_send>
  800181:	83 c4 20             	add    $0x20,%esp
  800184:	e9 69 ff ff ff       	jmp    8000f2 <umain+0xbf>
  800189:	83 ec 0c             	sub    $0xc,%esp
  80018c:	68 5c 17 80 00       	push   $0x80175c
  800191:	e8 0e 01 00 00       	call   8002a4 <cprintf>
  800196:	83 c4 10             	add    $0x10,%esp
  800199:	eb b0                	jmp    80014b <umain+0x118>
  80019b:	83 ec 0c             	sub    $0xc,%esp
  80019e:	68 7c 17 80 00       	push   $0x80177c
  8001a3:	e8 fc 00 00 00       	call   8002a4 <cprintf>
  8001a8:	83 c4 10             	add    $0x10,%esp
  8001ab:	e9 42 ff ff ff       	jmp    8000f2 <umain+0xbf>

008001b0 <libmain>:
  8001b0:	55                   	push   %ebp
  8001b1:	89 e5                	mov    %esp,%ebp
  8001b3:	56                   	push   %esi
  8001b4:	53                   	push   %ebx
  8001b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8001b8:	8b 75 0c             	mov    0xc(%ebp),%esi
  8001bb:	e8 12 0a 00 00       	call   800bd2 <sys_getenvid>
  8001c0:	85 c0                	test   %eax,%eax
  8001c2:	78 15                	js     8001d9 <libmain+0x29>
  8001c4:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001c9:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8001cf:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8001d4:	a3 0c 20 80 00       	mov    %eax,0x80200c
  8001d9:	85 db                	test   %ebx,%ebx
  8001db:	7e 07                	jle    8001e4 <libmain+0x34>
  8001dd:	8b 06                	mov    (%esi),%eax
  8001df:	a3 08 20 80 00       	mov    %eax,0x802008
  8001e4:	83 ec 08             	sub    $0x8,%esp
  8001e7:	56                   	push   %esi
  8001e8:	53                   	push   %ebx
  8001e9:	e8 45 fe ff ff       	call   800033 <umain>
  8001ee:	e8 0a 00 00 00       	call   8001fd <exit>
  8001f3:	83 c4 10             	add    $0x10,%esp
  8001f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8001f9:	5b                   	pop    %ebx
  8001fa:	5e                   	pop    %esi
  8001fb:	5d                   	pop    %ebp
  8001fc:	c3                   	ret

008001fd <exit>:
  8001fd:	55                   	push   %ebp
  8001fe:	89 e5                	mov    %esp,%ebp
  800200:	83 ec 14             	sub    $0x14,%esp
  800203:	6a 00                	push   $0x0
  800205:	e8 a6 09 00 00       	call   800bb0 <sys_env_destroy>
  80020a:	83 c4 10             	add    $0x10,%esp
  80020d:	c9                   	leave
  80020e:	c3                   	ret

0080020f <putch>:
  80020f:	55                   	push   %ebp
  800210:	89 e5                	mov    %esp,%ebp
  800212:	53                   	push   %ebx
  800213:	83 ec 04             	sub    $0x4,%esp
  800216:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800219:	8b 13                	mov    (%ebx),%edx
  80021b:	8d 42 01             	lea    0x1(%edx),%eax
  80021e:	89 03                	mov    %eax,(%ebx)
  800220:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800223:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800227:	3d ff 00 00 00       	cmp    $0xff,%eax
  80022c:	74 09                	je     800237 <putch+0x28>
  80022e:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800232:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800235:	c9                   	leave
  800236:	c3                   	ret
  800237:	83 ec 08             	sub    $0x8,%esp
  80023a:	68 ff 00 00 00       	push   $0xff
  80023f:	8d 43 08             	lea    0x8(%ebx),%eax
  800242:	50                   	push   %eax
  800243:	e8 1e 09 00 00       	call   800b66 <sys_cputs>
  800248:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  80024e:	83 c4 10             	add    $0x10,%esp
  800251:	eb db                	jmp    80022e <putch+0x1f>

00800253 <vcprintf>:
  800253:	55                   	push   %ebp
  800254:	89 e5                	mov    %esp,%ebp
  800256:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80025c:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800263:	00 00 00 
  800266:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  80026d:	00 00 00 
  800270:	ff 75 0c             	push   0xc(%ebp)
  800273:	ff 75 08             	push   0x8(%ebp)
  800276:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80027c:	50                   	push   %eax
  80027d:	68 0f 02 80 00       	push   $0x80020f
  800282:	e8 74 01 00 00       	call   8003fb <vprintfmt>
  800287:	83 c4 08             	add    $0x8,%esp
  80028a:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800290:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800296:	50                   	push   %eax
  800297:	e8 ca 08 00 00       	call   800b66 <sys_cputs>
  80029c:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  8002a2:	c9                   	leave
  8002a3:	c3                   	ret

008002a4 <cprintf>:
  8002a4:	55                   	push   %ebp
  8002a5:	89 e5                	mov    %esp,%ebp
  8002a7:	83 ec 10             	sub    $0x10,%esp
  8002aa:	8d 45 0c             	lea    0xc(%ebp),%eax
  8002ad:	50                   	push   %eax
  8002ae:	ff 75 08             	push   0x8(%ebp)
  8002b1:	e8 9d ff ff ff       	call   800253 <vcprintf>
  8002b6:	c9                   	leave
  8002b7:	c3                   	ret

008002b8 <printnum>:
  8002b8:	55                   	push   %ebp
  8002b9:	89 e5                	mov    %esp,%ebp
  8002bb:	57                   	push   %edi
  8002bc:	56                   	push   %esi
  8002bd:	53                   	push   %ebx
  8002be:	83 ec 1c             	sub    $0x1c,%esp
  8002c1:	89 c7                	mov    %eax,%edi
  8002c3:	89 d6                	mov    %edx,%esi
  8002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  8002c8:	8b 55 0c             	mov    0xc(%ebp),%edx
  8002cb:	89 d1                	mov    %edx,%ecx
  8002cd:	89 c2                	mov    %eax,%edx
  8002cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8002d2:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8002d5:	8b 45 10             	mov    0x10(%ebp),%eax
  8002d8:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8002db:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8002de:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8002e5:	39 c2                	cmp    %eax,%edx
  8002e7:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8002ea:	72 3e                	jb     80032a <printnum+0x72>
  8002ec:	83 ec 0c             	sub    $0xc,%esp
  8002ef:	ff 75 18             	push   0x18(%ebp)
  8002f2:	83 eb 01             	sub    $0x1,%ebx
  8002f5:	53                   	push   %ebx
  8002f6:	50                   	push   %eax
  8002f7:	83 ec 08             	sub    $0x8,%esp
  8002fa:	ff 75 e4             	push   -0x1c(%ebp)
  8002fd:	ff 75 e0             	push   -0x20(%ebp)
  800300:	ff 75 dc             	push   -0x24(%ebp)
  800303:	ff 75 d8             	push   -0x28(%ebp)
  800306:	e8 25 10 00 00       	call   801330 <__udivdi3>
  80030b:	83 c4 18             	add    $0x18,%esp
  80030e:	52                   	push   %edx
  80030f:	50                   	push   %eax
  800310:	89 f2                	mov    %esi,%edx
  800312:	89 f8                	mov    %edi,%eax
  800314:	e8 9f ff ff ff       	call   8002b8 <printnum>
  800319:	83 c4 20             	add    $0x20,%esp
  80031c:	eb 13                	jmp    800331 <printnum+0x79>
  80031e:	83 ec 08             	sub    $0x8,%esp
  800321:	56                   	push   %esi
  800322:	ff 75 18             	push   0x18(%ebp)
  800325:	ff d7                	call   *%edi
  800327:	83 c4 10             	add    $0x10,%esp
  80032a:	83 eb 01             	sub    $0x1,%ebx
  80032d:	85 db                	test   %ebx,%ebx
  80032f:	7f ed                	jg     80031e <printnum+0x66>
  800331:	83 ec 08             	sub    $0x8,%esp
  800334:	56                   	push   %esi
  800335:	83 ec 04             	sub    $0x4,%esp
  800338:	ff 75 e4             	push   -0x1c(%ebp)
  80033b:	ff 75 e0             	push   -0x20(%ebp)
  80033e:	ff 75 dc             	push   -0x24(%ebp)
  800341:	ff 75 d8             	push   -0x28(%ebp)
  800344:	e8 07 11 00 00       	call   801450 <__umoddi3>
  800349:	83 c4 14             	add    $0x14,%esp
  80034c:	0f be 80 c6 15 80 00 	movsbl 0x8015c6(%eax),%eax
  800353:	50                   	push   %eax
  800354:	ff d7                	call   *%edi
  800356:	83 c4 10             	add    $0x10,%esp
  800359:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80035c:	5b                   	pop    %ebx
  80035d:	5e                   	pop    %esi
  80035e:	5f                   	pop    %edi
  80035f:	5d                   	pop    %ebp
  800360:	c3                   	ret

00800361 <getuint>:
  800361:	83 fa 01             	cmp    $0x1,%edx
  800364:	7f 13                	jg     800379 <getuint+0x18>
  800366:	85 d2                	test   %edx,%edx
  800368:	74 1c                	je     800386 <getuint+0x25>
  80036a:	8b 10                	mov    (%eax),%edx
  80036c:	8d 4a 04             	lea    0x4(%edx),%ecx
  80036f:	89 08                	mov    %ecx,(%eax)
  800371:	8b 02                	mov    (%edx),%eax
  800373:	ba 00 00 00 00       	mov    $0x0,%edx
  800378:	c3                   	ret
  800379:	8b 10                	mov    (%eax),%edx
  80037b:	8d 4a 08             	lea    0x8(%edx),%ecx
  80037e:	89 08                	mov    %ecx,(%eax)
  800380:	8b 02                	mov    (%edx),%eax
  800382:	8b 52 04             	mov    0x4(%edx),%edx
  800385:	c3                   	ret
  800386:	8b 10                	mov    (%eax),%edx
  800388:	8d 4a 04             	lea    0x4(%edx),%ecx
  80038b:	89 08                	mov    %ecx,(%eax)
  80038d:	8b 02                	mov    (%edx),%eax
  80038f:	ba 00 00 00 00       	mov    $0x0,%edx
  800394:	c3                   	ret

00800395 <getint>:
  800395:	83 fa 01             	cmp    $0x1,%edx
  800398:	7f 0f                	jg     8003a9 <getint+0x14>
  80039a:	85 d2                	test   %edx,%edx
  80039c:	74 18                	je     8003b6 <getint+0x21>
  80039e:	8b 10                	mov    (%eax),%edx
  8003a0:	8d 4a 04             	lea    0x4(%edx),%ecx
  8003a3:	89 08                	mov    %ecx,(%eax)
  8003a5:	8b 02                	mov    (%edx),%eax
  8003a7:	99                   	cltd
  8003a8:	c3                   	ret
  8003a9:	8b 10                	mov    (%eax),%edx
  8003ab:	8d 4a 08             	lea    0x8(%edx),%ecx
  8003ae:	89 08                	mov    %ecx,(%eax)
  8003b0:	8b 02                	mov    (%edx),%eax
  8003b2:	8b 52 04             	mov    0x4(%edx),%edx
  8003b5:	c3                   	ret
  8003b6:	8b 10                	mov    (%eax),%edx
  8003b8:	8d 4a 04             	lea    0x4(%edx),%ecx
  8003bb:	89 08                	mov    %ecx,(%eax)
  8003bd:	8b 02                	mov    (%edx),%eax
  8003bf:	99                   	cltd
  8003c0:	c3                   	ret

008003c1 <sprintputch>:
  8003c1:	55                   	push   %ebp
  8003c2:	89 e5                	mov    %esp,%ebp
  8003c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  8003c7:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8003cb:	8b 10                	mov    (%eax),%edx
  8003cd:	3b 50 04             	cmp    0x4(%eax),%edx
  8003d0:	73 0a                	jae    8003dc <sprintputch+0x1b>
  8003d2:	8d 4a 01             	lea    0x1(%edx),%ecx
  8003d5:	89 08                	mov    %ecx,(%eax)
  8003d7:	8b 45 08             	mov    0x8(%ebp),%eax
  8003da:	88 02                	mov    %al,(%edx)
  8003dc:	5d                   	pop    %ebp
  8003dd:	c3                   	ret

008003de <printfmt>:
  8003de:	55                   	push   %ebp
  8003df:	89 e5                	mov    %esp,%ebp
  8003e1:	83 ec 08             	sub    $0x8,%esp
  8003e4:	8d 45 14             	lea    0x14(%ebp),%eax
  8003e7:	50                   	push   %eax
  8003e8:	ff 75 10             	push   0x10(%ebp)
  8003eb:	ff 75 0c             	push   0xc(%ebp)
  8003ee:	ff 75 08             	push   0x8(%ebp)
  8003f1:	e8 05 00 00 00       	call   8003fb <vprintfmt>
  8003f6:	83 c4 10             	add    $0x10,%esp
  8003f9:	c9                   	leave
  8003fa:	c3                   	ret

008003fb <vprintfmt>:
  8003fb:	55                   	push   %ebp
  8003fc:	89 e5                	mov    %esp,%ebp
  8003fe:	57                   	push   %edi
  8003ff:	56                   	push   %esi
  800400:	53                   	push   %ebx
  800401:	83 ec 2c             	sub    $0x2c,%esp
  800404:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800407:	8b 75 0c             	mov    0xc(%ebp),%esi
  80040a:	8b 7d 10             	mov    0x10(%ebp),%edi
  80040d:	eb 0a                	jmp    800419 <vprintfmt+0x1e>
  80040f:	83 ec 08             	sub    $0x8,%esp
  800412:	56                   	push   %esi
  800413:	50                   	push   %eax
  800414:	ff d3                	call   *%ebx
  800416:	83 c4 10             	add    $0x10,%esp
  800419:	83 c7 01             	add    $0x1,%edi
  80041c:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800420:	83 f8 25             	cmp    $0x25,%eax
  800423:	74 0c                	je     800431 <vprintfmt+0x36>
  800425:	85 c0                	test   %eax,%eax
  800427:	75 e6                	jne    80040f <vprintfmt+0x14>
  800429:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80042c:	5b                   	pop    %ebx
  80042d:	5e                   	pop    %esi
  80042e:	5f                   	pop    %edi
  80042f:	5d                   	pop    %ebp
  800430:	c3                   	ret
  800431:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800435:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80043c:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800443:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80044a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80044f:	8d 47 01             	lea    0x1(%edi),%eax
  800452:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800455:	0f b6 17             	movzbl (%edi),%edx
  800458:	8d 42 dd             	lea    -0x23(%edx),%eax
  80045b:	3c 55                	cmp    $0x55,%al
  80045d:	0f 87 c3 02 00 00    	ja     800726 <vprintfmt+0x32b>
  800463:	0f b6 c0             	movzbl %al,%eax
  800466:	ff 24 85 80 19 80 00 	jmp    *0x801980(,%eax,4)
  80046d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800470:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800474:	eb d9                	jmp    80044f <vprintfmt+0x54>
  800476:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800479:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  80047d:	eb d0                	jmp    80044f <vprintfmt+0x54>
  80047f:	0f b6 d2             	movzbl %dl,%edx
  800482:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800485:	b8 00 00 00 00       	mov    $0x0,%eax
  80048a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80048d:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800490:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800494:	0f be 17             	movsbl (%edi),%edx
  800497:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80049a:	83 f9 09             	cmp    $0x9,%ecx
  80049d:	77 52                	ja     8004f1 <vprintfmt+0xf6>
  80049f:	83 c7 01             	add    $0x1,%edi
  8004a2:	eb e9                	jmp    80048d <vprintfmt+0x92>
  8004a4:	8b 45 14             	mov    0x14(%ebp),%eax
  8004a7:	8d 50 04             	lea    0x4(%eax),%edx
  8004aa:	89 55 14             	mov    %edx,0x14(%ebp)
  8004ad:	8b 00                	mov    (%eax),%eax
  8004af:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8004b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004b5:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8004b9:	79 94                	jns    80044f <vprintfmt+0x54>
  8004bb:	8b 45 d0             	mov    -0x30(%ebp),%eax
  8004be:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004c1:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8004c8:	eb 85                	jmp    80044f <vprintfmt+0x54>
  8004ca:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8004cd:	85 d2                	test   %edx,%edx
  8004cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8004d4:	0f 49 c2             	cmovns %edx,%eax
  8004d7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004dd:	e9 6d ff ff ff       	jmp    80044f <vprintfmt+0x54>
  8004e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004e5:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8004ec:	e9 5e ff ff ff       	jmp    80044f <vprintfmt+0x54>
  8004f1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8004f4:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8004f7:	eb bc                	jmp    8004b5 <vprintfmt+0xba>
  8004f9:	83 c1 01             	add    $0x1,%ecx
  8004fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004ff:	e9 4b ff ff ff       	jmp    80044f <vprintfmt+0x54>
  800504:	8b 45 14             	mov    0x14(%ebp),%eax
  800507:	8d 50 04             	lea    0x4(%eax),%edx
  80050a:	89 55 14             	mov    %edx,0x14(%ebp)
  80050d:	83 ec 08             	sub    $0x8,%esp
  800510:	56                   	push   %esi
  800511:	ff 30                	push   (%eax)
  800513:	ff d3                	call   *%ebx
  800515:	83 c4 10             	add    $0x10,%esp
  800518:	e9 a0 01 00 00       	jmp    8006bd <vprintfmt+0x2c2>
  80051d:	8b 45 14             	mov    0x14(%ebp),%eax
  800520:	8d 50 04             	lea    0x4(%eax),%edx
  800523:	89 55 14             	mov    %edx,0x14(%ebp)
  800526:	8b 10                	mov    (%eax),%edx
  800528:	89 d0                	mov    %edx,%eax
  80052a:	f7 d8                	neg    %eax
  80052c:	0f 48 c2             	cmovs  %edx,%eax
  80052f:	83 f8 08             	cmp    $0x8,%eax
  800532:	7f 20                	jg     800554 <vprintfmt+0x159>
  800534:	8b 14 85 e0 1a 80 00 	mov    0x801ae0(,%eax,4),%edx
  80053b:	85 d2                	test   %edx,%edx
  80053d:	74 15                	je     800554 <vprintfmt+0x159>
  80053f:	52                   	push   %edx
  800540:	68 e7 15 80 00       	push   $0x8015e7
  800545:	56                   	push   %esi
  800546:	53                   	push   %ebx
  800547:	e8 92 fe ff ff       	call   8003de <printfmt>
  80054c:	83 c4 10             	add    $0x10,%esp
  80054f:	e9 69 01 00 00       	jmp    8006bd <vprintfmt+0x2c2>
  800554:	50                   	push   %eax
  800555:	68 de 15 80 00       	push   $0x8015de
  80055a:	56                   	push   %esi
  80055b:	53                   	push   %ebx
  80055c:	e8 7d fe ff ff       	call   8003de <printfmt>
  800561:	83 c4 10             	add    $0x10,%esp
  800564:	e9 54 01 00 00       	jmp    8006bd <vprintfmt+0x2c2>
  800569:	8b 45 14             	mov    0x14(%ebp),%eax
  80056c:	8d 50 04             	lea    0x4(%eax),%edx
  80056f:	89 55 14             	mov    %edx,0x14(%ebp)
  800572:	8b 08                	mov    (%eax),%ecx
  800574:	85 c9                	test   %ecx,%ecx
  800576:	b8 d7 15 80 00       	mov    $0x8015d7,%eax
  80057b:	0f 45 c1             	cmovne %ecx,%eax
  80057e:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800581:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800585:	7e 06                	jle    80058d <vprintfmt+0x192>
  800587:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  80058b:	75 0b                	jne    800598 <vprintfmt+0x19d>
  80058d:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800590:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800593:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800596:	eb 5c                	jmp    8005f4 <vprintfmt+0x1f9>
  800598:	83 ec 08             	sub    $0x8,%esp
  80059b:	ff 75 d0             	push   -0x30(%ebp)
  80059e:	ff 75 cc             	push   -0x34(%ebp)
  8005a1:	e8 20 02 00 00       	call   8007c6 <strnlen>
  8005a6:	89 c2                	mov    %eax,%edx
  8005a8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8005ab:	29 d0                	sub    %edx,%eax
  8005ad:	83 c4 10             	add    $0x10,%esp
  8005b0:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8005b4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005b7:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8005ba:	89 c3                	mov    %eax,%ebx
  8005bc:	eb 0e                	jmp    8005cc <vprintfmt+0x1d1>
  8005be:	83 ec 08             	sub    $0x8,%esp
  8005c1:	56                   	push   %esi
  8005c2:	57                   	push   %edi
  8005c3:	ff 55 08             	call   *0x8(%ebp)
  8005c6:	83 eb 01             	sub    $0x1,%ebx
  8005c9:	83 c4 10             	add    $0x10,%esp
  8005cc:	85 db                	test   %ebx,%ebx
  8005ce:	7f ee                	jg     8005be <vprintfmt+0x1c3>
  8005d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8005d3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8005d6:	85 c0                	test   %eax,%eax
  8005d8:	ba 00 00 00 00       	mov    $0x0,%edx
  8005dd:	0f 49 d0             	cmovns %eax,%edx
  8005e0:	29 d0                	sub    %edx,%eax
  8005e2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005e5:	eb a6                	jmp    80058d <vprintfmt+0x192>
  8005e7:	83 ec 08             	sub    $0x8,%esp
  8005ea:	56                   	push   %esi
  8005eb:	52                   	push   %edx
  8005ec:	ff 55 08             	call   *0x8(%ebp)
  8005ef:	83 c4 10             	add    $0x10,%esp
  8005f2:	89 d9                	mov    %ebx,%ecx
  8005f4:	8d 59 01             	lea    0x1(%ecx),%ebx
  8005f7:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8005fb:	0f be d0             	movsbl %al,%edx
  8005fe:	85 d2                	test   %edx,%edx
  800600:	74 28                	je     80062a <vprintfmt+0x22f>
  800602:	85 ff                	test   %edi,%edi
  800604:	78 05                	js     80060b <vprintfmt+0x210>
  800606:	83 ef 01             	sub    $0x1,%edi
  800609:	78 2e                	js     800639 <vprintfmt+0x23e>
  80060b:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  80060f:	74 d6                	je     8005e7 <vprintfmt+0x1ec>
  800611:	0f be c0             	movsbl %al,%eax
  800614:	83 e8 20             	sub    $0x20,%eax
  800617:	83 f8 5e             	cmp    $0x5e,%eax
  80061a:	76 cb                	jbe    8005e7 <vprintfmt+0x1ec>
  80061c:	83 ec 08             	sub    $0x8,%esp
  80061f:	56                   	push   %esi
  800620:	6a 3f                	push   $0x3f
  800622:	ff 55 08             	call   *0x8(%ebp)
  800625:	83 c4 10             	add    $0x10,%esp
  800628:	eb c8                	jmp    8005f2 <vprintfmt+0x1f7>
  80062a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80062d:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800630:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800633:	01 c7                	add    %eax,%edi
  800635:	29 cf                	sub    %ecx,%edi
  800637:	eb 13                	jmp    80064c <vprintfmt+0x251>
  800639:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80063c:	eb ef                	jmp    80062d <vprintfmt+0x232>
  80063e:	83 ec 08             	sub    $0x8,%esp
  800641:	56                   	push   %esi
  800642:	6a 20                	push   $0x20
  800644:	ff d3                	call   *%ebx
  800646:	83 ef 01             	sub    $0x1,%edi
  800649:	83 c4 10             	add    $0x10,%esp
  80064c:	85 ff                	test   %edi,%edi
  80064e:	7f ee                	jg     80063e <vprintfmt+0x243>
  800650:	eb 6b                	jmp    8006bd <vprintfmt+0x2c2>
  800652:	89 ca                	mov    %ecx,%edx
  800654:	8d 45 14             	lea    0x14(%ebp),%eax
  800657:	e8 39 fd ff ff       	call   800395 <getint>
  80065c:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80065f:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800662:	85 d2                	test   %edx,%edx
  800664:	78 0b                	js     800671 <vprintfmt+0x276>
  800666:	89 d1                	mov    %edx,%ecx
  800668:	89 c2                	mov    %eax,%edx
  80066a:	bf 0a 00 00 00       	mov    $0xa,%edi
  80066f:	eb 32                	jmp    8006a3 <vprintfmt+0x2a8>
  800671:	83 ec 08             	sub    $0x8,%esp
  800674:	56                   	push   %esi
  800675:	6a 2d                	push   $0x2d
  800677:	ff d3                	call   *%ebx
  800679:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80067c:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  80067f:	f7 da                	neg    %edx
  800681:	83 d1 00             	adc    $0x0,%ecx
  800684:	f7 d9                	neg    %ecx
  800686:	83 c4 10             	add    $0x10,%esp
  800689:	bf 0a 00 00 00       	mov    $0xa,%edi
  80068e:	eb 13                	jmp    8006a3 <vprintfmt+0x2a8>
  800690:	89 ca                	mov    %ecx,%edx
  800692:	8d 45 14             	lea    0x14(%ebp),%eax
  800695:	e8 c7 fc ff ff       	call   800361 <getuint>
  80069a:	89 d1                	mov    %edx,%ecx
  80069c:	89 c2                	mov    %eax,%edx
  80069e:	bf 0a 00 00 00       	mov    $0xa,%edi
  8006a3:	83 ec 0c             	sub    $0xc,%esp
  8006a6:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  8006aa:	50                   	push   %eax
  8006ab:	ff 75 e0             	push   -0x20(%ebp)
  8006ae:	57                   	push   %edi
  8006af:	51                   	push   %ecx
  8006b0:	52                   	push   %edx
  8006b1:	89 f2                	mov    %esi,%edx
  8006b3:	89 d8                	mov    %ebx,%eax
  8006b5:	e8 fe fb ff ff       	call   8002b8 <printnum>
  8006ba:	83 c4 20             	add    $0x20,%esp
  8006bd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8006c0:	e9 54 fd ff ff       	jmp    800419 <vprintfmt+0x1e>
  8006c5:	89 ca                	mov    %ecx,%edx
  8006c7:	8d 45 14             	lea    0x14(%ebp),%eax
  8006ca:	e8 92 fc ff ff       	call   800361 <getuint>
  8006cf:	89 d1                	mov    %edx,%ecx
  8006d1:	89 c2                	mov    %eax,%edx
  8006d3:	bf 08 00 00 00       	mov    $0x8,%edi
  8006d8:	eb c9                	jmp    8006a3 <vprintfmt+0x2a8>
  8006da:	83 ec 08             	sub    $0x8,%esp
  8006dd:	56                   	push   %esi
  8006de:	6a 30                	push   $0x30
  8006e0:	ff d3                	call   *%ebx
  8006e2:	83 c4 08             	add    $0x8,%esp
  8006e5:	56                   	push   %esi
  8006e6:	6a 78                	push   $0x78
  8006e8:	ff d3                	call   *%ebx
  8006ea:	8b 45 14             	mov    0x14(%ebp),%eax
  8006ed:	8d 50 04             	lea    0x4(%eax),%edx
  8006f0:	89 55 14             	mov    %edx,0x14(%ebp)
  8006f3:	8b 10                	mov    (%eax),%edx
  8006f5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8006fa:	83 c4 10             	add    $0x10,%esp
  8006fd:	bf 10 00 00 00       	mov    $0x10,%edi
  800702:	eb 9f                	jmp    8006a3 <vprintfmt+0x2a8>
  800704:	89 ca                	mov    %ecx,%edx
  800706:	8d 45 14             	lea    0x14(%ebp),%eax
  800709:	e8 53 fc ff ff       	call   800361 <getuint>
  80070e:	89 d1                	mov    %edx,%ecx
  800710:	89 c2                	mov    %eax,%edx
  800712:	bf 10 00 00 00       	mov    $0x10,%edi
  800717:	eb 8a                	jmp    8006a3 <vprintfmt+0x2a8>
  800719:	83 ec 08             	sub    $0x8,%esp
  80071c:	56                   	push   %esi
  80071d:	6a 25                	push   $0x25
  80071f:	ff d3                	call   *%ebx
  800721:	83 c4 10             	add    $0x10,%esp
  800724:	eb 97                	jmp    8006bd <vprintfmt+0x2c2>
  800726:	83 ec 08             	sub    $0x8,%esp
  800729:	56                   	push   %esi
  80072a:	6a 25                	push   $0x25
  80072c:	ff d3                	call   *%ebx
  80072e:	83 c4 10             	add    $0x10,%esp
  800731:	89 f8                	mov    %edi,%eax
  800733:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800737:	74 05                	je     80073e <vprintfmt+0x343>
  800739:	83 e8 01             	sub    $0x1,%eax
  80073c:	eb f5                	jmp    800733 <vprintfmt+0x338>
  80073e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800741:	e9 77 ff ff ff       	jmp    8006bd <vprintfmt+0x2c2>

00800746 <vsnprintf>:
  800746:	55                   	push   %ebp
  800747:	89 e5                	mov    %esp,%ebp
  800749:	83 ec 18             	sub    $0x18,%esp
  80074c:	8b 45 08             	mov    0x8(%ebp),%eax
  80074f:	8b 55 0c             	mov    0xc(%ebp),%edx
  800752:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800755:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800759:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80075c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800763:	85 c0                	test   %eax,%eax
  800765:	74 26                	je     80078d <vsnprintf+0x47>
  800767:	85 d2                	test   %edx,%edx
  800769:	7e 22                	jle    80078d <vsnprintf+0x47>
  80076b:	ff 75 14             	push   0x14(%ebp)
  80076e:	ff 75 10             	push   0x10(%ebp)
  800771:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800774:	50                   	push   %eax
  800775:	68 c1 03 80 00       	push   $0x8003c1
  80077a:	e8 7c fc ff ff       	call   8003fb <vprintfmt>
  80077f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800782:	c6 00 00             	movb   $0x0,(%eax)
  800785:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800788:	83 c4 10             	add    $0x10,%esp
  80078b:	c9                   	leave
  80078c:	c3                   	ret
  80078d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800792:	eb f7                	jmp    80078b <vsnprintf+0x45>

00800794 <snprintf>:
  800794:	55                   	push   %ebp
  800795:	89 e5                	mov    %esp,%ebp
  800797:	83 ec 08             	sub    $0x8,%esp
  80079a:	8d 45 14             	lea    0x14(%ebp),%eax
  80079d:	50                   	push   %eax
  80079e:	ff 75 10             	push   0x10(%ebp)
  8007a1:	ff 75 0c             	push   0xc(%ebp)
  8007a4:	ff 75 08             	push   0x8(%ebp)
  8007a7:	e8 9a ff ff ff       	call   800746 <vsnprintf>
  8007ac:	c9                   	leave
  8007ad:	c3                   	ret

008007ae <strlen>:
  8007ae:	55                   	push   %ebp
  8007af:	89 e5                	mov    %esp,%ebp
  8007b1:	8b 55 08             	mov    0x8(%ebp),%edx
  8007b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8007b9:	eb 03                	jmp    8007be <strlen+0x10>
  8007bb:	83 c0 01             	add    $0x1,%eax
  8007be:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8007c2:	75 f7                	jne    8007bb <strlen+0xd>
  8007c4:	5d                   	pop    %ebp
  8007c5:	c3                   	ret

008007c6 <strnlen>:
  8007c6:	55                   	push   %ebp
  8007c7:	89 e5                	mov    %esp,%ebp
  8007c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8007cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8007d4:	eb 03                	jmp    8007d9 <strnlen+0x13>
  8007d6:	83 c0 01             	add    $0x1,%eax
  8007d9:	39 d0                	cmp    %edx,%eax
  8007db:	74 08                	je     8007e5 <strnlen+0x1f>
  8007dd:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8007e1:	75 f3                	jne    8007d6 <strnlen+0x10>
  8007e3:	89 c2                	mov    %eax,%edx
  8007e5:	89 d0                	mov    %edx,%eax
  8007e7:	5d                   	pop    %ebp
  8007e8:	c3                   	ret

008007e9 <strcpy>:
  8007e9:	55                   	push   %ebp
  8007ea:	89 e5                	mov    %esp,%ebp
  8007ec:	53                   	push   %ebx
  8007ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8007f0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8007f3:	b8 00 00 00 00       	mov    $0x0,%eax
  8007f8:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8007fc:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8007ff:	83 c0 01             	add    $0x1,%eax
  800802:	84 d2                	test   %dl,%dl
  800804:	75 f2                	jne    8007f8 <strcpy+0xf>
  800806:	89 c8                	mov    %ecx,%eax
  800808:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80080b:	c9                   	leave
  80080c:	c3                   	ret

0080080d <strcat>:
  80080d:	55                   	push   %ebp
  80080e:	89 e5                	mov    %esp,%ebp
  800810:	53                   	push   %ebx
  800811:	83 ec 10             	sub    $0x10,%esp
  800814:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800817:	53                   	push   %ebx
  800818:	e8 91 ff ff ff       	call   8007ae <strlen>
  80081d:	83 c4 08             	add    $0x8,%esp
  800820:	ff 75 0c             	push   0xc(%ebp)
  800823:	01 d8                	add    %ebx,%eax
  800825:	50                   	push   %eax
  800826:	e8 be ff ff ff       	call   8007e9 <strcpy>
  80082b:	89 d8                	mov    %ebx,%eax
  80082d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800830:	c9                   	leave
  800831:	c3                   	ret

00800832 <strncpy>:
  800832:	55                   	push   %ebp
  800833:	89 e5                	mov    %esp,%ebp
  800835:	56                   	push   %esi
  800836:	53                   	push   %ebx
  800837:	8b 75 08             	mov    0x8(%ebp),%esi
  80083a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80083d:	89 f3                	mov    %esi,%ebx
  80083f:	03 5d 10             	add    0x10(%ebp),%ebx
  800842:	89 f0                	mov    %esi,%eax
  800844:	eb 0f                	jmp    800855 <strncpy+0x23>
  800846:	83 c0 01             	add    $0x1,%eax
  800849:	0f b6 0a             	movzbl (%edx),%ecx
  80084c:	88 48 ff             	mov    %cl,-0x1(%eax)
  80084f:	80 f9 01             	cmp    $0x1,%cl
  800852:	83 da ff             	sbb    $0xffffffff,%edx
  800855:	39 d8                	cmp    %ebx,%eax
  800857:	75 ed                	jne    800846 <strncpy+0x14>
  800859:	89 f0                	mov    %esi,%eax
  80085b:	5b                   	pop    %ebx
  80085c:	5e                   	pop    %esi
  80085d:	5d                   	pop    %ebp
  80085e:	c3                   	ret

0080085f <strlcpy>:
  80085f:	55                   	push   %ebp
  800860:	89 e5                	mov    %esp,%ebp
  800862:	56                   	push   %esi
  800863:	53                   	push   %ebx
  800864:	8b 75 08             	mov    0x8(%ebp),%esi
  800867:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80086a:	8b 55 10             	mov    0x10(%ebp),%edx
  80086d:	89 f0                	mov    %esi,%eax
  80086f:	85 d2                	test   %edx,%edx
  800871:	74 21                	je     800894 <strlcpy+0x35>
  800873:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800877:	89 f2                	mov    %esi,%edx
  800879:	eb 09                	jmp    800884 <strlcpy+0x25>
  80087b:	83 c1 01             	add    $0x1,%ecx
  80087e:	83 c2 01             	add    $0x1,%edx
  800881:	88 5a ff             	mov    %bl,-0x1(%edx)
  800884:	39 c2                	cmp    %eax,%edx
  800886:	74 09                	je     800891 <strlcpy+0x32>
  800888:	0f b6 19             	movzbl (%ecx),%ebx
  80088b:	84 db                	test   %bl,%bl
  80088d:	75 ec                	jne    80087b <strlcpy+0x1c>
  80088f:	89 d0                	mov    %edx,%eax
  800891:	c6 00 00             	movb   $0x0,(%eax)
  800894:	29 f0                	sub    %esi,%eax
  800896:	5b                   	pop    %ebx
  800897:	5e                   	pop    %esi
  800898:	5d                   	pop    %ebp
  800899:	c3                   	ret

0080089a <strcmp>:
  80089a:	55                   	push   %ebp
  80089b:	89 e5                	mov    %esp,%ebp
  80089d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008a0:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008a3:	eb 06                	jmp    8008ab <strcmp+0x11>
  8008a5:	83 c1 01             	add    $0x1,%ecx
  8008a8:	83 c2 01             	add    $0x1,%edx
  8008ab:	0f b6 01             	movzbl (%ecx),%eax
  8008ae:	84 c0                	test   %al,%al
  8008b0:	74 04                	je     8008b6 <strcmp+0x1c>
  8008b2:	3a 02                	cmp    (%edx),%al
  8008b4:	74 ef                	je     8008a5 <strcmp+0xb>
  8008b6:	0f b6 c0             	movzbl %al,%eax
  8008b9:	0f b6 12             	movzbl (%edx),%edx
  8008bc:	29 d0                	sub    %edx,%eax
  8008be:	5d                   	pop    %ebp
  8008bf:	c3                   	ret

008008c0 <strncmp>:
  8008c0:	55                   	push   %ebp
  8008c1:	89 e5                	mov    %esp,%ebp
  8008c3:	53                   	push   %ebx
  8008c4:	8b 45 08             	mov    0x8(%ebp),%eax
  8008c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8008ca:	8b 55 10             	mov    0x10(%ebp),%edx
  8008cd:	eb 09                	jmp    8008d8 <strncmp+0x18>
  8008cf:	83 ea 01             	sub    $0x1,%edx
  8008d2:	83 c0 01             	add    $0x1,%eax
  8008d5:	83 c1 01             	add    $0x1,%ecx
  8008d8:	85 d2                	test   %edx,%edx
  8008da:	74 18                	je     8008f4 <strncmp+0x34>
  8008dc:	0f b6 18             	movzbl (%eax),%ebx
  8008df:	84 db                	test   %bl,%bl
  8008e1:	74 04                	je     8008e7 <strncmp+0x27>
  8008e3:	3a 19                	cmp    (%ecx),%bl
  8008e5:	74 e8                	je     8008cf <strncmp+0xf>
  8008e7:	0f b6 00             	movzbl (%eax),%eax
  8008ea:	0f b6 11             	movzbl (%ecx),%edx
  8008ed:	29 d0                	sub    %edx,%eax
  8008ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008f2:	c9                   	leave
  8008f3:	c3                   	ret
  8008f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8008f9:	eb f4                	jmp    8008ef <strncmp+0x2f>

008008fb <strchr>:
  8008fb:	55                   	push   %ebp
  8008fc:	89 e5                	mov    %esp,%ebp
  8008fe:	8b 45 08             	mov    0x8(%ebp),%eax
  800901:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800905:	eb 03                	jmp    80090a <strchr+0xf>
  800907:	83 c0 01             	add    $0x1,%eax
  80090a:	0f b6 10             	movzbl (%eax),%edx
  80090d:	84 d2                	test   %dl,%dl
  80090f:	74 06                	je     800917 <strchr+0x1c>
  800911:	38 ca                	cmp    %cl,%dl
  800913:	75 f2                	jne    800907 <strchr+0xc>
  800915:	eb 05                	jmp    80091c <strchr+0x21>
  800917:	b8 00 00 00 00       	mov    $0x0,%eax
  80091c:	5d                   	pop    %ebp
  80091d:	c3                   	ret

0080091e <strfind>:
  80091e:	55                   	push   %ebp
  80091f:	89 e5                	mov    %esp,%ebp
  800921:	8b 45 08             	mov    0x8(%ebp),%eax
  800924:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800928:	0f b6 10             	movzbl (%eax),%edx
  80092b:	38 ca                	cmp    %cl,%dl
  80092d:	74 09                	je     800938 <strfind+0x1a>
  80092f:	84 d2                	test   %dl,%dl
  800931:	74 05                	je     800938 <strfind+0x1a>
  800933:	83 c0 01             	add    $0x1,%eax
  800936:	eb f0                	jmp    800928 <strfind+0xa>
  800938:	5d                   	pop    %ebp
  800939:	c3                   	ret

0080093a <memset>:
  80093a:	55                   	push   %ebp
  80093b:	89 e5                	mov    %esp,%ebp
  80093d:	57                   	push   %edi
  80093e:	8b 55 08             	mov    0x8(%ebp),%edx
  800941:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800944:	85 c9                	test   %ecx,%ecx
  800946:	74 24                	je     80096c <memset+0x32>
  800948:	89 d0                	mov    %edx,%eax
  80094a:	09 c8                	or     %ecx,%eax
  80094c:	a8 03                	test   $0x3,%al
  80094e:	75 14                	jne    800964 <memset+0x2a>
  800950:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800954:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  80095a:	c1 e9 02             	shr    $0x2,%ecx
  80095d:	89 d7                	mov    %edx,%edi
  80095f:	fc                   	cld
  800960:	f3 ab                	rep stos %eax,%es:(%edi)
  800962:	eb 08                	jmp    80096c <memset+0x32>
  800964:	89 d7                	mov    %edx,%edi
  800966:	8b 45 0c             	mov    0xc(%ebp),%eax
  800969:	fc                   	cld
  80096a:	f3 aa                	rep stos %al,%es:(%edi)
  80096c:	89 d0                	mov    %edx,%eax
  80096e:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800971:	c9                   	leave
  800972:	c3                   	ret

00800973 <memmove>:
  800973:	55                   	push   %ebp
  800974:	89 e5                	mov    %esp,%ebp
  800976:	57                   	push   %edi
  800977:	56                   	push   %esi
  800978:	8b 45 08             	mov    0x8(%ebp),%eax
  80097b:	8b 75 0c             	mov    0xc(%ebp),%esi
  80097e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800981:	39 c6                	cmp    %eax,%esi
  800983:	73 32                	jae    8009b7 <memmove+0x44>
  800985:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800988:	39 d0                	cmp    %edx,%eax
  80098a:	73 2b                	jae    8009b7 <memmove+0x44>
  80098c:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  80098f:	89 fe                	mov    %edi,%esi
  800991:	09 ce                	or     %ecx,%esi
  800993:	09 d6                	or     %edx,%esi
  800995:	f7 c6 03 00 00 00    	test   $0x3,%esi
  80099b:	75 0e                	jne    8009ab <memmove+0x38>
  80099d:	83 ef 04             	sub    $0x4,%edi
  8009a0:	8d 72 fc             	lea    -0x4(%edx),%esi
  8009a3:	c1 e9 02             	shr    $0x2,%ecx
  8009a6:	fd                   	std
  8009a7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8009a9:	eb 09                	jmp    8009b4 <memmove+0x41>
  8009ab:	83 ef 01             	sub    $0x1,%edi
  8009ae:	8d 72 ff             	lea    -0x1(%edx),%esi
  8009b1:	fd                   	std
  8009b2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8009b4:	fc                   	cld
  8009b5:	eb 1a                	jmp    8009d1 <memmove+0x5e>
  8009b7:	89 c2                	mov    %eax,%edx
  8009b9:	09 ca                	or     %ecx,%edx
  8009bb:	09 f2                	or     %esi,%edx
  8009bd:	f6 c2 03             	test   $0x3,%dl
  8009c0:	75 0a                	jne    8009cc <memmove+0x59>
  8009c2:	c1 e9 02             	shr    $0x2,%ecx
  8009c5:	89 c7                	mov    %eax,%edi
  8009c7:	fc                   	cld
  8009c8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8009ca:	eb 05                	jmp    8009d1 <memmove+0x5e>
  8009cc:	89 c7                	mov    %eax,%edi
  8009ce:	fc                   	cld
  8009cf:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8009d1:	5e                   	pop    %esi
  8009d2:	5f                   	pop    %edi
  8009d3:	5d                   	pop    %ebp
  8009d4:	c3                   	ret

008009d5 <memcpy>:
  8009d5:	55                   	push   %ebp
  8009d6:	89 e5                	mov    %esp,%ebp
  8009d8:	83 ec 0c             	sub    $0xc,%esp
  8009db:	ff 75 10             	push   0x10(%ebp)
  8009de:	ff 75 0c             	push   0xc(%ebp)
  8009e1:	ff 75 08             	push   0x8(%ebp)
  8009e4:	e8 8a ff ff ff       	call   800973 <memmove>
  8009e9:	c9                   	leave
  8009ea:	c3                   	ret

008009eb <memcmp>:
  8009eb:	55                   	push   %ebp
  8009ec:	89 e5                	mov    %esp,%ebp
  8009ee:	56                   	push   %esi
  8009ef:	53                   	push   %ebx
  8009f0:	8b 45 08             	mov    0x8(%ebp),%eax
  8009f3:	8b 55 0c             	mov    0xc(%ebp),%edx
  8009f6:	89 c6                	mov    %eax,%esi
  8009f8:	03 75 10             	add    0x10(%ebp),%esi
  8009fb:	eb 06                	jmp    800a03 <memcmp+0x18>
  8009fd:	83 c0 01             	add    $0x1,%eax
  800a00:	83 c2 01             	add    $0x1,%edx
  800a03:	39 f0                	cmp    %esi,%eax
  800a05:	74 14                	je     800a1b <memcmp+0x30>
  800a07:	0f b6 08             	movzbl (%eax),%ecx
  800a0a:	0f b6 1a             	movzbl (%edx),%ebx
  800a0d:	38 d9                	cmp    %bl,%cl
  800a0f:	74 ec                	je     8009fd <memcmp+0x12>
  800a11:	0f b6 c1             	movzbl %cl,%eax
  800a14:	0f b6 db             	movzbl %bl,%ebx
  800a17:	29 d8                	sub    %ebx,%eax
  800a19:	eb 05                	jmp    800a20 <memcmp+0x35>
  800a1b:	b8 00 00 00 00       	mov    $0x0,%eax
  800a20:	5b                   	pop    %ebx
  800a21:	5e                   	pop    %esi
  800a22:	5d                   	pop    %ebp
  800a23:	c3                   	ret

00800a24 <memfind>:
  800a24:	55                   	push   %ebp
  800a25:	89 e5                	mov    %esp,%ebp
  800a27:	8b 45 08             	mov    0x8(%ebp),%eax
  800a2a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800a2d:	89 c2                	mov    %eax,%edx
  800a2f:	03 55 10             	add    0x10(%ebp),%edx
  800a32:	eb 03                	jmp    800a37 <memfind+0x13>
  800a34:	83 c0 01             	add    $0x1,%eax
  800a37:	39 d0                	cmp    %edx,%eax
  800a39:	73 04                	jae    800a3f <memfind+0x1b>
  800a3b:	38 08                	cmp    %cl,(%eax)
  800a3d:	75 f5                	jne    800a34 <memfind+0x10>
  800a3f:	5d                   	pop    %ebp
  800a40:	c3                   	ret

00800a41 <strtol>:
  800a41:	55                   	push   %ebp
  800a42:	89 e5                	mov    %esp,%ebp
  800a44:	57                   	push   %edi
  800a45:	56                   	push   %esi
  800a46:	53                   	push   %ebx
  800a47:	8b 55 08             	mov    0x8(%ebp),%edx
  800a4a:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800a4d:	eb 03                	jmp    800a52 <strtol+0x11>
  800a4f:	83 c2 01             	add    $0x1,%edx
  800a52:	0f b6 02             	movzbl (%edx),%eax
  800a55:	3c 20                	cmp    $0x20,%al
  800a57:	74 f6                	je     800a4f <strtol+0xe>
  800a59:	3c 09                	cmp    $0x9,%al
  800a5b:	74 f2                	je     800a4f <strtol+0xe>
  800a5d:	3c 2b                	cmp    $0x2b,%al
  800a5f:	74 2a                	je     800a8b <strtol+0x4a>
  800a61:	bf 00 00 00 00       	mov    $0x0,%edi
  800a66:	3c 2d                	cmp    $0x2d,%al
  800a68:	74 2b                	je     800a95 <strtol+0x54>
  800a6a:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800a70:	75 0f                	jne    800a81 <strtol+0x40>
  800a72:	80 3a 30             	cmpb   $0x30,(%edx)
  800a75:	74 28                	je     800a9f <strtol+0x5e>
  800a77:	85 db                	test   %ebx,%ebx
  800a79:	b8 0a 00 00 00       	mov    $0xa,%eax
  800a7e:	0f 44 d8             	cmove  %eax,%ebx
  800a81:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a86:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800a89:	eb 46                	jmp    800ad1 <strtol+0x90>
  800a8b:	83 c2 01             	add    $0x1,%edx
  800a8e:	bf 00 00 00 00       	mov    $0x0,%edi
  800a93:	eb d5                	jmp    800a6a <strtol+0x29>
  800a95:	83 c2 01             	add    $0x1,%edx
  800a98:	bf 01 00 00 00       	mov    $0x1,%edi
  800a9d:	eb cb                	jmp    800a6a <strtol+0x29>
  800a9f:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800aa3:	74 0e                	je     800ab3 <strtol+0x72>
  800aa5:	85 db                	test   %ebx,%ebx
  800aa7:	75 d8                	jne    800a81 <strtol+0x40>
  800aa9:	83 c2 01             	add    $0x1,%edx
  800aac:	bb 08 00 00 00       	mov    $0x8,%ebx
  800ab1:	eb ce                	jmp    800a81 <strtol+0x40>
  800ab3:	83 c2 02             	add    $0x2,%edx
  800ab6:	bb 10 00 00 00       	mov    $0x10,%ebx
  800abb:	eb c4                	jmp    800a81 <strtol+0x40>
  800abd:	0f be c0             	movsbl %al,%eax
  800ac0:	83 e8 30             	sub    $0x30,%eax
  800ac3:	3b 45 10             	cmp    0x10(%ebp),%eax
  800ac6:	7d 3a                	jge    800b02 <strtol+0xc1>
  800ac8:	83 c2 01             	add    $0x1,%edx
  800acb:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800acf:	01 c1                	add    %eax,%ecx
  800ad1:	0f b6 02             	movzbl (%edx),%eax
  800ad4:	8d 70 d0             	lea    -0x30(%eax),%esi
  800ad7:	89 f3                	mov    %esi,%ebx
  800ad9:	80 fb 09             	cmp    $0x9,%bl
  800adc:	76 df                	jbe    800abd <strtol+0x7c>
  800ade:	8d 70 9f             	lea    -0x61(%eax),%esi
  800ae1:	89 f3                	mov    %esi,%ebx
  800ae3:	80 fb 19             	cmp    $0x19,%bl
  800ae6:	77 08                	ja     800af0 <strtol+0xaf>
  800ae8:	0f be c0             	movsbl %al,%eax
  800aeb:	83 e8 57             	sub    $0x57,%eax
  800aee:	eb d3                	jmp    800ac3 <strtol+0x82>
  800af0:	8d 70 bf             	lea    -0x41(%eax),%esi
  800af3:	89 f3                	mov    %esi,%ebx
  800af5:	80 fb 19             	cmp    $0x19,%bl
  800af8:	77 08                	ja     800b02 <strtol+0xc1>
  800afa:	0f be c0             	movsbl %al,%eax
  800afd:	83 e8 37             	sub    $0x37,%eax
  800b00:	eb c1                	jmp    800ac3 <strtol+0x82>
  800b02:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800b06:	74 05                	je     800b0d <strtol+0xcc>
  800b08:	8b 45 0c             	mov    0xc(%ebp),%eax
  800b0b:	89 10                	mov    %edx,(%eax)
  800b0d:	89 c8                	mov    %ecx,%eax
  800b0f:	f7 d8                	neg    %eax
  800b11:	85 ff                	test   %edi,%edi
  800b13:	0f 45 c8             	cmovne %eax,%ecx
  800b16:	89 c8                	mov    %ecx,%eax
  800b18:	5b                   	pop    %ebx
  800b19:	5e                   	pop    %esi
  800b1a:	5f                   	pop    %edi
  800b1b:	5d                   	pop    %ebp
  800b1c:	c3                   	ret

00800b1d <syscall>:
  800b1d:	55                   	push   %ebp
  800b1e:	89 e5                	mov    %esp,%ebp
  800b20:	57                   	push   %edi
  800b21:	56                   	push   %esi
  800b22:	53                   	push   %ebx
  800b23:	83 ec 1c             	sub    $0x1c,%esp
  800b26:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800b29:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800b2c:	89 ca                	mov    %ecx,%edx
  800b2e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b31:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800b34:	8b 7d 10             	mov    0x10(%ebp),%edi
  800b37:	8b 75 14             	mov    0x14(%ebp),%esi
  800b3a:	cd 30                	int    $0x30
  800b3c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800b40:	74 04                	je     800b46 <syscall+0x29>
  800b42:	85 c0                	test   %eax,%eax
  800b44:	7f 08                	jg     800b4e <syscall+0x31>
  800b46:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800b49:	5b                   	pop    %ebx
  800b4a:	5e                   	pop    %esi
  800b4b:	5f                   	pop    %edi
  800b4c:	5d                   	pop    %ebp
  800b4d:	c3                   	ret
  800b4e:	83 ec 0c             	sub    $0xc,%esp
  800b51:	50                   	push   %eax
  800b52:	ff 75 e0             	push   -0x20(%ebp)
  800b55:	68 7d 16 80 00       	push   $0x80167d
  800b5a:	6a 1e                	push   $0x1e
  800b5c:	68 9a 16 80 00       	push   $0x80169a
  800b61:	e8 12 07 00 00       	call   801278 <_panic>

00800b66 <sys_cputs>:
  800b66:	55                   	push   %ebp
  800b67:	89 e5                	mov    %esp,%ebp
  800b69:	83 ec 08             	sub    $0x8,%esp
  800b6c:	6a 00                	push   $0x0
  800b6e:	6a 00                	push   $0x0
  800b70:	6a 00                	push   $0x0
  800b72:	ff 75 0c             	push   0xc(%ebp)
  800b75:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b78:	ba 00 00 00 00       	mov    $0x0,%edx
  800b7d:	b8 00 00 00 00       	mov    $0x0,%eax
  800b82:	e8 96 ff ff ff       	call   800b1d <syscall>
  800b87:	83 c4 10             	add    $0x10,%esp
  800b8a:	c9                   	leave
  800b8b:	c3                   	ret

00800b8c <sys_cgetc>:
  800b8c:	55                   	push   %ebp
  800b8d:	89 e5                	mov    %esp,%ebp
  800b8f:	83 ec 08             	sub    $0x8,%esp
  800b92:	6a 00                	push   $0x0
  800b94:	6a 00                	push   $0x0
  800b96:	6a 00                	push   $0x0
  800b98:	6a 00                	push   $0x0
  800b9a:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b9f:	ba 00 00 00 00       	mov    $0x0,%edx
  800ba4:	b8 01 00 00 00       	mov    $0x1,%eax
  800ba9:	e8 6f ff ff ff       	call   800b1d <syscall>
  800bae:	c9                   	leave
  800baf:	c3                   	ret

00800bb0 <sys_env_destroy>:
  800bb0:	55                   	push   %ebp
  800bb1:	89 e5                	mov    %esp,%ebp
  800bb3:	83 ec 08             	sub    $0x8,%esp
  800bb6:	6a 00                	push   $0x0
  800bb8:	6a 00                	push   $0x0
  800bba:	6a 00                	push   $0x0
  800bbc:	6a 00                	push   $0x0
  800bbe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bc1:	ba 01 00 00 00       	mov    $0x1,%edx
  800bc6:	b8 03 00 00 00       	mov    $0x3,%eax
  800bcb:	e8 4d ff ff ff       	call   800b1d <syscall>
  800bd0:	c9                   	leave
  800bd1:	c3                   	ret

00800bd2 <sys_getenvid>:
  800bd2:	55                   	push   %ebp
  800bd3:	89 e5                	mov    %esp,%ebp
  800bd5:	83 ec 08             	sub    $0x8,%esp
  800bd8:	6a 00                	push   $0x0
  800bda:	6a 00                	push   $0x0
  800bdc:	6a 00                	push   $0x0
  800bde:	6a 00                	push   $0x0
  800be0:	b9 00 00 00 00       	mov    $0x0,%ecx
  800be5:	ba 00 00 00 00       	mov    $0x0,%edx
  800bea:	b8 02 00 00 00       	mov    $0x2,%eax
  800bef:	e8 29 ff ff ff       	call   800b1d <syscall>
  800bf4:	c9                   	leave
  800bf5:	c3                   	ret

00800bf6 <sys_yield>:
  800bf6:	55                   	push   %ebp
  800bf7:	89 e5                	mov    %esp,%ebp
  800bf9:	83 ec 08             	sub    $0x8,%esp
  800bfc:	6a 00                	push   $0x0
  800bfe:	6a 00                	push   $0x0
  800c00:	6a 00                	push   $0x0
  800c02:	6a 00                	push   $0x0
  800c04:	b9 00 00 00 00       	mov    $0x0,%ecx
  800c09:	ba 00 00 00 00       	mov    $0x0,%edx
  800c0e:	b8 0a 00 00 00       	mov    $0xa,%eax
  800c13:	e8 05 ff ff ff       	call   800b1d <syscall>
  800c18:	83 c4 10             	add    $0x10,%esp
  800c1b:	c9                   	leave
  800c1c:	c3                   	ret

00800c1d <sys_page_alloc>:
  800c1d:	55                   	push   %ebp
  800c1e:	89 e5                	mov    %esp,%ebp
  800c20:	83 ec 08             	sub    $0x8,%esp
  800c23:	6a 00                	push   $0x0
  800c25:	6a 00                	push   $0x0
  800c27:	ff 75 10             	push   0x10(%ebp)
  800c2a:	ff 75 0c             	push   0xc(%ebp)
  800c2d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c30:	ba 01 00 00 00       	mov    $0x1,%edx
  800c35:	b8 04 00 00 00       	mov    $0x4,%eax
  800c3a:	e8 de fe ff ff       	call   800b1d <syscall>
  800c3f:	c9                   	leave
  800c40:	c3                   	ret

00800c41 <sys_page_map>:
  800c41:	55                   	push   %ebp
  800c42:	89 e5                	mov    %esp,%ebp
  800c44:	83 ec 08             	sub    $0x8,%esp
  800c47:	ff 75 18             	push   0x18(%ebp)
  800c4a:	ff 75 14             	push   0x14(%ebp)
  800c4d:	ff 75 10             	push   0x10(%ebp)
  800c50:	ff 75 0c             	push   0xc(%ebp)
  800c53:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c56:	ba 01 00 00 00       	mov    $0x1,%edx
  800c5b:	b8 05 00 00 00       	mov    $0x5,%eax
  800c60:	e8 b8 fe ff ff       	call   800b1d <syscall>
  800c65:	c9                   	leave
  800c66:	c3                   	ret

00800c67 <sys_page_unmap>:
  800c67:	55                   	push   %ebp
  800c68:	89 e5                	mov    %esp,%ebp
  800c6a:	83 ec 08             	sub    $0x8,%esp
  800c6d:	6a 00                	push   $0x0
  800c6f:	6a 00                	push   $0x0
  800c71:	6a 00                	push   $0x0
  800c73:	ff 75 0c             	push   0xc(%ebp)
  800c76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c79:	ba 01 00 00 00       	mov    $0x1,%edx
  800c7e:	b8 06 00 00 00       	mov    $0x6,%eax
  800c83:	e8 95 fe ff ff       	call   800b1d <syscall>
  800c88:	c9                   	leave
  800c89:	c3                   	ret

00800c8a <sys_env_set_status>:
  800c8a:	55                   	push   %ebp
  800c8b:	89 e5                	mov    %esp,%ebp
  800c8d:	83 ec 08             	sub    $0x8,%esp
  800c90:	6a 00                	push   $0x0
  800c92:	6a 00                	push   $0x0
  800c94:	6a 00                	push   $0x0
  800c96:	ff 75 0c             	push   0xc(%ebp)
  800c99:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c9c:	ba 01 00 00 00       	mov    $0x1,%edx
  800ca1:	b8 08 00 00 00       	mov    $0x8,%eax
  800ca6:	e8 72 fe ff ff       	call   800b1d <syscall>
  800cab:	c9                   	leave
  800cac:	c3                   	ret

00800cad <sys_env_set_pgfault_upcall>:
  800cad:	55                   	push   %ebp
  800cae:	89 e5                	mov    %esp,%ebp
  800cb0:	83 ec 08             	sub    $0x8,%esp
  800cb3:	6a 00                	push   $0x0
  800cb5:	6a 00                	push   $0x0
  800cb7:	6a 00                	push   $0x0
  800cb9:	ff 75 0c             	push   0xc(%ebp)
  800cbc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800cbf:	ba 01 00 00 00       	mov    $0x1,%edx
  800cc4:	b8 09 00 00 00       	mov    $0x9,%eax
  800cc9:	e8 4f fe ff ff       	call   800b1d <syscall>
  800cce:	c9                   	leave
  800ccf:	c3                   	ret

00800cd0 <sys_ipc_try_send>:
  800cd0:	55                   	push   %ebp
  800cd1:	89 e5                	mov    %esp,%ebp
  800cd3:	83 ec 08             	sub    $0x8,%esp
  800cd6:	6a 00                	push   $0x0
  800cd8:	ff 75 14             	push   0x14(%ebp)
  800cdb:	ff 75 10             	push   0x10(%ebp)
  800cde:	ff 75 0c             	push   0xc(%ebp)
  800ce1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ce4:	ba 00 00 00 00       	mov    $0x0,%edx
  800ce9:	b8 0c 00 00 00       	mov    $0xc,%eax
  800cee:	e8 2a fe ff ff       	call   800b1d <syscall>
  800cf3:	c9                   	leave
  800cf4:	c3                   	ret

00800cf5 <sys_ipc_recv>:
  800cf5:	55                   	push   %ebp
  800cf6:	89 e5                	mov    %esp,%ebp
  800cf8:	83 ec 08             	sub    $0x8,%esp
  800cfb:	6a 00                	push   $0x0
  800cfd:	6a 00                	push   $0x0
  800cff:	6a 00                	push   $0x0
  800d01:	6a 00                	push   $0x0
  800d03:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800d06:	ba 01 00 00 00       	mov    $0x1,%edx
  800d0b:	b8 0d 00 00 00       	mov    $0xd,%eax
  800d10:	e8 08 fe ff ff       	call   800b1d <syscall>
  800d15:	c9                   	leave
  800d16:	c3                   	ret

00800d17 <duppage>:
  800d17:	55                   	push   %ebp
  800d18:	89 e5                	mov    %esp,%ebp
  800d1a:	56                   	push   %esi
  800d1b:	53                   	push   %ebx
  800d1c:	89 c1                	mov    %eax,%ecx
  800d1e:	89 d6                	mov    %edx,%esi
  800d20:	c1 e6 0c             	shl    $0xc,%esi
  800d23:	8b 14 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%edx
  800d2a:	89 d0                	mov    %edx,%eax
  800d2c:	f7 d0                	not    %eax
  800d2e:	a8 05                	test   $0x5,%al
  800d30:	75 5a                	jne    800d8c <duppage+0x75>
  800d32:	89 d0                	mov    %edx,%eax
  800d34:	83 e0 18             	and    $0x18,%eax
  800d37:	83 f8 01             	cmp    $0x1,%eax
  800d3a:	19 c0                	sbb    %eax,%eax
  800d3c:	83 e0 e8             	and    $0xffffffe8,%eax
  800d3f:	83 c0 1d             	add    $0x1d,%eax
  800d42:	f7 c2 02 08 00 00    	test   $0x802,%edx
  800d48:	74 68                	je     800db2 <duppage+0x9b>
  800d4a:	80 cc 08             	or     $0x8,%ah
  800d4d:	89 c3                	mov    %eax,%ebx
  800d4f:	83 ec 0c             	sub    $0xc,%esp
  800d52:	53                   	push   %ebx
  800d53:	56                   	push   %esi
  800d54:	51                   	push   %ecx
  800d55:	56                   	push   %esi
  800d56:	6a 00                	push   $0x0
  800d58:	e8 e4 fe ff ff       	call   800c41 <sys_page_map>
  800d5d:	83 c4 20             	add    $0x20,%esp
  800d60:	85 c0                	test   %eax,%eax
  800d62:	78 3c                	js     800da0 <duppage+0x89>
  800d64:	83 ec 0c             	sub    $0xc,%esp
  800d67:	53                   	push   %ebx
  800d68:	56                   	push   %esi
  800d69:	6a 00                	push   $0x0
  800d6b:	56                   	push   %esi
  800d6c:	6a 00                	push   $0x0
  800d6e:	e8 ce fe ff ff       	call   800c41 <sys_page_map>
  800d73:	83 c4 20             	add    $0x20,%esp
  800d76:	85 c0                	test   %eax,%eax
  800d78:	79 4d                	jns    800dc7 <duppage+0xb0>
  800d7a:	50                   	push   %eax
  800d7b:	68 48 18 80 00       	push   $0x801848
  800d80:	6a 57                	push   $0x57
  800d82:	68 a8 16 80 00       	push   $0x8016a8
  800d87:	e8 ec 04 00 00       	call   801278 <_panic>
  800d8c:	83 ec 04             	sub    $0x4,%esp
  800d8f:	68 ec 17 80 00       	push   $0x8017ec
  800d94:	6a 47                	push   $0x47
  800d96:	68 a8 16 80 00       	push   $0x8016a8
  800d9b:	e8 d8 04 00 00       	call   801278 <_panic>
  800da0:	50                   	push   %eax
  800da1:	68 1c 18 80 00       	push   $0x80181c
  800da6:	6a 53                	push   $0x53
  800da8:	68 a8 16 80 00       	push   $0x8016a8
  800dad:	e8 c6 04 00 00       	call   801278 <_panic>
  800db2:	83 ec 0c             	sub    $0xc,%esp
  800db5:	50                   	push   %eax
  800db6:	56                   	push   %esi
  800db7:	51                   	push   %ecx
  800db8:	56                   	push   %esi
  800db9:	6a 00                	push   $0x0
  800dbb:	e8 81 fe ff ff       	call   800c41 <sys_page_map>
  800dc0:	83 c4 20             	add    $0x20,%esp
  800dc3:	85 c0                	test   %eax,%eax
  800dc5:	78 0c                	js     800dd3 <duppage+0xbc>
  800dc7:	b8 00 00 00 00       	mov    $0x0,%eax
  800dcc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800dcf:	5b                   	pop    %ebx
  800dd0:	5e                   	pop    %esi
  800dd1:	5d                   	pop    %ebp
  800dd2:	c3                   	ret
  800dd3:	50                   	push   %eax
  800dd4:	68 70 18 80 00       	push   $0x801870
  800dd9:	6a 5b                	push   $0x5b
  800ddb:	68 a8 16 80 00       	push   $0x8016a8
  800de0:	e8 93 04 00 00       	call   801278 <_panic>

00800de5 <dup_or_share>:
  800de5:	55                   	push   %ebp
  800de6:	89 e5                	mov    %esp,%ebp
  800de8:	57                   	push   %edi
  800de9:	56                   	push   %esi
  800dea:	53                   	push   %ebx
  800deb:	83 ec 0c             	sub    $0xc,%esp
  800dee:	89 c7                	mov    %eax,%edi
  800df0:	8b 04 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%eax
  800df7:	a8 01                	test   $0x1,%al
  800df9:	74 33                	je     800e2e <dup_or_share+0x49>
  800dfb:	89 d6                	mov    %edx,%esi
  800dfd:	21 c1                	and    %eax,%ecx
  800dff:	89 cb                	mov    %ecx,%ebx
  800e01:	83 e3 02             	and    $0x2,%ebx
  800e04:	89 da                	mov    %ebx,%edx
  800e06:	83 ca 18             	or     $0x18,%edx
  800e09:	a8 18                	test   $0x18,%al
  800e0b:	0f 45 da             	cmovne %edx,%ebx
  800e0e:	c1 e6 0c             	shl    $0xc,%esi
  800e11:	83 e0 1a             	and    $0x1a,%eax
  800e14:	83 f8 02             	cmp    $0x2,%eax
  800e17:	74 32                	je     800e4b <dup_or_share+0x66>
  800e19:	83 ec 0c             	sub    $0xc,%esp
  800e1c:	53                   	push   %ebx
  800e1d:	56                   	push   %esi
  800e1e:	57                   	push   %edi
  800e1f:	56                   	push   %esi
  800e20:	6a 00                	push   $0x0
  800e22:	e8 1a fe ff ff       	call   800c41 <sys_page_map>
  800e27:	83 c4 20             	add    $0x20,%esp
  800e2a:	85 c0                	test   %eax,%eax
  800e2c:	78 08                	js     800e36 <dup_or_share+0x51>
  800e2e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800e31:	5b                   	pop    %ebx
  800e32:	5e                   	pop    %esi
  800e33:	5f                   	pop    %edi
  800e34:	5d                   	pop    %ebp
  800e35:	c3                   	ret
  800e36:	50                   	push   %eax
  800e37:	68 9c 18 80 00       	push   $0x80189c
  800e3c:	68 84 00 00 00       	push   $0x84
  800e41:	68 a8 16 80 00       	push   $0x8016a8
  800e46:	e8 2d 04 00 00       	call   801278 <_panic>
  800e4b:	83 ec 04             	sub    $0x4,%esp
  800e4e:	53                   	push   %ebx
  800e4f:	56                   	push   %esi
  800e50:	57                   	push   %edi
  800e51:	e8 c7 fd ff ff       	call   800c1d <sys_page_alloc>
  800e56:	83 c4 10             	add    $0x10,%esp
  800e59:	85 c0                	test   %eax,%eax
  800e5b:	78 57                	js     800eb4 <dup_or_share+0xcf>
  800e5d:	83 ec 0c             	sub    $0xc,%esp
  800e60:	53                   	push   %ebx
  800e61:	68 00 00 40 00       	push   $0x400000
  800e66:	6a 00                	push   $0x0
  800e68:	56                   	push   %esi
  800e69:	57                   	push   %edi
  800e6a:	e8 d2 fd ff ff       	call   800c41 <sys_page_map>
  800e6f:	83 c4 20             	add    $0x20,%esp
  800e72:	85 c0                	test   %eax,%eax
  800e74:	78 53                	js     800ec9 <dup_or_share+0xe4>
  800e76:	83 ec 04             	sub    $0x4,%esp
  800e79:	68 00 10 00 00       	push   $0x1000
  800e7e:	56                   	push   %esi
  800e7f:	68 00 00 40 00       	push   $0x400000
  800e84:	e8 ea fa ff ff       	call   800973 <memmove>
  800e89:	83 c4 08             	add    $0x8,%esp
  800e8c:	68 00 00 40 00       	push   $0x400000
  800e91:	6a 00                	push   $0x0
  800e93:	e8 cf fd ff ff       	call   800c67 <sys_page_unmap>
  800e98:	83 c4 10             	add    $0x10,%esp
  800e9b:	85 c0                	test   %eax,%eax
  800e9d:	79 8f                	jns    800e2e <dup_or_share+0x49>
  800e9f:	50                   	push   %eax
  800ea0:	68 f2 16 80 00       	push   $0x8016f2
  800ea5:	68 8d 00 00 00       	push   $0x8d
  800eaa:	68 a8 16 80 00       	push   $0x8016a8
  800eaf:	e8 c4 03 00 00       	call   801278 <_panic>
  800eb4:	50                   	push   %eax
  800eb5:	68 bc 18 80 00       	push   $0x8018bc
  800eba:	68 88 00 00 00       	push   $0x88
  800ebf:	68 a8 16 80 00       	push   $0x8016a8
  800ec4:	e8 af 03 00 00       	call   801278 <_panic>
  800ec9:	50                   	push   %eax
  800eca:	68 9c 18 80 00       	push   $0x80189c
  800ecf:	68 8a 00 00 00       	push   $0x8a
  800ed4:	68 a8 16 80 00       	push   $0x8016a8
  800ed9:	e8 9a 03 00 00       	call   801278 <_panic>

00800ede <pgfault>:
  800ede:	55                   	push   %ebp
  800edf:	89 e5                	mov    %esp,%ebp
  800ee1:	53                   	push   %ebx
  800ee2:	83 ec 08             	sub    $0x8,%esp
  800ee5:	8b 45 08             	mov    0x8(%ebp),%eax
  800ee8:	8b 18                	mov    (%eax),%ebx
  800eea:	89 d8                	mov    %ebx,%eax
  800eec:	c1 e8 0c             	shr    $0xc,%eax
  800eef:	8b 04 85 00 00 40 ef 	mov    -0x10c00000(,%eax,4),%eax
  800ef6:	6a 07                	push   $0x7
  800ef8:	68 00 f0 7f 00       	push   $0x7ff000
  800efd:	6a 00                	push   $0x0
  800eff:	e8 19 fd ff ff       	call   800c1d <sys_page_alloc>
  800f04:	83 c4 10             	add    $0x10,%esp
  800f07:	85 c0                	test   %eax,%eax
  800f09:	78 51                	js     800f5c <pgfault+0x7e>
  800f0b:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  800f11:	83 ec 04             	sub    $0x4,%esp
  800f14:	68 00 10 00 00       	push   $0x1000
  800f19:	53                   	push   %ebx
  800f1a:	68 00 f0 7f 00       	push   $0x7ff000
  800f1f:	e8 4f fa ff ff       	call   800973 <memmove>
  800f24:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  800f2b:	53                   	push   %ebx
  800f2c:	6a 00                	push   $0x0
  800f2e:	68 00 f0 7f 00       	push   $0x7ff000
  800f33:	6a 00                	push   $0x0
  800f35:	e8 07 fd ff ff       	call   800c41 <sys_page_map>
  800f3a:	83 c4 20             	add    $0x20,%esp
  800f3d:	85 c0                	test   %eax,%eax
  800f3f:	78 2d                	js     800f6e <pgfault+0x90>
  800f41:	83 ec 08             	sub    $0x8,%esp
  800f44:	68 00 f0 7f 00       	push   $0x7ff000
  800f49:	6a 00                	push   $0x0
  800f4b:	e8 17 fd ff ff       	call   800c67 <sys_page_unmap>
  800f50:	83 c4 10             	add    $0x10,%esp
  800f53:	85 c0                	test   %eax,%eax
  800f55:	78 29                	js     800f80 <pgfault+0xa2>
  800f57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800f5a:	c9                   	leave
  800f5b:	c3                   	ret
  800f5c:	50                   	push   %eax
  800f5d:	68 b3 16 80 00       	push   $0x8016b3
  800f62:	6a 27                	push   $0x27
  800f64:	68 a8 16 80 00       	push   $0x8016a8
  800f69:	e8 0a 03 00 00       	call   801278 <_panic>
  800f6e:	50                   	push   %eax
  800f6f:	68 cf 16 80 00       	push   $0x8016cf
  800f74:	6a 2c                	push   $0x2c
  800f76:	68 a8 16 80 00       	push   $0x8016a8
  800f7b:	e8 f8 02 00 00       	call   801278 <_panic>
  800f80:	50                   	push   %eax
  800f81:	68 e9 16 80 00       	push   $0x8016e9
  800f86:	6a 2f                	push   $0x2f
  800f88:	68 a8 16 80 00       	push   $0x8016a8
  800f8d:	e8 e6 02 00 00       	call   801278 <_panic>

00800f92 <fork_v0>:
  800f92:	55                   	push   %ebp
  800f93:	89 e5                	mov    %esp,%ebp
  800f95:	56                   	push   %esi
  800f96:	53                   	push   %ebx
  800f97:	b8 07 00 00 00       	mov    $0x7,%eax
  800f9c:	cd 30                	int    $0x30
  800f9e:	89 c6                	mov    %eax,%esi
  800fa0:	85 c0                	test   %eax,%eax
  800fa2:	78 23                	js     800fc7 <fork_v0+0x35>
  800fa4:	bb 00 00 00 00       	mov    $0x0,%ebx
  800fa9:	75 3c                	jne    800fe7 <fork_v0+0x55>
  800fab:	e8 22 fc ff ff       	call   800bd2 <sys_getenvid>
  800fb0:	25 ff 03 00 00       	and    $0x3ff,%eax
  800fb5:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800fbb:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800fc0:	a3 0c 20 80 00       	mov    %eax,0x80200c
  800fc5:	eb 54                	jmp    80101b <fork_v0+0x89>
  800fc7:	50                   	push   %eax
  800fc8:	68 05 17 80 00       	push   $0x801705
  800fcd:	68 a2 00 00 00       	push   $0xa2
  800fd2:	68 a8 16 80 00       	push   $0x8016a8
  800fd7:	e8 9c 02 00 00       	call   801278 <_panic>
  800fdc:	83 c3 01             	add    $0x1,%ebx
  800fdf:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800fe5:	74 22                	je     801009 <fork_v0+0x77>
  800fe7:	89 d8                	mov    %ebx,%eax
  800fe9:	c1 e8 0a             	shr    $0xa,%eax
  800fec:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800ff3:	f7 d0                	not    %eax
  800ff5:	a8 05                	test   $0x5,%al
  800ff7:	75 e3                	jne    800fdc <fork_v0+0x4a>
  800ff9:	b9 07 00 00 00       	mov    $0x7,%ecx
  800ffe:	89 da                	mov    %ebx,%edx
  801000:	89 f0                	mov    %esi,%eax
  801002:	e8 de fd ff ff       	call   800de5 <dup_or_share>
  801007:	eb d3                	jmp    800fdc <fork_v0+0x4a>
  801009:	83 ec 08             	sub    $0x8,%esp
  80100c:	6a 02                	push   $0x2
  80100e:	56                   	push   %esi
  80100f:	e8 76 fc ff ff       	call   800c8a <sys_env_set_status>
  801014:	83 c4 10             	add    $0x10,%esp
  801017:	85 c0                	test   %eax,%eax
  801019:	78 09                	js     801024 <fork_v0+0x92>
  80101b:	89 f0                	mov    %esi,%eax
  80101d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  801020:	5b                   	pop    %ebx
  801021:	5e                   	pop    %esi
  801022:	5d                   	pop    %ebp
  801023:	c3                   	ret
  801024:	50                   	push   %eax
  801025:	68 15 17 80 00       	push   $0x801715
  80102a:	68 b8 00 00 00       	push   $0xb8
  80102f:	68 a8 16 80 00       	push   $0x8016a8
  801034:	e8 3f 02 00 00       	call   801278 <_panic>

00801039 <fork>:
  801039:	55                   	push   %ebp
  80103a:	89 e5                	mov    %esp,%ebp
  80103c:	56                   	push   %esi
  80103d:	53                   	push   %ebx
  80103e:	83 ec 0c             	sub    $0xc,%esp
  801041:	68 de 0e 80 00       	push   $0x800ede
  801046:	e8 73 02 00 00       	call   8012be <set_pgfault_handler>
  80104b:	b8 07 00 00 00       	mov    $0x7,%eax
  801050:	cd 30                	int    $0x30
  801052:	89 c6                	mov    %eax,%esi
  801054:	83 c4 10             	add    $0x10,%esp
  801057:	85 c0                	test   %eax,%eax
  801059:	78 26                	js     801081 <fork+0x48>
  80105b:	bb 00 00 00 00       	mov    $0x0,%ebx
  801060:	75 47                	jne    8010a9 <fork+0x70>
  801062:	e8 6b fb ff ff       	call   800bd2 <sys_getenvid>
  801067:	25 ff 03 00 00       	and    $0x3ff,%eax
  80106c:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  801072:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  801077:	a3 0c 20 80 00       	mov    %eax,0x80200c
  80107c:	e9 94 00 00 00       	jmp    801115 <fork+0xdc>
  801081:	50                   	push   %eax
  801082:	68 05 17 80 00       	push   $0x801705
  801087:	68 d5 00 00 00       	push   $0xd5
  80108c:	68 a8 16 80 00       	push   $0x8016a8
  801091:	e8 e2 01 00 00       	call   801278 <_panic>
  801096:	83 c3 01             	add    $0x1,%ebx
  801099:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  80109f:	74 32                	je     8010d3 <fork+0x9a>
  8010a1:	81 fb ff eb 0e 00    	cmp    $0xeebff,%ebx
  8010a7:	74 ed                	je     801096 <fork+0x5d>
  8010a9:	89 d8                	mov    %ebx,%eax
  8010ab:	c1 e8 0a             	shr    $0xa,%eax
  8010ae:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  8010b5:	f7 d0                	not    %eax
  8010b7:	a8 05                	test   $0x5,%al
  8010b9:	75 db                	jne    801096 <fork+0x5d>
  8010bb:	8b 04 9d 00 00 40 ef 	mov    -0x10c00000(,%ebx,4),%eax
  8010c2:	f7 d0                	not    %eax
  8010c4:	a8 05                	test   $0x5,%al
  8010c6:	75 ce                	jne    801096 <fork+0x5d>
  8010c8:	89 da                	mov    %ebx,%edx
  8010ca:	89 f0                	mov    %esi,%eax
  8010cc:	e8 46 fc ff ff       	call   800d17 <duppage>
  8010d1:	eb c3                	jmp    801096 <fork+0x5d>
  8010d3:	83 ec 04             	sub    $0x4,%esp
  8010d6:	6a 07                	push   $0x7
  8010d8:	68 00 f0 bf ee       	push   $0xeebff000
  8010dd:	56                   	push   %esi
  8010de:	e8 3a fb ff ff       	call   800c1d <sys_page_alloc>
  8010e3:	83 c4 10             	add    $0x10,%esp
  8010e6:	85 c0                	test   %eax,%eax
  8010e8:	78 34                	js     80111e <fork+0xe5>
  8010ea:	a1 0c 20 80 00       	mov    0x80200c,%eax
  8010ef:	8b 40 64             	mov    0x64(%eax),%eax
  8010f2:	83 ec 08             	sub    $0x8,%esp
  8010f5:	50                   	push   %eax
  8010f6:	56                   	push   %esi
  8010f7:	e8 b1 fb ff ff       	call   800cad <sys_env_set_pgfault_upcall>
  8010fc:	83 c4 10             	add    $0x10,%esp
  8010ff:	85 c0                	test   %eax,%eax
  801101:	78 30                	js     801133 <fork+0xfa>
  801103:	83 ec 08             	sub    $0x8,%esp
  801106:	6a 02                	push   $0x2
  801108:	56                   	push   %esi
  801109:	e8 7c fb ff ff       	call   800c8a <sys_env_set_status>
  80110e:	83 c4 10             	add    $0x10,%esp
  801111:	85 c0                	test   %eax,%eax
  801113:	78 33                	js     801148 <fork+0x10f>
  801115:	89 f0                	mov    %esi,%eax
  801117:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80111a:	5b                   	pop    %ebx
  80111b:	5e                   	pop    %esi
  80111c:	5d                   	pop    %ebp
  80111d:	c3                   	ret
  80111e:	50                   	push   %eax
  80111f:	68 e0 18 80 00       	push   $0x8018e0
  801124:	68 f2 00 00 00       	push   $0xf2
  801129:	68 a8 16 80 00       	push   $0x8016a8
  80112e:	e8 45 01 00 00       	call   801278 <_panic>
  801133:	50                   	push   %eax
  801134:	68 0c 19 80 00       	push   $0x80190c
  801139:	68 f5 00 00 00       	push   $0xf5
  80113e:	68 a8 16 80 00       	push   $0x8016a8
  801143:	e8 30 01 00 00       	call   801278 <_panic>
  801148:	50                   	push   %eax
  801149:	68 15 17 80 00       	push   $0x801715
  80114e:	68 f8 00 00 00       	push   $0xf8
  801153:	68 a8 16 80 00       	push   $0x8016a8
  801158:	e8 1b 01 00 00       	call   801278 <_panic>

0080115d <sfork>:
  80115d:	55                   	push   %ebp
  80115e:	89 e5                	mov    %esp,%ebp
  801160:	83 ec 0c             	sub    $0xc,%esp
  801163:	68 2c 17 80 00       	push   $0x80172c
  801168:	68 01 01 00 00       	push   $0x101
  80116d:	68 a8 16 80 00       	push   $0x8016a8
  801172:	e8 01 01 00 00       	call   801278 <_panic>

00801177 <ipc_recv>:
  801177:	55                   	push   %ebp
  801178:	89 e5                	mov    %esp,%ebp
  80117a:	56                   	push   %esi
  80117b:	53                   	push   %ebx
  80117c:	8b 75 08             	mov    0x8(%ebp),%esi
  80117f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  801182:	83 ec 0c             	sub    $0xc,%esp
  801185:	ff 75 0c             	push   0xc(%ebp)
  801188:	e8 68 fb ff ff       	call   800cf5 <sys_ipc_recv>
  80118d:	83 c4 10             	add    $0x10,%esp
  801190:	85 f6                	test   %esi,%esi
  801192:	74 14                	je     8011a8 <ipc_recv+0x31>
  801194:	ba 00 00 00 00       	mov    $0x0,%edx
  801199:	85 c0                	test   %eax,%eax
  80119b:	75 09                	jne    8011a6 <ipc_recv+0x2f>
  80119d:	8b 15 0c 20 80 00    	mov    0x80200c,%edx
  8011a3:	8b 52 74             	mov    0x74(%edx),%edx
  8011a6:	89 16                	mov    %edx,(%esi)
  8011a8:	85 db                	test   %ebx,%ebx
  8011aa:	74 25                	je     8011d1 <ipc_recv+0x5a>
  8011ac:	85 c0                	test   %eax,%eax
  8011ae:	74 0d                	je     8011bd <ipc_recv+0x46>
  8011b0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8011b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8011b9:	5b                   	pop    %ebx
  8011ba:	5e                   	pop    %esi
  8011bb:	5d                   	pop    %ebp
  8011bc:	c3                   	ret
  8011bd:	a1 0c 20 80 00       	mov    0x80200c,%eax
  8011c2:	8b 40 78             	mov    0x78(%eax),%eax
  8011c5:	89 03                	mov    %eax,(%ebx)
  8011c7:	a1 0c 20 80 00       	mov    0x80200c,%eax
  8011cc:	8b 40 70             	mov    0x70(%eax),%eax
  8011cf:	eb e5                	jmp    8011b6 <ipc_recv+0x3f>
  8011d1:	85 c0                	test   %eax,%eax
  8011d3:	75 e1                	jne    8011b6 <ipc_recv+0x3f>
  8011d5:	eb f0                	jmp    8011c7 <ipc_recv+0x50>

008011d7 <ipc_send>:
  8011d7:	55                   	push   %ebp
  8011d8:	89 e5                	mov    %esp,%ebp
  8011da:	57                   	push   %edi
  8011db:	56                   	push   %esi
  8011dc:	53                   	push   %ebx
  8011dd:	83 ec 0c             	sub    $0xc,%esp
  8011e0:	8b 75 0c             	mov    0xc(%ebp),%esi
  8011e3:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8011e6:	8b 7d 14             	mov    0x14(%ebp),%edi
  8011e9:	85 db                	test   %ebx,%ebx
  8011eb:	b8 00 00 c0 ee       	mov    $0xeec00000,%eax
  8011f0:	0f 44 d8             	cmove  %eax,%ebx
  8011f3:	57                   	push   %edi
  8011f4:	53                   	push   %ebx
  8011f5:	56                   	push   %esi
  8011f6:	ff 75 08             	push   0x8(%ebp)
  8011f9:	e8 d2 fa ff ff       	call   800cd0 <sys_ipc_try_send>
  8011fe:	83 c4 10             	add    $0x10,%esp
  801201:	eb 13                	jmp    801216 <ipc_send+0x3f>
  801203:	e8 ee f9 ff ff       	call   800bf6 <sys_yield>
  801208:	57                   	push   %edi
  801209:	53                   	push   %ebx
  80120a:	56                   	push   %esi
  80120b:	ff 75 08             	push   0x8(%ebp)
  80120e:	e8 bd fa ff ff       	call   800cd0 <sys_ipc_try_send>
  801213:	83 c4 10             	add    $0x10,%esp
  801216:	83 f8 f9             	cmp    $0xfffffff9,%eax
  801219:	74 e8                	je     801203 <ipc_send+0x2c>
  80121b:	85 c0                	test   %eax,%eax
  80121d:	78 08                	js     801227 <ipc_send+0x50>
  80121f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  801222:	5b                   	pop    %ebx
  801223:	5e                   	pop    %esi
  801224:	5f                   	pop    %edi
  801225:	5d                   	pop    %ebp
  801226:	c3                   	ret
  801227:	50                   	push   %eax
  801228:	68 42 17 80 00       	push   $0x801742
  80122d:	6a 3b                	push   $0x3b
  80122f:	68 4f 17 80 00       	push   $0x80174f
  801234:	e8 3f 00 00 00       	call   801278 <_panic>

00801239 <ipc_find_env>:
  801239:	55                   	push   %ebp
  80123a:	89 e5                	mov    %esp,%ebp
  80123c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80123f:	b8 00 00 00 00       	mov    $0x0,%eax
  801244:	69 d0 84 00 00 00    	imul   $0x84,%eax,%edx
  80124a:	81 c2 00 00 c0 ee    	add    $0xeec00000,%edx
  801250:	8b 52 50             	mov    0x50(%edx),%edx
  801253:	39 ca                	cmp    %ecx,%edx
  801255:	74 11                	je     801268 <ipc_find_env+0x2f>
  801257:	83 c0 01             	add    $0x1,%eax
  80125a:	3d 00 04 00 00       	cmp    $0x400,%eax
  80125f:	75 e3                	jne    801244 <ipc_find_env+0xb>
  801261:	b8 00 00 00 00       	mov    $0x0,%eax
  801266:	eb 0e                	jmp    801276 <ipc_find_env+0x3d>
  801268:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  80126e:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  801273:	8b 40 48             	mov    0x48(%eax),%eax
  801276:	5d                   	pop    %ebp
  801277:	c3                   	ret

00801278 <_panic>:
  801278:	55                   	push   %ebp
  801279:	89 e5                	mov    %esp,%ebp
  80127b:	56                   	push   %esi
  80127c:	53                   	push   %ebx
  80127d:	8d 5d 14             	lea    0x14(%ebp),%ebx
  801280:	8b 35 08 20 80 00    	mov    0x802008,%esi
  801286:	e8 47 f9 ff ff       	call   800bd2 <sys_getenvid>
  80128b:	83 ec 0c             	sub    $0xc,%esp
  80128e:	ff 75 0c             	push   0xc(%ebp)
  801291:	ff 75 08             	push   0x8(%ebp)
  801294:	56                   	push   %esi
  801295:	50                   	push   %eax
  801296:	68 40 19 80 00       	push   $0x801940
  80129b:	e8 04 f0 ff ff       	call   8002a4 <cprintf>
  8012a0:	83 c4 18             	add    $0x18,%esp
  8012a3:	53                   	push   %ebx
  8012a4:	ff 75 10             	push   0x10(%ebp)
  8012a7:	e8 a7 ef ff ff       	call   800253 <vcprintf>
  8012ac:	c7 04 24 ba 15 80 00 	movl   $0x8015ba,(%esp)
  8012b3:	e8 ec ef ff ff       	call   8002a4 <cprintf>
  8012b8:	83 c4 10             	add    $0x10,%esp
  8012bb:	cc                   	int3
  8012bc:	eb fd                	jmp    8012bb <_panic+0x43>

008012be <set_pgfault_handler>:
  8012be:	55                   	push   %ebp
  8012bf:	89 e5                	mov    %esp,%ebp
  8012c1:	83 ec 08             	sub    $0x8,%esp
  8012c4:	83 3d 10 20 80 00 00 	cmpl   $0x0,0x802010
  8012cb:	74 0a                	je     8012d7 <set_pgfault_handler+0x19>
  8012cd:	8b 45 08             	mov    0x8(%ebp),%eax
  8012d0:	a3 10 20 80 00       	mov    %eax,0x802010
  8012d5:	c9                   	leave
  8012d6:	c3                   	ret
  8012d7:	83 ec 04             	sub    $0x4,%esp
  8012da:	6a 07                	push   $0x7
  8012dc:	68 00 f0 bf ee       	push   $0xeebff000
  8012e1:	6a 00                	push   $0x0
  8012e3:	e8 35 f9 ff ff       	call   800c1d <sys_page_alloc>
  8012e8:	83 c4 10             	add    $0x10,%esp
  8012eb:	85 c0                	test   %eax,%eax
  8012ed:	78 e6                	js     8012d5 <set_pgfault_handler+0x17>
  8012ef:	83 ec 08             	sub    $0x8,%esp
  8012f2:	68 07 13 80 00       	push   $0x801307
  8012f7:	6a 00                	push   $0x0
  8012f9:	e8 af f9 ff ff       	call   800cad <sys_env_set_pgfault_upcall>
  8012fe:	83 c4 10             	add    $0x10,%esp
  801301:	85 c0                	test   %eax,%eax
  801303:	79 c8                	jns    8012cd <set_pgfault_handler+0xf>
  801305:	eb ce                	jmp    8012d5 <set_pgfault_handler+0x17>

00801307 <_pgfault_upcall>:
  801307:	54                   	push   %esp
  801308:	a1 10 20 80 00       	mov    0x802010,%eax
  80130d:	ff d0                	call   *%eax
  80130f:	83 c4 04             	add    $0x4,%esp
  801312:	8b 44 24 28          	mov    0x28(%esp),%eax
  801316:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  80131a:	83 eb 04             	sub    $0x4,%ebx
  80131d:	89 03                	mov    %eax,(%ebx)
  80131f:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  801323:	58                   	pop    %eax
  801324:	58                   	pop    %eax
  801325:	61                   	popa
  801326:	83 c4 04             	add    $0x4,%esp
  801329:	9d                   	popf
  80132a:	5c                   	pop    %esp
  80132b:	c3                   	ret
  80132c:	66 90                	xchg   %ax,%ax
  80132e:	66 90                	xchg   %ax,%ax

00801330 <__udivdi3>:
  801330:	f3 0f 1e fb          	endbr32
  801334:	55                   	push   %ebp
  801335:	57                   	push   %edi
  801336:	56                   	push   %esi
  801337:	53                   	push   %ebx
  801338:	83 ec 1c             	sub    $0x1c,%esp
  80133b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  80133f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  801343:	8b 74 24 34          	mov    0x34(%esp),%esi
  801347:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  80134b:	85 c0                	test   %eax,%eax
  80134d:	75 19                	jne    801368 <__udivdi3+0x38>
  80134f:	39 de                	cmp    %ebx,%esi
  801351:	73 4d                	jae    8013a0 <__udivdi3+0x70>
  801353:	31 ff                	xor    %edi,%edi
  801355:	89 e8                	mov    %ebp,%eax
  801357:	89 f2                	mov    %esi,%edx
  801359:	f7 f3                	div    %ebx
  80135b:	89 fa                	mov    %edi,%edx
  80135d:	83 c4 1c             	add    $0x1c,%esp
  801360:	5b                   	pop    %ebx
  801361:	5e                   	pop    %esi
  801362:	5f                   	pop    %edi
  801363:	5d                   	pop    %ebp
  801364:	c3                   	ret
  801365:	8d 76 00             	lea    0x0(%esi),%esi
  801368:	39 c6                	cmp    %eax,%esi
  80136a:	73 14                	jae    801380 <__udivdi3+0x50>
  80136c:	31 ff                	xor    %edi,%edi
  80136e:	31 c0                	xor    %eax,%eax
  801370:	89 fa                	mov    %edi,%edx
  801372:	83 c4 1c             	add    $0x1c,%esp
  801375:	5b                   	pop    %ebx
  801376:	5e                   	pop    %esi
  801377:	5f                   	pop    %edi
  801378:	5d                   	pop    %ebp
  801379:	c3                   	ret
  80137a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  801380:	0f bd f8             	bsr    %eax,%edi
  801383:	83 f7 1f             	xor    $0x1f,%edi
  801386:	75 48                	jne    8013d0 <__udivdi3+0xa0>
  801388:	39 f0                	cmp    %esi,%eax
  80138a:	72 06                	jb     801392 <__udivdi3+0x62>
  80138c:	31 c0                	xor    %eax,%eax
  80138e:	39 dd                	cmp    %ebx,%ebp
  801390:	72 de                	jb     801370 <__udivdi3+0x40>
  801392:	b8 01 00 00 00       	mov    $0x1,%eax
  801397:	eb d7                	jmp    801370 <__udivdi3+0x40>
  801399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8013a0:	89 d9                	mov    %ebx,%ecx
  8013a2:	85 db                	test   %ebx,%ebx
  8013a4:	75 0b                	jne    8013b1 <__udivdi3+0x81>
  8013a6:	b8 01 00 00 00       	mov    $0x1,%eax
  8013ab:	31 d2                	xor    %edx,%edx
  8013ad:	f7 f3                	div    %ebx
  8013af:	89 c1                	mov    %eax,%ecx
  8013b1:	31 d2                	xor    %edx,%edx
  8013b3:	89 f0                	mov    %esi,%eax
  8013b5:	f7 f1                	div    %ecx
  8013b7:	89 c6                	mov    %eax,%esi
  8013b9:	89 e8                	mov    %ebp,%eax
  8013bb:	89 f7                	mov    %esi,%edi
  8013bd:	f7 f1                	div    %ecx
  8013bf:	89 fa                	mov    %edi,%edx
  8013c1:	83 c4 1c             	add    $0x1c,%esp
  8013c4:	5b                   	pop    %ebx
  8013c5:	5e                   	pop    %esi
  8013c6:	5f                   	pop    %edi
  8013c7:	5d                   	pop    %ebp
  8013c8:	c3                   	ret
  8013c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8013d0:	89 f9                	mov    %edi,%ecx
  8013d2:	ba 20 00 00 00       	mov    $0x20,%edx
  8013d7:	29 fa                	sub    %edi,%edx
  8013d9:	d3 e0                	shl    %cl,%eax
  8013db:	89 44 24 08          	mov    %eax,0x8(%esp)
  8013df:	89 d1                	mov    %edx,%ecx
  8013e1:	89 d8                	mov    %ebx,%eax
  8013e3:	d3 e8                	shr    %cl,%eax
  8013e5:	89 c1                	mov    %eax,%ecx
  8013e7:	8b 44 24 08          	mov    0x8(%esp),%eax
  8013eb:	09 c1                	or     %eax,%ecx
  8013ed:	89 f0                	mov    %esi,%eax
  8013ef:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  8013f3:	89 f9                	mov    %edi,%ecx
  8013f5:	d3 e3                	shl    %cl,%ebx
  8013f7:	89 d1                	mov    %edx,%ecx
  8013f9:	d3 e8                	shr    %cl,%eax
  8013fb:	89 f9                	mov    %edi,%ecx
  8013fd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  801401:	89 eb                	mov    %ebp,%ebx
  801403:	d3 e6                	shl    %cl,%esi
  801405:	89 d1                	mov    %edx,%ecx
  801407:	d3 eb                	shr    %cl,%ebx
  801409:	09 f3                	or     %esi,%ebx
  80140b:	89 c6                	mov    %eax,%esi
  80140d:	89 f2                	mov    %esi,%edx
  80140f:	89 d8                	mov    %ebx,%eax
  801411:	f7 74 24 08          	divl   0x8(%esp)
  801415:	89 d6                	mov    %edx,%esi
  801417:	89 c3                	mov    %eax,%ebx
  801419:	f7 64 24 0c          	mull   0xc(%esp)
  80141d:	39 d6                	cmp    %edx,%esi
  80141f:	72 1f                	jb     801440 <__udivdi3+0x110>
  801421:	89 f9                	mov    %edi,%ecx
  801423:	d3 e5                	shl    %cl,%ebp
  801425:	39 c5                	cmp    %eax,%ebp
  801427:	73 04                	jae    80142d <__udivdi3+0xfd>
  801429:	39 d6                	cmp    %edx,%esi
  80142b:	74 13                	je     801440 <__udivdi3+0x110>
  80142d:	89 d8                	mov    %ebx,%eax
  80142f:	31 ff                	xor    %edi,%edi
  801431:	e9 3a ff ff ff       	jmp    801370 <__udivdi3+0x40>
  801436:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80143d:	00 
  80143e:	66 90                	xchg   %ax,%ax
  801440:	8d 43 ff             	lea    -0x1(%ebx),%eax
  801443:	31 ff                	xor    %edi,%edi
  801445:	e9 26 ff ff ff       	jmp    801370 <__udivdi3+0x40>
  80144a:	66 90                	xchg   %ax,%ax
  80144c:	66 90                	xchg   %ax,%ax
  80144e:	66 90                	xchg   %ax,%ax

00801450 <__umoddi3>:
  801450:	f3 0f 1e fb          	endbr32
  801454:	55                   	push   %ebp
  801455:	57                   	push   %edi
  801456:	56                   	push   %esi
  801457:	53                   	push   %ebx
  801458:	83 ec 1c             	sub    $0x1c,%esp
  80145b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  80145f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  801463:	8b 74 24 30          	mov    0x30(%esp),%esi
  801467:	8b 7c 24 38          	mov    0x38(%esp),%edi
  80146b:	89 da                	mov    %ebx,%edx
  80146d:	85 c0                	test   %eax,%eax
  80146f:	75 17                	jne    801488 <__umoddi3+0x38>
  801471:	39 fb                	cmp    %edi,%ebx
  801473:	73 53                	jae    8014c8 <__umoddi3+0x78>
  801475:	89 f0                	mov    %esi,%eax
  801477:	f7 f7                	div    %edi
  801479:	89 d0                	mov    %edx,%eax
  80147b:	31 d2                	xor    %edx,%edx
  80147d:	83 c4 1c             	add    $0x1c,%esp
  801480:	5b                   	pop    %ebx
  801481:	5e                   	pop    %esi
  801482:	5f                   	pop    %edi
  801483:	5d                   	pop    %ebp
  801484:	c3                   	ret
  801485:	8d 76 00             	lea    0x0(%esi),%esi
  801488:	89 f1                	mov    %esi,%ecx
  80148a:	39 c3                	cmp    %eax,%ebx
  80148c:	73 12                	jae    8014a0 <__umoddi3+0x50>
  80148e:	89 f0                	mov    %esi,%eax
  801490:	83 c4 1c             	add    $0x1c,%esp
  801493:	5b                   	pop    %ebx
  801494:	5e                   	pop    %esi
  801495:	5f                   	pop    %edi
  801496:	5d                   	pop    %ebp
  801497:	c3                   	ret
  801498:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80149f:	00 
  8014a0:	0f bd e8             	bsr    %eax,%ebp
  8014a3:	83 f5 1f             	xor    $0x1f,%ebp
  8014a6:	75 48                	jne    8014f0 <__umoddi3+0xa0>
  8014a8:	39 d8                	cmp    %ebx,%eax
  8014aa:	0f 82 d0 00 00 00    	jb     801580 <__umoddi3+0x130>
  8014b0:	39 fe                	cmp    %edi,%esi
  8014b2:	0f 83 c8 00 00 00    	jae    801580 <__umoddi3+0x130>
  8014b8:	89 c8                	mov    %ecx,%eax
  8014ba:	83 c4 1c             	add    $0x1c,%esp
  8014bd:	5b                   	pop    %ebx
  8014be:	5e                   	pop    %esi
  8014bf:	5f                   	pop    %edi
  8014c0:	5d                   	pop    %ebp
  8014c1:	c3                   	ret
  8014c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8014c8:	89 f9                	mov    %edi,%ecx
  8014ca:	85 ff                	test   %edi,%edi
  8014cc:	75 0b                	jne    8014d9 <__umoddi3+0x89>
  8014ce:	b8 01 00 00 00       	mov    $0x1,%eax
  8014d3:	31 d2                	xor    %edx,%edx
  8014d5:	f7 f7                	div    %edi
  8014d7:	89 c1                	mov    %eax,%ecx
  8014d9:	89 d8                	mov    %ebx,%eax
  8014db:	31 d2                	xor    %edx,%edx
  8014dd:	f7 f1                	div    %ecx
  8014df:	89 f0                	mov    %esi,%eax
  8014e1:	f7 f1                	div    %ecx
  8014e3:	89 d0                	mov    %edx,%eax
  8014e5:	31 d2                	xor    %edx,%edx
  8014e7:	eb 94                	jmp    80147d <__umoddi3+0x2d>
  8014e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8014f0:	89 e9                	mov    %ebp,%ecx
  8014f2:	ba 20 00 00 00       	mov    $0x20,%edx
  8014f7:	29 ea                	sub    %ebp,%edx
  8014f9:	d3 e0                	shl    %cl,%eax
  8014fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  8014ff:	89 d1                	mov    %edx,%ecx
  801501:	89 f8                	mov    %edi,%eax
  801503:	d3 e8                	shr    %cl,%eax
  801505:	89 54 24 04          	mov    %edx,0x4(%esp)
  801509:	8b 54 24 04          	mov    0x4(%esp),%edx
  80150d:	89 c1                	mov    %eax,%ecx
  80150f:	8b 44 24 08          	mov    0x8(%esp),%eax
  801513:	09 c1                	or     %eax,%ecx
  801515:	89 d8                	mov    %ebx,%eax
  801517:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  80151b:	89 e9                	mov    %ebp,%ecx
  80151d:	d3 e7                	shl    %cl,%edi
  80151f:	89 d1                	mov    %edx,%ecx
  801521:	d3 e8                	shr    %cl,%eax
  801523:	89 e9                	mov    %ebp,%ecx
  801525:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  801529:	d3 e3                	shl    %cl,%ebx
  80152b:	89 c7                	mov    %eax,%edi
  80152d:	89 d1                	mov    %edx,%ecx
  80152f:	89 f0                	mov    %esi,%eax
  801531:	d3 e8                	shr    %cl,%eax
  801533:	89 fa                	mov    %edi,%edx
  801535:	89 e9                	mov    %ebp,%ecx
  801537:	09 d8                	or     %ebx,%eax
  801539:	d3 e6                	shl    %cl,%esi
  80153b:	f7 74 24 08          	divl   0x8(%esp)
  80153f:	89 d3                	mov    %edx,%ebx
  801541:	f7 64 24 0c          	mull   0xc(%esp)
  801545:	89 c7                	mov    %eax,%edi
  801547:	89 d1                	mov    %edx,%ecx
  801549:	39 d3                	cmp    %edx,%ebx
  80154b:	72 06                	jb     801553 <__umoddi3+0x103>
  80154d:	75 10                	jne    80155f <__umoddi3+0x10f>
  80154f:	39 c6                	cmp    %eax,%esi
  801551:	73 0c                	jae    80155f <__umoddi3+0x10f>
  801553:	2b 44 24 0c          	sub    0xc(%esp),%eax
  801557:	1b 54 24 08          	sbb    0x8(%esp),%edx
  80155b:	89 d1                	mov    %edx,%ecx
  80155d:	89 c7                	mov    %eax,%edi
  80155f:	89 f2                	mov    %esi,%edx
  801561:	29 fa                	sub    %edi,%edx
  801563:	19 cb                	sbb    %ecx,%ebx
  801565:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  80156a:	89 d8                	mov    %ebx,%eax
  80156c:	d3 e0                	shl    %cl,%eax
  80156e:	89 e9                	mov    %ebp,%ecx
  801570:	d3 ea                	shr    %cl,%edx
  801572:	d3 eb                	shr    %cl,%ebx
  801574:	09 d0                	or     %edx,%eax
  801576:	89 da                	mov    %ebx,%edx
  801578:	83 c4 1c             	add    $0x1c,%esp
  80157b:	5b                   	pop    %ebx
  80157c:	5e                   	pop    %esi
  80157d:	5f                   	pop    %edi
  80157e:	5d                   	pop    %ebp
  80157f:	c3                   	ret
  801580:	89 da                	mov    %ebx,%edx
  801582:	89 f1                	mov    %esi,%ecx
  801584:	29 f9                	sub    %edi,%ecx
  801586:	19 c2                	sbb    %eax,%edx
  801588:	89 c8                	mov    %ecx,%eax
  80158a:	e9 2b ff ff ff       	jmp    8014ba <__umoddi3+0x6a>
