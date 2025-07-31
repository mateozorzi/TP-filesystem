
obj/user/primes:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 c3 00 00 00       	call   8000f4 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <primeproc>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	57                   	push   %edi
  800037:	56                   	push   %esi
  800038:	53                   	push   %ebx
  800039:	83 ec 1c             	sub    $0x1c,%esp
  80003c:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  80003f:	83 ec 04             	sub    $0x4,%esp
  800042:	6a 00                	push   $0x0
  800044:	6a 00                	push   $0x0
  800046:	56                   	push   %esi
  800047:	e8 b5 10 00 00       	call   801101 <ipc_recv>
  80004c:	89 c3                	mov    %eax,%ebx
  80004e:	a1 04 20 80 00       	mov    0x802004,%eax
  800053:	8b 40 5c             	mov    0x5c(%eax),%eax
  800056:	83 c4 0c             	add    $0xc,%esp
  800059:	53                   	push   %ebx
  80005a:	50                   	push   %eax
  80005b:	68 e0 14 80 00       	push   $0x8014e0
  800060:	e8 c9 01 00 00       	call   80022e <cprintf>
  800065:	e8 59 0f 00 00       	call   800fc3 <fork>
  80006a:	89 c7                	mov    %eax,%edi
  80006c:	83 c4 10             	add    $0x10,%esp
  80006f:	85 c0                	test   %eax,%eax
  800071:	78 2e                	js     8000a1 <primeproc+0x6e>
  800073:	74 ca                	je     80003f <primeproc+0xc>
  800075:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  800078:	83 ec 04             	sub    $0x4,%esp
  80007b:	6a 00                	push   $0x0
  80007d:	6a 00                	push   $0x0
  80007f:	56                   	push   %esi
  800080:	e8 7c 10 00 00       	call   801101 <ipc_recv>
  800085:	89 c1                	mov    %eax,%ecx
  800087:	99                   	cltd
  800088:	f7 fb                	idiv   %ebx
  80008a:	83 c4 10             	add    $0x10,%esp
  80008d:	85 d2                	test   %edx,%edx
  80008f:	74 e7                	je     800078 <primeproc+0x45>
  800091:	6a 00                	push   $0x0
  800093:	6a 00                	push   $0x0
  800095:	51                   	push   %ecx
  800096:	57                   	push   %edi
  800097:	e8 c5 10 00 00       	call   801161 <ipc_send>
  80009c:	83 c4 10             	add    $0x10,%esp
  80009f:	eb d7                	jmp    800078 <primeproc+0x45>
  8000a1:	50                   	push   %eax
  8000a2:	68 4c 16 80 00       	push   $0x80164c
  8000a7:	6a 1a                	push   $0x1a
  8000a9:	68 ec 14 80 00       	push   $0x8014ec
  8000ae:	e8 a0 00 00 00       	call   800153 <_panic>

008000b3 <umain>:
  8000b3:	55                   	push   %ebp
  8000b4:	89 e5                	mov    %esp,%ebp
  8000b6:	56                   	push   %esi
  8000b7:	53                   	push   %ebx
  8000b8:	e8 06 0f 00 00       	call   800fc3 <fork>
  8000bd:	89 c6                	mov    %eax,%esi
  8000bf:	85 c0                	test   %eax,%eax
  8000c1:	78 1a                	js     8000dd <umain+0x2a>
  8000c3:	bb 02 00 00 00       	mov    $0x2,%ebx
  8000c8:	74 25                	je     8000ef <umain+0x3c>
  8000ca:	6a 00                	push   $0x0
  8000cc:	6a 00                	push   $0x0
  8000ce:	53                   	push   %ebx
  8000cf:	56                   	push   %esi
  8000d0:	e8 8c 10 00 00       	call   801161 <ipc_send>
  8000d5:	83 c3 01             	add    $0x1,%ebx
  8000d8:	83 c4 10             	add    $0x10,%esp
  8000db:	eb ed                	jmp    8000ca <umain+0x17>
  8000dd:	50                   	push   %eax
  8000de:	68 4c 16 80 00       	push   $0x80164c
  8000e3:	6a 2d                	push   $0x2d
  8000e5:	68 ec 14 80 00       	push   $0x8014ec
  8000ea:	e8 64 00 00 00       	call   800153 <_panic>
  8000ef:	e8 3f ff ff ff       	call   800033 <primeproc>

008000f4 <libmain>:
  8000f4:	55                   	push   %ebp
  8000f5:	89 e5                	mov    %esp,%ebp
  8000f7:	56                   	push   %esi
  8000f8:	53                   	push   %ebx
  8000f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000ff:	e8 58 0a 00 00       	call   800b5c <sys_getenvid>
  800104:	85 c0                	test   %eax,%eax
  800106:	78 15                	js     80011d <libmain+0x29>
  800108:	25 ff 03 00 00       	and    $0x3ff,%eax
  80010d:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800113:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800118:	a3 04 20 80 00       	mov    %eax,0x802004
  80011d:	85 db                	test   %ebx,%ebx
  80011f:	7e 07                	jle    800128 <libmain+0x34>
  800121:	8b 06                	mov    (%esi),%eax
  800123:	a3 00 20 80 00       	mov    %eax,0x802000
  800128:	83 ec 08             	sub    $0x8,%esp
  80012b:	56                   	push   %esi
  80012c:	53                   	push   %ebx
  80012d:	e8 81 ff ff ff       	call   8000b3 <umain>
  800132:	e8 0a 00 00 00       	call   800141 <exit>
  800137:	83 c4 10             	add    $0x10,%esp
  80013a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80013d:	5b                   	pop    %ebx
  80013e:	5e                   	pop    %esi
  80013f:	5d                   	pop    %ebp
  800140:	c3                   	ret

00800141 <exit>:
  800141:	55                   	push   %ebp
  800142:	89 e5                	mov    %esp,%ebp
  800144:	83 ec 14             	sub    $0x14,%esp
  800147:	6a 00                	push   $0x0
  800149:	e8 ec 09 00 00       	call   800b3a <sys_env_destroy>
  80014e:	83 c4 10             	add    $0x10,%esp
  800151:	c9                   	leave
  800152:	c3                   	ret

00800153 <_panic>:
  800153:	55                   	push   %ebp
  800154:	89 e5                	mov    %esp,%ebp
  800156:	56                   	push   %esi
  800157:	53                   	push   %ebx
  800158:	8d 5d 14             	lea    0x14(%ebp),%ebx
  80015b:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800161:	e8 f6 09 00 00       	call   800b5c <sys_getenvid>
  800166:	83 ec 0c             	sub    $0xc,%esp
  800169:	ff 75 0c             	push   0xc(%ebp)
  80016c:	ff 75 08             	push   0x8(%ebp)
  80016f:	56                   	push   %esi
  800170:	50                   	push   %eax
  800171:	68 9c 16 80 00       	push   $0x80169c
  800176:	e8 b3 00 00 00       	call   80022e <cprintf>
  80017b:	83 c4 18             	add    $0x18,%esp
  80017e:	53                   	push   %ebx
  80017f:	ff 75 10             	push   0x10(%ebp)
  800182:	e8 56 00 00 00       	call   8001dd <vcprintf>
  800187:	c7 04 24 04 15 80 00 	movl   $0x801504,(%esp)
  80018e:	e8 9b 00 00 00       	call   80022e <cprintf>
  800193:	83 c4 10             	add    $0x10,%esp
  800196:	cc                   	int3
  800197:	eb fd                	jmp    800196 <_panic+0x43>

00800199 <putch>:
  800199:	55                   	push   %ebp
  80019a:	89 e5                	mov    %esp,%ebp
  80019c:	53                   	push   %ebx
  80019d:	83 ec 04             	sub    $0x4,%esp
  8001a0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8001a3:	8b 13                	mov    (%ebx),%edx
  8001a5:	8d 42 01             	lea    0x1(%edx),%eax
  8001a8:	89 03                	mov    %eax,(%ebx)
  8001aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001ad:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8001b1:	3d ff 00 00 00       	cmp    $0xff,%eax
  8001b6:	74 09                	je     8001c1 <putch+0x28>
  8001b8:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8001bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8001bf:	c9                   	leave
  8001c0:	c3                   	ret
  8001c1:	83 ec 08             	sub    $0x8,%esp
  8001c4:	68 ff 00 00 00       	push   $0xff
  8001c9:	8d 43 08             	lea    0x8(%ebx),%eax
  8001cc:	50                   	push   %eax
  8001cd:	e8 1e 09 00 00       	call   800af0 <sys_cputs>
  8001d2:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8001d8:	83 c4 10             	add    $0x10,%esp
  8001db:	eb db                	jmp    8001b8 <putch+0x1f>

008001dd <vcprintf>:
  8001dd:	55                   	push   %ebp
  8001de:	89 e5                	mov    %esp,%ebp
  8001e0:	81 ec 18 01 00 00    	sub    $0x118,%esp
  8001e6:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  8001ed:	00 00 00 
  8001f0:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  8001f7:	00 00 00 
  8001fa:	ff 75 0c             	push   0xc(%ebp)
  8001fd:	ff 75 08             	push   0x8(%ebp)
  800200:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800206:	50                   	push   %eax
  800207:	68 99 01 80 00       	push   $0x800199
  80020c:	e8 74 01 00 00       	call   800385 <vprintfmt>
  800211:	83 c4 08             	add    $0x8,%esp
  800214:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  80021a:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800220:	50                   	push   %eax
  800221:	e8 ca 08 00 00       	call   800af0 <sys_cputs>
  800226:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  80022c:	c9                   	leave
  80022d:	c3                   	ret

0080022e <cprintf>:
  80022e:	55                   	push   %ebp
  80022f:	89 e5                	mov    %esp,%ebp
  800231:	83 ec 10             	sub    $0x10,%esp
  800234:	8d 45 0c             	lea    0xc(%ebp),%eax
  800237:	50                   	push   %eax
  800238:	ff 75 08             	push   0x8(%ebp)
  80023b:	e8 9d ff ff ff       	call   8001dd <vcprintf>
  800240:	c9                   	leave
  800241:	c3                   	ret

00800242 <printnum>:
  800242:	55                   	push   %ebp
  800243:	89 e5                	mov    %esp,%ebp
  800245:	57                   	push   %edi
  800246:	56                   	push   %esi
  800247:	53                   	push   %ebx
  800248:	83 ec 1c             	sub    $0x1c,%esp
  80024b:	89 c7                	mov    %eax,%edi
  80024d:	89 d6                	mov    %edx,%esi
  80024f:	8b 45 08             	mov    0x8(%ebp),%eax
  800252:	8b 55 0c             	mov    0xc(%ebp),%edx
  800255:	89 d1                	mov    %edx,%ecx
  800257:	89 c2                	mov    %eax,%edx
  800259:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80025c:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  80025f:	8b 45 10             	mov    0x10(%ebp),%eax
  800262:	8b 5d 14             	mov    0x14(%ebp),%ebx
  800265:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800268:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  80026f:	39 c2                	cmp    %eax,%edx
  800271:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  800274:	72 3e                	jb     8002b4 <printnum+0x72>
  800276:	83 ec 0c             	sub    $0xc,%esp
  800279:	ff 75 18             	push   0x18(%ebp)
  80027c:	83 eb 01             	sub    $0x1,%ebx
  80027f:	53                   	push   %ebx
  800280:	50                   	push   %eax
  800281:	83 ec 08             	sub    $0x8,%esp
  800284:	ff 75 e4             	push   -0x1c(%ebp)
  800287:	ff 75 e0             	push   -0x20(%ebp)
  80028a:	ff 75 dc             	push   -0x24(%ebp)
  80028d:	ff 75 d8             	push   -0x28(%ebp)
  800290:	e8 db 0f 00 00       	call   801270 <__udivdi3>
  800295:	83 c4 18             	add    $0x18,%esp
  800298:	52                   	push   %edx
  800299:	50                   	push   %eax
  80029a:	89 f2                	mov    %esi,%edx
  80029c:	89 f8                	mov    %edi,%eax
  80029e:	e8 9f ff ff ff       	call   800242 <printnum>
  8002a3:	83 c4 20             	add    $0x20,%esp
  8002a6:	eb 13                	jmp    8002bb <printnum+0x79>
  8002a8:	83 ec 08             	sub    $0x8,%esp
  8002ab:	56                   	push   %esi
  8002ac:	ff 75 18             	push   0x18(%ebp)
  8002af:	ff d7                	call   *%edi
  8002b1:	83 c4 10             	add    $0x10,%esp
  8002b4:	83 eb 01             	sub    $0x1,%ebx
  8002b7:	85 db                	test   %ebx,%ebx
  8002b9:	7f ed                	jg     8002a8 <printnum+0x66>
  8002bb:	83 ec 08             	sub    $0x8,%esp
  8002be:	56                   	push   %esi
  8002bf:	83 ec 04             	sub    $0x4,%esp
  8002c2:	ff 75 e4             	push   -0x1c(%ebp)
  8002c5:	ff 75 e0             	push   -0x20(%ebp)
  8002c8:	ff 75 dc             	push   -0x24(%ebp)
  8002cb:	ff 75 d8             	push   -0x28(%ebp)
  8002ce:	e8 bd 10 00 00       	call   801390 <__umoddi3>
  8002d3:	83 c4 14             	add    $0x14,%esp
  8002d6:	0f be 80 06 15 80 00 	movsbl 0x801506(%eax),%eax
  8002dd:	50                   	push   %eax
  8002de:	ff d7                	call   *%edi
  8002e0:	83 c4 10             	add    $0x10,%esp
  8002e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002e6:	5b                   	pop    %ebx
  8002e7:	5e                   	pop    %esi
  8002e8:	5f                   	pop    %edi
  8002e9:	5d                   	pop    %ebp
  8002ea:	c3                   	ret

008002eb <getuint>:
  8002eb:	83 fa 01             	cmp    $0x1,%edx
  8002ee:	7f 13                	jg     800303 <getuint+0x18>
  8002f0:	85 d2                	test   %edx,%edx
  8002f2:	74 1c                	je     800310 <getuint+0x25>
  8002f4:	8b 10                	mov    (%eax),%edx
  8002f6:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002f9:	89 08                	mov    %ecx,(%eax)
  8002fb:	8b 02                	mov    (%edx),%eax
  8002fd:	ba 00 00 00 00       	mov    $0x0,%edx
  800302:	c3                   	ret
  800303:	8b 10                	mov    (%eax),%edx
  800305:	8d 4a 08             	lea    0x8(%edx),%ecx
  800308:	89 08                	mov    %ecx,(%eax)
  80030a:	8b 02                	mov    (%edx),%eax
  80030c:	8b 52 04             	mov    0x4(%edx),%edx
  80030f:	c3                   	ret
  800310:	8b 10                	mov    (%eax),%edx
  800312:	8d 4a 04             	lea    0x4(%edx),%ecx
  800315:	89 08                	mov    %ecx,(%eax)
  800317:	8b 02                	mov    (%edx),%eax
  800319:	ba 00 00 00 00       	mov    $0x0,%edx
  80031e:	c3                   	ret

0080031f <getint>:
  80031f:	83 fa 01             	cmp    $0x1,%edx
  800322:	7f 0f                	jg     800333 <getint+0x14>
  800324:	85 d2                	test   %edx,%edx
  800326:	74 18                	je     800340 <getint+0x21>
  800328:	8b 10                	mov    (%eax),%edx
  80032a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80032d:	89 08                	mov    %ecx,(%eax)
  80032f:	8b 02                	mov    (%edx),%eax
  800331:	99                   	cltd
  800332:	c3                   	ret
  800333:	8b 10                	mov    (%eax),%edx
  800335:	8d 4a 08             	lea    0x8(%edx),%ecx
  800338:	89 08                	mov    %ecx,(%eax)
  80033a:	8b 02                	mov    (%edx),%eax
  80033c:	8b 52 04             	mov    0x4(%edx),%edx
  80033f:	c3                   	ret
  800340:	8b 10                	mov    (%eax),%edx
  800342:	8d 4a 04             	lea    0x4(%edx),%ecx
  800345:	89 08                	mov    %ecx,(%eax)
  800347:	8b 02                	mov    (%edx),%eax
  800349:	99                   	cltd
  80034a:	c3                   	ret

0080034b <sprintputch>:
  80034b:	55                   	push   %ebp
  80034c:	89 e5                	mov    %esp,%ebp
  80034e:	8b 45 0c             	mov    0xc(%ebp),%eax
  800351:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800355:	8b 10                	mov    (%eax),%edx
  800357:	3b 50 04             	cmp    0x4(%eax),%edx
  80035a:	73 0a                	jae    800366 <sprintputch+0x1b>
  80035c:	8d 4a 01             	lea    0x1(%edx),%ecx
  80035f:	89 08                	mov    %ecx,(%eax)
  800361:	8b 45 08             	mov    0x8(%ebp),%eax
  800364:	88 02                	mov    %al,(%edx)
  800366:	5d                   	pop    %ebp
  800367:	c3                   	ret

00800368 <printfmt>:
  800368:	55                   	push   %ebp
  800369:	89 e5                	mov    %esp,%ebp
  80036b:	83 ec 08             	sub    $0x8,%esp
  80036e:	8d 45 14             	lea    0x14(%ebp),%eax
  800371:	50                   	push   %eax
  800372:	ff 75 10             	push   0x10(%ebp)
  800375:	ff 75 0c             	push   0xc(%ebp)
  800378:	ff 75 08             	push   0x8(%ebp)
  80037b:	e8 05 00 00 00       	call   800385 <vprintfmt>
  800380:	83 c4 10             	add    $0x10,%esp
  800383:	c9                   	leave
  800384:	c3                   	ret

00800385 <vprintfmt>:
  800385:	55                   	push   %ebp
  800386:	89 e5                	mov    %esp,%ebp
  800388:	57                   	push   %edi
  800389:	56                   	push   %esi
  80038a:	53                   	push   %ebx
  80038b:	83 ec 2c             	sub    $0x2c,%esp
  80038e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800391:	8b 75 0c             	mov    0xc(%ebp),%esi
  800394:	8b 7d 10             	mov    0x10(%ebp),%edi
  800397:	eb 0a                	jmp    8003a3 <vprintfmt+0x1e>
  800399:	83 ec 08             	sub    $0x8,%esp
  80039c:	56                   	push   %esi
  80039d:	50                   	push   %eax
  80039e:	ff d3                	call   *%ebx
  8003a0:	83 c4 10             	add    $0x10,%esp
  8003a3:	83 c7 01             	add    $0x1,%edi
  8003a6:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8003aa:	83 f8 25             	cmp    $0x25,%eax
  8003ad:	74 0c                	je     8003bb <vprintfmt+0x36>
  8003af:	85 c0                	test   %eax,%eax
  8003b1:	75 e6                	jne    800399 <vprintfmt+0x14>
  8003b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8003b6:	5b                   	pop    %ebx
  8003b7:	5e                   	pop    %esi
  8003b8:	5f                   	pop    %edi
  8003b9:	5d                   	pop    %ebp
  8003ba:	c3                   	ret
  8003bb:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8003bf:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  8003c6:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003cd:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  8003d4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8003d9:	8d 47 01             	lea    0x1(%edi),%eax
  8003dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8003df:	0f b6 17             	movzbl (%edi),%edx
  8003e2:	8d 42 dd             	lea    -0x23(%edx),%eax
  8003e5:	3c 55                	cmp    $0x55,%al
  8003e7:	0f 87 c3 02 00 00    	ja     8006b0 <vprintfmt+0x32b>
  8003ed:	0f b6 c0             	movzbl %al,%eax
  8003f0:	ff 24 85 20 18 80 00 	jmp    *0x801820(,%eax,4)
  8003f7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003fa:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  8003fe:	eb d9                	jmp    8003d9 <vprintfmt+0x54>
  800400:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800403:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800407:	eb d0                	jmp    8003d9 <vprintfmt+0x54>
  800409:	0f b6 d2             	movzbl %dl,%edx
  80040c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80040f:	b8 00 00 00 00       	mov    $0x0,%eax
  800414:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800417:	8d 04 80             	lea    (%eax,%eax,4),%eax
  80041a:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  80041e:	0f be 17             	movsbl (%edi),%edx
  800421:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800424:	83 f9 09             	cmp    $0x9,%ecx
  800427:	77 52                	ja     80047b <vprintfmt+0xf6>
  800429:	83 c7 01             	add    $0x1,%edi
  80042c:	eb e9                	jmp    800417 <vprintfmt+0x92>
  80042e:	8b 45 14             	mov    0x14(%ebp),%eax
  800431:	8d 50 04             	lea    0x4(%eax),%edx
  800434:	89 55 14             	mov    %edx,0x14(%ebp)
  800437:	8b 00                	mov    (%eax),%eax
  800439:	89 45 d0             	mov    %eax,-0x30(%ebp)
  80043c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80043f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800443:	79 94                	jns    8003d9 <vprintfmt+0x54>
  800445:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800448:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80044b:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800452:	eb 85                	jmp    8003d9 <vprintfmt+0x54>
  800454:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800457:	85 d2                	test   %edx,%edx
  800459:	b8 00 00 00 00       	mov    $0x0,%eax
  80045e:	0f 49 c2             	cmovns %edx,%eax
  800461:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800464:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800467:	e9 6d ff ff ff       	jmp    8003d9 <vprintfmt+0x54>
  80046c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80046f:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  800476:	e9 5e ff ff ff       	jmp    8003d9 <vprintfmt+0x54>
  80047b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  80047e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800481:	eb bc                	jmp    80043f <vprintfmt+0xba>
  800483:	83 c1 01             	add    $0x1,%ecx
  800486:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800489:	e9 4b ff ff ff       	jmp    8003d9 <vprintfmt+0x54>
  80048e:	8b 45 14             	mov    0x14(%ebp),%eax
  800491:	8d 50 04             	lea    0x4(%eax),%edx
  800494:	89 55 14             	mov    %edx,0x14(%ebp)
  800497:	83 ec 08             	sub    $0x8,%esp
  80049a:	56                   	push   %esi
  80049b:	ff 30                	push   (%eax)
  80049d:	ff d3                	call   *%ebx
  80049f:	83 c4 10             	add    $0x10,%esp
  8004a2:	e9 a0 01 00 00       	jmp    800647 <vprintfmt+0x2c2>
  8004a7:	8b 45 14             	mov    0x14(%ebp),%eax
  8004aa:	8d 50 04             	lea    0x4(%eax),%edx
  8004ad:	89 55 14             	mov    %edx,0x14(%ebp)
  8004b0:	8b 10                	mov    (%eax),%edx
  8004b2:	89 d0                	mov    %edx,%eax
  8004b4:	f7 d8                	neg    %eax
  8004b6:	0f 48 c2             	cmovs  %edx,%eax
  8004b9:	83 f8 08             	cmp    $0x8,%eax
  8004bc:	7f 20                	jg     8004de <vprintfmt+0x159>
  8004be:	8b 14 85 80 19 80 00 	mov    0x801980(,%eax,4),%edx
  8004c5:	85 d2                	test   %edx,%edx
  8004c7:	74 15                	je     8004de <vprintfmt+0x159>
  8004c9:	52                   	push   %edx
  8004ca:	68 27 15 80 00       	push   $0x801527
  8004cf:	56                   	push   %esi
  8004d0:	53                   	push   %ebx
  8004d1:	e8 92 fe ff ff       	call   800368 <printfmt>
  8004d6:	83 c4 10             	add    $0x10,%esp
  8004d9:	e9 69 01 00 00       	jmp    800647 <vprintfmt+0x2c2>
  8004de:	50                   	push   %eax
  8004df:	68 1e 15 80 00       	push   $0x80151e
  8004e4:	56                   	push   %esi
  8004e5:	53                   	push   %ebx
  8004e6:	e8 7d fe ff ff       	call   800368 <printfmt>
  8004eb:	83 c4 10             	add    $0x10,%esp
  8004ee:	e9 54 01 00 00       	jmp    800647 <vprintfmt+0x2c2>
  8004f3:	8b 45 14             	mov    0x14(%ebp),%eax
  8004f6:	8d 50 04             	lea    0x4(%eax),%edx
  8004f9:	89 55 14             	mov    %edx,0x14(%ebp)
  8004fc:	8b 08                	mov    (%eax),%ecx
  8004fe:	85 c9                	test   %ecx,%ecx
  800500:	b8 17 15 80 00       	mov    $0x801517,%eax
  800505:	0f 45 c1             	cmovne %ecx,%eax
  800508:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80050b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80050f:	7e 06                	jle    800517 <vprintfmt+0x192>
  800511:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800515:	75 0b                	jne    800522 <vprintfmt+0x19d>
  800517:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  80051a:	8b 7d d0             	mov    -0x30(%ebp),%edi
  80051d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800520:	eb 5c                	jmp    80057e <vprintfmt+0x1f9>
  800522:	83 ec 08             	sub    $0x8,%esp
  800525:	ff 75 d0             	push   -0x30(%ebp)
  800528:	ff 75 cc             	push   -0x34(%ebp)
  80052b:	e8 20 02 00 00       	call   800750 <strnlen>
  800530:	89 c2                	mov    %eax,%edx
  800532:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800535:	29 d0                	sub    %edx,%eax
  800537:	83 c4 10             	add    $0x10,%esp
  80053a:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  80053e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800541:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800544:	89 c3                	mov    %eax,%ebx
  800546:	eb 0e                	jmp    800556 <vprintfmt+0x1d1>
  800548:	83 ec 08             	sub    $0x8,%esp
  80054b:	56                   	push   %esi
  80054c:	57                   	push   %edi
  80054d:	ff 55 08             	call   *0x8(%ebp)
  800550:	83 eb 01             	sub    $0x1,%ebx
  800553:	83 c4 10             	add    $0x10,%esp
  800556:	85 db                	test   %ebx,%ebx
  800558:	7f ee                	jg     800548 <vprintfmt+0x1c3>
  80055a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80055d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800560:	85 c0                	test   %eax,%eax
  800562:	ba 00 00 00 00       	mov    $0x0,%edx
  800567:	0f 49 d0             	cmovns %eax,%edx
  80056a:	29 d0                	sub    %edx,%eax
  80056c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80056f:	eb a6                	jmp    800517 <vprintfmt+0x192>
  800571:	83 ec 08             	sub    $0x8,%esp
  800574:	56                   	push   %esi
  800575:	52                   	push   %edx
  800576:	ff 55 08             	call   *0x8(%ebp)
  800579:	83 c4 10             	add    $0x10,%esp
  80057c:	89 d9                	mov    %ebx,%ecx
  80057e:	8d 59 01             	lea    0x1(%ecx),%ebx
  800581:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  800585:	0f be d0             	movsbl %al,%edx
  800588:	85 d2                	test   %edx,%edx
  80058a:	74 28                	je     8005b4 <vprintfmt+0x22f>
  80058c:	85 ff                	test   %edi,%edi
  80058e:	78 05                	js     800595 <vprintfmt+0x210>
  800590:	83 ef 01             	sub    $0x1,%edi
  800593:	78 2e                	js     8005c3 <vprintfmt+0x23e>
  800595:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800599:	74 d6                	je     800571 <vprintfmt+0x1ec>
  80059b:	0f be c0             	movsbl %al,%eax
  80059e:	83 e8 20             	sub    $0x20,%eax
  8005a1:	83 f8 5e             	cmp    $0x5e,%eax
  8005a4:	76 cb                	jbe    800571 <vprintfmt+0x1ec>
  8005a6:	83 ec 08             	sub    $0x8,%esp
  8005a9:	56                   	push   %esi
  8005aa:	6a 3f                	push   $0x3f
  8005ac:	ff 55 08             	call   *0x8(%ebp)
  8005af:	83 c4 10             	add    $0x10,%esp
  8005b2:	eb c8                	jmp    80057c <vprintfmt+0x1f7>
  8005b4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8005b7:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8005ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8005bd:	01 c7                	add    %eax,%edi
  8005bf:	29 cf                	sub    %ecx,%edi
  8005c1:	eb 13                	jmp    8005d6 <vprintfmt+0x251>
  8005c3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8005c6:	eb ef                	jmp    8005b7 <vprintfmt+0x232>
  8005c8:	83 ec 08             	sub    $0x8,%esp
  8005cb:	56                   	push   %esi
  8005cc:	6a 20                	push   $0x20
  8005ce:	ff d3                	call   *%ebx
  8005d0:	83 ef 01             	sub    $0x1,%edi
  8005d3:	83 c4 10             	add    $0x10,%esp
  8005d6:	85 ff                	test   %edi,%edi
  8005d8:	7f ee                	jg     8005c8 <vprintfmt+0x243>
  8005da:	eb 6b                	jmp    800647 <vprintfmt+0x2c2>
  8005dc:	89 ca                	mov    %ecx,%edx
  8005de:	8d 45 14             	lea    0x14(%ebp),%eax
  8005e1:	e8 39 fd ff ff       	call   80031f <getint>
  8005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8005e9:	89 55 dc             	mov    %edx,-0x24(%ebp)
  8005ec:	85 d2                	test   %edx,%edx
  8005ee:	78 0b                	js     8005fb <vprintfmt+0x276>
  8005f0:	89 d1                	mov    %edx,%ecx
  8005f2:	89 c2                	mov    %eax,%edx
  8005f4:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005f9:	eb 32                	jmp    80062d <vprintfmt+0x2a8>
  8005fb:	83 ec 08             	sub    $0x8,%esp
  8005fe:	56                   	push   %esi
  8005ff:	6a 2d                	push   $0x2d
  800601:	ff d3                	call   *%ebx
  800603:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800606:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800609:	f7 da                	neg    %edx
  80060b:	83 d1 00             	adc    $0x0,%ecx
  80060e:	f7 d9                	neg    %ecx
  800610:	83 c4 10             	add    $0x10,%esp
  800613:	bf 0a 00 00 00       	mov    $0xa,%edi
  800618:	eb 13                	jmp    80062d <vprintfmt+0x2a8>
  80061a:	89 ca                	mov    %ecx,%edx
  80061c:	8d 45 14             	lea    0x14(%ebp),%eax
  80061f:	e8 c7 fc ff ff       	call   8002eb <getuint>
  800624:	89 d1                	mov    %edx,%ecx
  800626:	89 c2                	mov    %eax,%edx
  800628:	bf 0a 00 00 00       	mov    $0xa,%edi
  80062d:	83 ec 0c             	sub    $0xc,%esp
  800630:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800634:	50                   	push   %eax
  800635:	ff 75 e0             	push   -0x20(%ebp)
  800638:	57                   	push   %edi
  800639:	51                   	push   %ecx
  80063a:	52                   	push   %edx
  80063b:	89 f2                	mov    %esi,%edx
  80063d:	89 d8                	mov    %ebx,%eax
  80063f:	e8 fe fb ff ff       	call   800242 <printnum>
  800644:	83 c4 20             	add    $0x20,%esp
  800647:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80064a:	e9 54 fd ff ff       	jmp    8003a3 <vprintfmt+0x1e>
  80064f:	89 ca                	mov    %ecx,%edx
  800651:	8d 45 14             	lea    0x14(%ebp),%eax
  800654:	e8 92 fc ff ff       	call   8002eb <getuint>
  800659:	89 d1                	mov    %edx,%ecx
  80065b:	89 c2                	mov    %eax,%edx
  80065d:	bf 08 00 00 00       	mov    $0x8,%edi
  800662:	eb c9                	jmp    80062d <vprintfmt+0x2a8>
  800664:	83 ec 08             	sub    $0x8,%esp
  800667:	56                   	push   %esi
  800668:	6a 30                	push   $0x30
  80066a:	ff d3                	call   *%ebx
  80066c:	83 c4 08             	add    $0x8,%esp
  80066f:	56                   	push   %esi
  800670:	6a 78                	push   $0x78
  800672:	ff d3                	call   *%ebx
  800674:	8b 45 14             	mov    0x14(%ebp),%eax
  800677:	8d 50 04             	lea    0x4(%eax),%edx
  80067a:	89 55 14             	mov    %edx,0x14(%ebp)
  80067d:	8b 10                	mov    (%eax),%edx
  80067f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800684:	83 c4 10             	add    $0x10,%esp
  800687:	bf 10 00 00 00       	mov    $0x10,%edi
  80068c:	eb 9f                	jmp    80062d <vprintfmt+0x2a8>
  80068e:	89 ca                	mov    %ecx,%edx
  800690:	8d 45 14             	lea    0x14(%ebp),%eax
  800693:	e8 53 fc ff ff       	call   8002eb <getuint>
  800698:	89 d1                	mov    %edx,%ecx
  80069a:	89 c2                	mov    %eax,%edx
  80069c:	bf 10 00 00 00       	mov    $0x10,%edi
  8006a1:	eb 8a                	jmp    80062d <vprintfmt+0x2a8>
  8006a3:	83 ec 08             	sub    $0x8,%esp
  8006a6:	56                   	push   %esi
  8006a7:	6a 25                	push   $0x25
  8006a9:	ff d3                	call   *%ebx
  8006ab:	83 c4 10             	add    $0x10,%esp
  8006ae:	eb 97                	jmp    800647 <vprintfmt+0x2c2>
  8006b0:	83 ec 08             	sub    $0x8,%esp
  8006b3:	56                   	push   %esi
  8006b4:	6a 25                	push   $0x25
  8006b6:	ff d3                	call   *%ebx
  8006b8:	83 c4 10             	add    $0x10,%esp
  8006bb:	89 f8                	mov    %edi,%eax
  8006bd:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  8006c1:	74 05                	je     8006c8 <vprintfmt+0x343>
  8006c3:	83 e8 01             	sub    $0x1,%eax
  8006c6:	eb f5                	jmp    8006bd <vprintfmt+0x338>
  8006c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8006cb:	e9 77 ff ff ff       	jmp    800647 <vprintfmt+0x2c2>

008006d0 <vsnprintf>:
  8006d0:	55                   	push   %ebp
  8006d1:	89 e5                	mov    %esp,%ebp
  8006d3:	83 ec 18             	sub    $0x18,%esp
  8006d6:	8b 45 08             	mov    0x8(%ebp),%eax
  8006d9:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  8006df:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  8006e3:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  8006e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  8006ed:	85 c0                	test   %eax,%eax
  8006ef:	74 26                	je     800717 <vsnprintf+0x47>
  8006f1:	85 d2                	test   %edx,%edx
  8006f3:	7e 22                	jle    800717 <vsnprintf+0x47>
  8006f5:	ff 75 14             	push   0x14(%ebp)
  8006f8:	ff 75 10             	push   0x10(%ebp)
  8006fb:	8d 45 ec             	lea    -0x14(%ebp),%eax
  8006fe:	50                   	push   %eax
  8006ff:	68 4b 03 80 00       	push   $0x80034b
  800704:	e8 7c fc ff ff       	call   800385 <vprintfmt>
  800709:	8b 45 ec             	mov    -0x14(%ebp),%eax
  80070c:	c6 00 00             	movb   $0x0,(%eax)
  80070f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800712:	83 c4 10             	add    $0x10,%esp
  800715:	c9                   	leave
  800716:	c3                   	ret
  800717:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80071c:	eb f7                	jmp    800715 <vsnprintf+0x45>

0080071e <snprintf>:
  80071e:	55                   	push   %ebp
  80071f:	89 e5                	mov    %esp,%ebp
  800721:	83 ec 08             	sub    $0x8,%esp
  800724:	8d 45 14             	lea    0x14(%ebp),%eax
  800727:	50                   	push   %eax
  800728:	ff 75 10             	push   0x10(%ebp)
  80072b:	ff 75 0c             	push   0xc(%ebp)
  80072e:	ff 75 08             	push   0x8(%ebp)
  800731:	e8 9a ff ff ff       	call   8006d0 <vsnprintf>
  800736:	c9                   	leave
  800737:	c3                   	ret

00800738 <strlen>:
  800738:	55                   	push   %ebp
  800739:	89 e5                	mov    %esp,%ebp
  80073b:	8b 55 08             	mov    0x8(%ebp),%edx
  80073e:	b8 00 00 00 00       	mov    $0x0,%eax
  800743:	eb 03                	jmp    800748 <strlen+0x10>
  800745:	83 c0 01             	add    $0x1,%eax
  800748:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  80074c:	75 f7                	jne    800745 <strlen+0xd>
  80074e:	5d                   	pop    %ebp
  80074f:	c3                   	ret

00800750 <strnlen>:
  800750:	55                   	push   %ebp
  800751:	89 e5                	mov    %esp,%ebp
  800753:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800756:	8b 55 0c             	mov    0xc(%ebp),%edx
  800759:	b8 00 00 00 00       	mov    $0x0,%eax
  80075e:	eb 03                	jmp    800763 <strnlen+0x13>
  800760:	83 c0 01             	add    $0x1,%eax
  800763:	39 d0                	cmp    %edx,%eax
  800765:	74 08                	je     80076f <strnlen+0x1f>
  800767:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  80076b:	75 f3                	jne    800760 <strnlen+0x10>
  80076d:	89 c2                	mov    %eax,%edx
  80076f:	89 d0                	mov    %edx,%eax
  800771:	5d                   	pop    %ebp
  800772:	c3                   	ret

00800773 <strcpy>:
  800773:	55                   	push   %ebp
  800774:	89 e5                	mov    %esp,%ebp
  800776:	53                   	push   %ebx
  800777:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80077a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80077d:	b8 00 00 00 00       	mov    $0x0,%eax
  800782:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  800786:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  800789:	83 c0 01             	add    $0x1,%eax
  80078c:	84 d2                	test   %dl,%dl
  80078e:	75 f2                	jne    800782 <strcpy+0xf>
  800790:	89 c8                	mov    %ecx,%eax
  800792:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800795:	c9                   	leave
  800796:	c3                   	ret

00800797 <strcat>:
  800797:	55                   	push   %ebp
  800798:	89 e5                	mov    %esp,%ebp
  80079a:	53                   	push   %ebx
  80079b:	83 ec 10             	sub    $0x10,%esp
  80079e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8007a1:	53                   	push   %ebx
  8007a2:	e8 91 ff ff ff       	call   800738 <strlen>
  8007a7:	83 c4 08             	add    $0x8,%esp
  8007aa:	ff 75 0c             	push   0xc(%ebp)
  8007ad:	01 d8                	add    %ebx,%eax
  8007af:	50                   	push   %eax
  8007b0:	e8 be ff ff ff       	call   800773 <strcpy>
  8007b5:	89 d8                	mov    %ebx,%eax
  8007b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007ba:	c9                   	leave
  8007bb:	c3                   	ret

008007bc <strncpy>:
  8007bc:	55                   	push   %ebp
  8007bd:	89 e5                	mov    %esp,%ebp
  8007bf:	56                   	push   %esi
  8007c0:	53                   	push   %ebx
  8007c1:	8b 75 08             	mov    0x8(%ebp),%esi
  8007c4:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007c7:	89 f3                	mov    %esi,%ebx
  8007c9:	03 5d 10             	add    0x10(%ebp),%ebx
  8007cc:	89 f0                	mov    %esi,%eax
  8007ce:	eb 0f                	jmp    8007df <strncpy+0x23>
  8007d0:	83 c0 01             	add    $0x1,%eax
  8007d3:	0f b6 0a             	movzbl (%edx),%ecx
  8007d6:	88 48 ff             	mov    %cl,-0x1(%eax)
  8007d9:	80 f9 01             	cmp    $0x1,%cl
  8007dc:	83 da ff             	sbb    $0xffffffff,%edx
  8007df:	39 d8                	cmp    %ebx,%eax
  8007e1:	75 ed                	jne    8007d0 <strncpy+0x14>
  8007e3:	89 f0                	mov    %esi,%eax
  8007e5:	5b                   	pop    %ebx
  8007e6:	5e                   	pop    %esi
  8007e7:	5d                   	pop    %ebp
  8007e8:	c3                   	ret

008007e9 <strlcpy>:
  8007e9:	55                   	push   %ebp
  8007ea:	89 e5                	mov    %esp,%ebp
  8007ec:	56                   	push   %esi
  8007ed:	53                   	push   %ebx
  8007ee:	8b 75 08             	mov    0x8(%ebp),%esi
  8007f1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007f4:	8b 55 10             	mov    0x10(%ebp),%edx
  8007f7:	89 f0                	mov    %esi,%eax
  8007f9:	85 d2                	test   %edx,%edx
  8007fb:	74 21                	je     80081e <strlcpy+0x35>
  8007fd:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800801:	89 f2                	mov    %esi,%edx
  800803:	eb 09                	jmp    80080e <strlcpy+0x25>
  800805:	83 c1 01             	add    $0x1,%ecx
  800808:	83 c2 01             	add    $0x1,%edx
  80080b:	88 5a ff             	mov    %bl,-0x1(%edx)
  80080e:	39 c2                	cmp    %eax,%edx
  800810:	74 09                	je     80081b <strlcpy+0x32>
  800812:	0f b6 19             	movzbl (%ecx),%ebx
  800815:	84 db                	test   %bl,%bl
  800817:	75 ec                	jne    800805 <strlcpy+0x1c>
  800819:	89 d0                	mov    %edx,%eax
  80081b:	c6 00 00             	movb   $0x0,(%eax)
  80081e:	29 f0                	sub    %esi,%eax
  800820:	5b                   	pop    %ebx
  800821:	5e                   	pop    %esi
  800822:	5d                   	pop    %ebp
  800823:	c3                   	ret

00800824 <strcmp>:
  800824:	55                   	push   %ebp
  800825:	89 e5                	mov    %esp,%ebp
  800827:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80082a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80082d:	eb 06                	jmp    800835 <strcmp+0x11>
  80082f:	83 c1 01             	add    $0x1,%ecx
  800832:	83 c2 01             	add    $0x1,%edx
  800835:	0f b6 01             	movzbl (%ecx),%eax
  800838:	84 c0                	test   %al,%al
  80083a:	74 04                	je     800840 <strcmp+0x1c>
  80083c:	3a 02                	cmp    (%edx),%al
  80083e:	74 ef                	je     80082f <strcmp+0xb>
  800840:	0f b6 c0             	movzbl %al,%eax
  800843:	0f b6 12             	movzbl (%edx),%edx
  800846:	29 d0                	sub    %edx,%eax
  800848:	5d                   	pop    %ebp
  800849:	c3                   	ret

0080084a <strncmp>:
  80084a:	55                   	push   %ebp
  80084b:	89 e5                	mov    %esp,%ebp
  80084d:	53                   	push   %ebx
  80084e:	8b 45 08             	mov    0x8(%ebp),%eax
  800851:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800854:	8b 55 10             	mov    0x10(%ebp),%edx
  800857:	eb 09                	jmp    800862 <strncmp+0x18>
  800859:	83 ea 01             	sub    $0x1,%edx
  80085c:	83 c0 01             	add    $0x1,%eax
  80085f:	83 c1 01             	add    $0x1,%ecx
  800862:	85 d2                	test   %edx,%edx
  800864:	74 18                	je     80087e <strncmp+0x34>
  800866:	0f b6 18             	movzbl (%eax),%ebx
  800869:	84 db                	test   %bl,%bl
  80086b:	74 04                	je     800871 <strncmp+0x27>
  80086d:	3a 19                	cmp    (%ecx),%bl
  80086f:	74 e8                	je     800859 <strncmp+0xf>
  800871:	0f b6 00             	movzbl (%eax),%eax
  800874:	0f b6 11             	movzbl (%ecx),%edx
  800877:	29 d0                	sub    %edx,%eax
  800879:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80087c:	c9                   	leave
  80087d:	c3                   	ret
  80087e:	b8 00 00 00 00       	mov    $0x0,%eax
  800883:	eb f4                	jmp    800879 <strncmp+0x2f>

00800885 <strchr>:
  800885:	55                   	push   %ebp
  800886:	89 e5                	mov    %esp,%ebp
  800888:	8b 45 08             	mov    0x8(%ebp),%eax
  80088b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  80088f:	eb 03                	jmp    800894 <strchr+0xf>
  800891:	83 c0 01             	add    $0x1,%eax
  800894:	0f b6 10             	movzbl (%eax),%edx
  800897:	84 d2                	test   %dl,%dl
  800899:	74 06                	je     8008a1 <strchr+0x1c>
  80089b:	38 ca                	cmp    %cl,%dl
  80089d:	75 f2                	jne    800891 <strchr+0xc>
  80089f:	eb 05                	jmp    8008a6 <strchr+0x21>
  8008a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8008a6:	5d                   	pop    %ebp
  8008a7:	c3                   	ret

008008a8 <strfind>:
  8008a8:	55                   	push   %ebp
  8008a9:	89 e5                	mov    %esp,%ebp
  8008ab:	8b 45 08             	mov    0x8(%ebp),%eax
  8008ae:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8008b2:	0f b6 10             	movzbl (%eax),%edx
  8008b5:	38 ca                	cmp    %cl,%dl
  8008b7:	74 09                	je     8008c2 <strfind+0x1a>
  8008b9:	84 d2                	test   %dl,%dl
  8008bb:	74 05                	je     8008c2 <strfind+0x1a>
  8008bd:	83 c0 01             	add    $0x1,%eax
  8008c0:	eb f0                	jmp    8008b2 <strfind+0xa>
  8008c2:	5d                   	pop    %ebp
  8008c3:	c3                   	ret

008008c4 <memset>:
  8008c4:	55                   	push   %ebp
  8008c5:	89 e5                	mov    %esp,%ebp
  8008c7:	57                   	push   %edi
  8008c8:	8b 55 08             	mov    0x8(%ebp),%edx
  8008cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8008ce:	85 c9                	test   %ecx,%ecx
  8008d0:	74 24                	je     8008f6 <memset+0x32>
  8008d2:	89 d0                	mov    %edx,%eax
  8008d4:	09 c8                	or     %ecx,%eax
  8008d6:	a8 03                	test   $0x3,%al
  8008d8:	75 14                	jne    8008ee <memset+0x2a>
  8008da:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  8008de:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  8008e4:	c1 e9 02             	shr    $0x2,%ecx
  8008e7:	89 d7                	mov    %edx,%edi
  8008e9:	fc                   	cld
  8008ea:	f3 ab                	rep stos %eax,%es:(%edi)
  8008ec:	eb 08                	jmp    8008f6 <memset+0x32>
  8008ee:	89 d7                	mov    %edx,%edi
  8008f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  8008f3:	fc                   	cld
  8008f4:	f3 aa                	rep stos %al,%es:(%edi)
  8008f6:	89 d0                	mov    %edx,%eax
  8008f8:	8b 7d fc             	mov    -0x4(%ebp),%edi
  8008fb:	c9                   	leave
  8008fc:	c3                   	ret

008008fd <memmove>:
  8008fd:	55                   	push   %ebp
  8008fe:	89 e5                	mov    %esp,%ebp
  800900:	57                   	push   %edi
  800901:	56                   	push   %esi
  800902:	8b 45 08             	mov    0x8(%ebp),%eax
  800905:	8b 75 0c             	mov    0xc(%ebp),%esi
  800908:	8b 4d 10             	mov    0x10(%ebp),%ecx
  80090b:	39 c6                	cmp    %eax,%esi
  80090d:	73 32                	jae    800941 <memmove+0x44>
  80090f:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800912:	39 d0                	cmp    %edx,%eax
  800914:	73 2b                	jae    800941 <memmove+0x44>
  800916:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800919:	89 fe                	mov    %edi,%esi
  80091b:	09 ce                	or     %ecx,%esi
  80091d:	09 d6                	or     %edx,%esi
  80091f:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800925:	75 0e                	jne    800935 <memmove+0x38>
  800927:	83 ef 04             	sub    $0x4,%edi
  80092a:	8d 72 fc             	lea    -0x4(%edx),%esi
  80092d:	c1 e9 02             	shr    $0x2,%ecx
  800930:	fd                   	std
  800931:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800933:	eb 09                	jmp    80093e <memmove+0x41>
  800935:	83 ef 01             	sub    $0x1,%edi
  800938:	8d 72 ff             	lea    -0x1(%edx),%esi
  80093b:	fd                   	std
  80093c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  80093e:	fc                   	cld
  80093f:	eb 1a                	jmp    80095b <memmove+0x5e>
  800941:	89 c2                	mov    %eax,%edx
  800943:	09 ca                	or     %ecx,%edx
  800945:	09 f2                	or     %esi,%edx
  800947:	f6 c2 03             	test   $0x3,%dl
  80094a:	75 0a                	jne    800956 <memmove+0x59>
  80094c:	c1 e9 02             	shr    $0x2,%ecx
  80094f:	89 c7                	mov    %eax,%edi
  800951:	fc                   	cld
  800952:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800954:	eb 05                	jmp    80095b <memmove+0x5e>
  800956:	89 c7                	mov    %eax,%edi
  800958:	fc                   	cld
  800959:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  80095b:	5e                   	pop    %esi
  80095c:	5f                   	pop    %edi
  80095d:	5d                   	pop    %ebp
  80095e:	c3                   	ret

0080095f <memcpy>:
  80095f:	55                   	push   %ebp
  800960:	89 e5                	mov    %esp,%ebp
  800962:	83 ec 0c             	sub    $0xc,%esp
  800965:	ff 75 10             	push   0x10(%ebp)
  800968:	ff 75 0c             	push   0xc(%ebp)
  80096b:	ff 75 08             	push   0x8(%ebp)
  80096e:	e8 8a ff ff ff       	call   8008fd <memmove>
  800973:	c9                   	leave
  800974:	c3                   	ret

00800975 <memcmp>:
  800975:	55                   	push   %ebp
  800976:	89 e5                	mov    %esp,%ebp
  800978:	56                   	push   %esi
  800979:	53                   	push   %ebx
  80097a:	8b 45 08             	mov    0x8(%ebp),%eax
  80097d:	8b 55 0c             	mov    0xc(%ebp),%edx
  800980:	89 c6                	mov    %eax,%esi
  800982:	03 75 10             	add    0x10(%ebp),%esi
  800985:	eb 06                	jmp    80098d <memcmp+0x18>
  800987:	83 c0 01             	add    $0x1,%eax
  80098a:	83 c2 01             	add    $0x1,%edx
  80098d:	39 f0                	cmp    %esi,%eax
  80098f:	74 14                	je     8009a5 <memcmp+0x30>
  800991:	0f b6 08             	movzbl (%eax),%ecx
  800994:	0f b6 1a             	movzbl (%edx),%ebx
  800997:	38 d9                	cmp    %bl,%cl
  800999:	74 ec                	je     800987 <memcmp+0x12>
  80099b:	0f b6 c1             	movzbl %cl,%eax
  80099e:	0f b6 db             	movzbl %bl,%ebx
  8009a1:	29 d8                	sub    %ebx,%eax
  8009a3:	eb 05                	jmp    8009aa <memcmp+0x35>
  8009a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8009aa:	5b                   	pop    %ebx
  8009ab:	5e                   	pop    %esi
  8009ac:	5d                   	pop    %ebp
  8009ad:	c3                   	ret

008009ae <memfind>:
  8009ae:	55                   	push   %ebp
  8009af:	89 e5                	mov    %esp,%ebp
  8009b1:	8b 45 08             	mov    0x8(%ebp),%eax
  8009b4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8009b7:	89 c2                	mov    %eax,%edx
  8009b9:	03 55 10             	add    0x10(%ebp),%edx
  8009bc:	eb 03                	jmp    8009c1 <memfind+0x13>
  8009be:	83 c0 01             	add    $0x1,%eax
  8009c1:	39 d0                	cmp    %edx,%eax
  8009c3:	73 04                	jae    8009c9 <memfind+0x1b>
  8009c5:	38 08                	cmp    %cl,(%eax)
  8009c7:	75 f5                	jne    8009be <memfind+0x10>
  8009c9:	5d                   	pop    %ebp
  8009ca:	c3                   	ret

008009cb <strtol>:
  8009cb:	55                   	push   %ebp
  8009cc:	89 e5                	mov    %esp,%ebp
  8009ce:	57                   	push   %edi
  8009cf:	56                   	push   %esi
  8009d0:	53                   	push   %ebx
  8009d1:	8b 55 08             	mov    0x8(%ebp),%edx
  8009d4:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8009d7:	eb 03                	jmp    8009dc <strtol+0x11>
  8009d9:	83 c2 01             	add    $0x1,%edx
  8009dc:	0f b6 02             	movzbl (%edx),%eax
  8009df:	3c 20                	cmp    $0x20,%al
  8009e1:	74 f6                	je     8009d9 <strtol+0xe>
  8009e3:	3c 09                	cmp    $0x9,%al
  8009e5:	74 f2                	je     8009d9 <strtol+0xe>
  8009e7:	3c 2b                	cmp    $0x2b,%al
  8009e9:	74 2a                	je     800a15 <strtol+0x4a>
  8009eb:	bf 00 00 00 00       	mov    $0x0,%edi
  8009f0:	3c 2d                	cmp    $0x2d,%al
  8009f2:	74 2b                	je     800a1f <strtol+0x54>
  8009f4:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  8009fa:	75 0f                	jne    800a0b <strtol+0x40>
  8009fc:	80 3a 30             	cmpb   $0x30,(%edx)
  8009ff:	74 28                	je     800a29 <strtol+0x5e>
  800a01:	85 db                	test   %ebx,%ebx
  800a03:	b8 0a 00 00 00       	mov    $0xa,%eax
  800a08:	0f 44 d8             	cmove  %eax,%ebx
  800a0b:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a10:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800a13:	eb 46                	jmp    800a5b <strtol+0x90>
  800a15:	83 c2 01             	add    $0x1,%edx
  800a18:	bf 00 00 00 00       	mov    $0x0,%edi
  800a1d:	eb d5                	jmp    8009f4 <strtol+0x29>
  800a1f:	83 c2 01             	add    $0x1,%edx
  800a22:	bf 01 00 00 00       	mov    $0x1,%edi
  800a27:	eb cb                	jmp    8009f4 <strtol+0x29>
  800a29:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800a2d:	74 0e                	je     800a3d <strtol+0x72>
  800a2f:	85 db                	test   %ebx,%ebx
  800a31:	75 d8                	jne    800a0b <strtol+0x40>
  800a33:	83 c2 01             	add    $0x1,%edx
  800a36:	bb 08 00 00 00       	mov    $0x8,%ebx
  800a3b:	eb ce                	jmp    800a0b <strtol+0x40>
  800a3d:	83 c2 02             	add    $0x2,%edx
  800a40:	bb 10 00 00 00       	mov    $0x10,%ebx
  800a45:	eb c4                	jmp    800a0b <strtol+0x40>
  800a47:	0f be c0             	movsbl %al,%eax
  800a4a:	83 e8 30             	sub    $0x30,%eax
  800a4d:	3b 45 10             	cmp    0x10(%ebp),%eax
  800a50:	7d 3a                	jge    800a8c <strtol+0xc1>
  800a52:	83 c2 01             	add    $0x1,%edx
  800a55:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800a59:	01 c1                	add    %eax,%ecx
  800a5b:	0f b6 02             	movzbl (%edx),%eax
  800a5e:	8d 70 d0             	lea    -0x30(%eax),%esi
  800a61:	89 f3                	mov    %esi,%ebx
  800a63:	80 fb 09             	cmp    $0x9,%bl
  800a66:	76 df                	jbe    800a47 <strtol+0x7c>
  800a68:	8d 70 9f             	lea    -0x61(%eax),%esi
  800a6b:	89 f3                	mov    %esi,%ebx
  800a6d:	80 fb 19             	cmp    $0x19,%bl
  800a70:	77 08                	ja     800a7a <strtol+0xaf>
  800a72:	0f be c0             	movsbl %al,%eax
  800a75:	83 e8 57             	sub    $0x57,%eax
  800a78:	eb d3                	jmp    800a4d <strtol+0x82>
  800a7a:	8d 70 bf             	lea    -0x41(%eax),%esi
  800a7d:	89 f3                	mov    %esi,%ebx
  800a7f:	80 fb 19             	cmp    $0x19,%bl
  800a82:	77 08                	ja     800a8c <strtol+0xc1>
  800a84:	0f be c0             	movsbl %al,%eax
  800a87:	83 e8 37             	sub    $0x37,%eax
  800a8a:	eb c1                	jmp    800a4d <strtol+0x82>
  800a8c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800a90:	74 05                	je     800a97 <strtol+0xcc>
  800a92:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a95:	89 10                	mov    %edx,(%eax)
  800a97:	89 c8                	mov    %ecx,%eax
  800a99:	f7 d8                	neg    %eax
  800a9b:	85 ff                	test   %edi,%edi
  800a9d:	0f 45 c8             	cmovne %eax,%ecx
  800aa0:	89 c8                	mov    %ecx,%eax
  800aa2:	5b                   	pop    %ebx
  800aa3:	5e                   	pop    %esi
  800aa4:	5f                   	pop    %edi
  800aa5:	5d                   	pop    %ebp
  800aa6:	c3                   	ret

00800aa7 <syscall>:
  800aa7:	55                   	push   %ebp
  800aa8:	89 e5                	mov    %esp,%ebp
  800aaa:	57                   	push   %edi
  800aab:	56                   	push   %esi
  800aac:	53                   	push   %ebx
  800aad:	83 ec 1c             	sub    $0x1c,%esp
  800ab0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800ab3:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800ab6:	89 ca                	mov    %ecx,%edx
  800ab8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800abb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800abe:	8b 7d 10             	mov    0x10(%ebp),%edi
  800ac1:	8b 75 14             	mov    0x14(%ebp),%esi
  800ac4:	cd 30                	int    $0x30
  800ac6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800aca:	74 04                	je     800ad0 <syscall+0x29>
  800acc:	85 c0                	test   %eax,%eax
  800ace:	7f 08                	jg     800ad8 <syscall+0x31>
  800ad0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800ad3:	5b                   	pop    %ebx
  800ad4:	5e                   	pop    %esi
  800ad5:	5f                   	pop    %edi
  800ad6:	5d                   	pop    %ebp
  800ad7:	c3                   	ret
  800ad8:	83 ec 0c             	sub    $0xc,%esp
  800adb:	50                   	push   %eax
  800adc:	ff 75 e0             	push   -0x20(%ebp)
  800adf:	68 bd 15 80 00       	push   $0x8015bd
  800ae4:	6a 1e                	push   $0x1e
  800ae6:	68 da 15 80 00       	push   $0x8015da
  800aeb:	e8 63 f6 ff ff       	call   800153 <_panic>

00800af0 <sys_cputs>:
  800af0:	55                   	push   %ebp
  800af1:	89 e5                	mov    %esp,%ebp
  800af3:	83 ec 08             	sub    $0x8,%esp
  800af6:	6a 00                	push   $0x0
  800af8:	6a 00                	push   $0x0
  800afa:	6a 00                	push   $0x0
  800afc:	ff 75 0c             	push   0xc(%ebp)
  800aff:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b02:	ba 00 00 00 00       	mov    $0x0,%edx
  800b07:	b8 00 00 00 00       	mov    $0x0,%eax
  800b0c:	e8 96 ff ff ff       	call   800aa7 <syscall>
  800b11:	83 c4 10             	add    $0x10,%esp
  800b14:	c9                   	leave
  800b15:	c3                   	ret

00800b16 <sys_cgetc>:
  800b16:	55                   	push   %ebp
  800b17:	89 e5                	mov    %esp,%ebp
  800b19:	83 ec 08             	sub    $0x8,%esp
  800b1c:	6a 00                	push   $0x0
  800b1e:	6a 00                	push   $0x0
  800b20:	6a 00                	push   $0x0
  800b22:	6a 00                	push   $0x0
  800b24:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b29:	ba 00 00 00 00       	mov    $0x0,%edx
  800b2e:	b8 01 00 00 00       	mov    $0x1,%eax
  800b33:	e8 6f ff ff ff       	call   800aa7 <syscall>
  800b38:	c9                   	leave
  800b39:	c3                   	ret

00800b3a <sys_env_destroy>:
  800b3a:	55                   	push   %ebp
  800b3b:	89 e5                	mov    %esp,%ebp
  800b3d:	83 ec 08             	sub    $0x8,%esp
  800b40:	6a 00                	push   $0x0
  800b42:	6a 00                	push   $0x0
  800b44:	6a 00                	push   $0x0
  800b46:	6a 00                	push   $0x0
  800b48:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b4b:	ba 01 00 00 00       	mov    $0x1,%edx
  800b50:	b8 03 00 00 00       	mov    $0x3,%eax
  800b55:	e8 4d ff ff ff       	call   800aa7 <syscall>
  800b5a:	c9                   	leave
  800b5b:	c3                   	ret

00800b5c <sys_getenvid>:
  800b5c:	55                   	push   %ebp
  800b5d:	89 e5                	mov    %esp,%ebp
  800b5f:	83 ec 08             	sub    $0x8,%esp
  800b62:	6a 00                	push   $0x0
  800b64:	6a 00                	push   $0x0
  800b66:	6a 00                	push   $0x0
  800b68:	6a 00                	push   $0x0
  800b6a:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b6f:	ba 00 00 00 00       	mov    $0x0,%edx
  800b74:	b8 02 00 00 00       	mov    $0x2,%eax
  800b79:	e8 29 ff ff ff       	call   800aa7 <syscall>
  800b7e:	c9                   	leave
  800b7f:	c3                   	ret

00800b80 <sys_yield>:
  800b80:	55                   	push   %ebp
  800b81:	89 e5                	mov    %esp,%ebp
  800b83:	83 ec 08             	sub    $0x8,%esp
  800b86:	6a 00                	push   $0x0
  800b88:	6a 00                	push   $0x0
  800b8a:	6a 00                	push   $0x0
  800b8c:	6a 00                	push   $0x0
  800b8e:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b93:	ba 00 00 00 00       	mov    $0x0,%edx
  800b98:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b9d:	e8 05 ff ff ff       	call   800aa7 <syscall>
  800ba2:	83 c4 10             	add    $0x10,%esp
  800ba5:	c9                   	leave
  800ba6:	c3                   	ret

00800ba7 <sys_page_alloc>:
  800ba7:	55                   	push   %ebp
  800ba8:	89 e5                	mov    %esp,%ebp
  800baa:	83 ec 08             	sub    $0x8,%esp
  800bad:	6a 00                	push   $0x0
  800baf:	6a 00                	push   $0x0
  800bb1:	ff 75 10             	push   0x10(%ebp)
  800bb4:	ff 75 0c             	push   0xc(%ebp)
  800bb7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bba:	ba 01 00 00 00       	mov    $0x1,%edx
  800bbf:	b8 04 00 00 00       	mov    $0x4,%eax
  800bc4:	e8 de fe ff ff       	call   800aa7 <syscall>
  800bc9:	c9                   	leave
  800bca:	c3                   	ret

00800bcb <sys_page_map>:
  800bcb:	55                   	push   %ebp
  800bcc:	89 e5                	mov    %esp,%ebp
  800bce:	83 ec 08             	sub    $0x8,%esp
  800bd1:	ff 75 18             	push   0x18(%ebp)
  800bd4:	ff 75 14             	push   0x14(%ebp)
  800bd7:	ff 75 10             	push   0x10(%ebp)
  800bda:	ff 75 0c             	push   0xc(%ebp)
  800bdd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800be0:	ba 01 00 00 00       	mov    $0x1,%edx
  800be5:	b8 05 00 00 00       	mov    $0x5,%eax
  800bea:	e8 b8 fe ff ff       	call   800aa7 <syscall>
  800bef:	c9                   	leave
  800bf0:	c3                   	ret

00800bf1 <sys_page_unmap>:
  800bf1:	55                   	push   %ebp
  800bf2:	89 e5                	mov    %esp,%ebp
  800bf4:	83 ec 08             	sub    $0x8,%esp
  800bf7:	6a 00                	push   $0x0
  800bf9:	6a 00                	push   $0x0
  800bfb:	6a 00                	push   $0x0
  800bfd:	ff 75 0c             	push   0xc(%ebp)
  800c00:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c03:	ba 01 00 00 00       	mov    $0x1,%edx
  800c08:	b8 06 00 00 00       	mov    $0x6,%eax
  800c0d:	e8 95 fe ff ff       	call   800aa7 <syscall>
  800c12:	c9                   	leave
  800c13:	c3                   	ret

00800c14 <sys_env_set_status>:
  800c14:	55                   	push   %ebp
  800c15:	89 e5                	mov    %esp,%ebp
  800c17:	83 ec 08             	sub    $0x8,%esp
  800c1a:	6a 00                	push   $0x0
  800c1c:	6a 00                	push   $0x0
  800c1e:	6a 00                	push   $0x0
  800c20:	ff 75 0c             	push   0xc(%ebp)
  800c23:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c26:	ba 01 00 00 00       	mov    $0x1,%edx
  800c2b:	b8 08 00 00 00       	mov    $0x8,%eax
  800c30:	e8 72 fe ff ff       	call   800aa7 <syscall>
  800c35:	c9                   	leave
  800c36:	c3                   	ret

00800c37 <sys_env_set_pgfault_upcall>:
  800c37:	55                   	push   %ebp
  800c38:	89 e5                	mov    %esp,%ebp
  800c3a:	83 ec 08             	sub    $0x8,%esp
  800c3d:	6a 00                	push   $0x0
  800c3f:	6a 00                	push   $0x0
  800c41:	6a 00                	push   $0x0
  800c43:	ff 75 0c             	push   0xc(%ebp)
  800c46:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c49:	ba 01 00 00 00       	mov    $0x1,%edx
  800c4e:	b8 09 00 00 00       	mov    $0x9,%eax
  800c53:	e8 4f fe ff ff       	call   800aa7 <syscall>
  800c58:	c9                   	leave
  800c59:	c3                   	ret

00800c5a <sys_ipc_try_send>:
  800c5a:	55                   	push   %ebp
  800c5b:	89 e5                	mov    %esp,%ebp
  800c5d:	83 ec 08             	sub    $0x8,%esp
  800c60:	6a 00                	push   $0x0
  800c62:	ff 75 14             	push   0x14(%ebp)
  800c65:	ff 75 10             	push   0x10(%ebp)
  800c68:	ff 75 0c             	push   0xc(%ebp)
  800c6b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c6e:	ba 00 00 00 00       	mov    $0x0,%edx
  800c73:	b8 0c 00 00 00       	mov    $0xc,%eax
  800c78:	e8 2a fe ff ff       	call   800aa7 <syscall>
  800c7d:	c9                   	leave
  800c7e:	c3                   	ret

00800c7f <sys_ipc_recv>:
  800c7f:	55                   	push   %ebp
  800c80:	89 e5                	mov    %esp,%ebp
  800c82:	83 ec 08             	sub    $0x8,%esp
  800c85:	6a 00                	push   $0x0
  800c87:	6a 00                	push   $0x0
  800c89:	6a 00                	push   $0x0
  800c8b:	6a 00                	push   $0x0
  800c8d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c90:	ba 01 00 00 00       	mov    $0x1,%edx
  800c95:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c9a:	e8 08 fe ff ff       	call   800aa7 <syscall>
  800c9f:	c9                   	leave
  800ca0:	c3                   	ret

00800ca1 <duppage>:
  800ca1:	55                   	push   %ebp
  800ca2:	89 e5                	mov    %esp,%ebp
  800ca4:	56                   	push   %esi
  800ca5:	53                   	push   %ebx
  800ca6:	89 c1                	mov    %eax,%ecx
  800ca8:	89 d6                	mov    %edx,%esi
  800caa:	c1 e6 0c             	shl    $0xc,%esi
  800cad:	8b 14 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%edx
  800cb4:	89 d0                	mov    %edx,%eax
  800cb6:	f7 d0                	not    %eax
  800cb8:	a8 05                	test   $0x5,%al
  800cba:	75 5a                	jne    800d16 <duppage+0x75>
  800cbc:	89 d0                	mov    %edx,%eax
  800cbe:	83 e0 18             	and    $0x18,%eax
  800cc1:	83 f8 01             	cmp    $0x1,%eax
  800cc4:	19 c0                	sbb    %eax,%eax
  800cc6:	83 e0 e8             	and    $0xffffffe8,%eax
  800cc9:	83 c0 1d             	add    $0x1d,%eax
  800ccc:	f7 c2 02 08 00 00    	test   $0x802,%edx
  800cd2:	74 68                	je     800d3c <duppage+0x9b>
  800cd4:	80 cc 08             	or     $0x8,%ah
  800cd7:	89 c3                	mov    %eax,%ebx
  800cd9:	83 ec 0c             	sub    $0xc,%esp
  800cdc:	53                   	push   %ebx
  800cdd:	56                   	push   %esi
  800cde:	51                   	push   %ecx
  800cdf:	56                   	push   %esi
  800ce0:	6a 00                	push   $0x0
  800ce2:	e8 e4 fe ff ff       	call   800bcb <sys_page_map>
  800ce7:	83 c4 20             	add    $0x20,%esp
  800cea:	85 c0                	test   %eax,%eax
  800cec:	78 3c                	js     800d2a <duppage+0x89>
  800cee:	83 ec 0c             	sub    $0xc,%esp
  800cf1:	53                   	push   %ebx
  800cf2:	56                   	push   %esi
  800cf3:	6a 00                	push   $0x0
  800cf5:	56                   	push   %esi
  800cf6:	6a 00                	push   $0x0
  800cf8:	e8 ce fe ff ff       	call   800bcb <sys_page_map>
  800cfd:	83 c4 20             	add    $0x20,%esp
  800d00:	85 c0                	test   %eax,%eax
  800d02:	79 4d                	jns    800d51 <duppage+0xb0>
  800d04:	50                   	push   %eax
  800d05:	68 1c 17 80 00       	push   $0x80171c
  800d0a:	6a 57                	push   $0x57
  800d0c:	68 e8 15 80 00       	push   $0x8015e8
  800d11:	e8 3d f4 ff ff       	call   800153 <_panic>
  800d16:	83 ec 04             	sub    $0x4,%esp
  800d19:	68 c0 16 80 00       	push   $0x8016c0
  800d1e:	6a 47                	push   $0x47
  800d20:	68 e8 15 80 00       	push   $0x8015e8
  800d25:	e8 29 f4 ff ff       	call   800153 <_panic>
  800d2a:	50                   	push   %eax
  800d2b:	68 f0 16 80 00       	push   $0x8016f0
  800d30:	6a 53                	push   $0x53
  800d32:	68 e8 15 80 00       	push   $0x8015e8
  800d37:	e8 17 f4 ff ff       	call   800153 <_panic>
  800d3c:	83 ec 0c             	sub    $0xc,%esp
  800d3f:	50                   	push   %eax
  800d40:	56                   	push   %esi
  800d41:	51                   	push   %ecx
  800d42:	56                   	push   %esi
  800d43:	6a 00                	push   $0x0
  800d45:	e8 81 fe ff ff       	call   800bcb <sys_page_map>
  800d4a:	83 c4 20             	add    $0x20,%esp
  800d4d:	85 c0                	test   %eax,%eax
  800d4f:	78 0c                	js     800d5d <duppage+0xbc>
  800d51:	b8 00 00 00 00       	mov    $0x0,%eax
  800d56:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800d59:	5b                   	pop    %ebx
  800d5a:	5e                   	pop    %esi
  800d5b:	5d                   	pop    %ebp
  800d5c:	c3                   	ret
  800d5d:	50                   	push   %eax
  800d5e:	68 44 17 80 00       	push   $0x801744
  800d63:	6a 5b                	push   $0x5b
  800d65:	68 e8 15 80 00       	push   $0x8015e8
  800d6a:	e8 e4 f3 ff ff       	call   800153 <_panic>

00800d6f <dup_or_share>:
  800d6f:	55                   	push   %ebp
  800d70:	89 e5                	mov    %esp,%ebp
  800d72:	57                   	push   %edi
  800d73:	56                   	push   %esi
  800d74:	53                   	push   %ebx
  800d75:	83 ec 0c             	sub    $0xc,%esp
  800d78:	89 c7                	mov    %eax,%edi
  800d7a:	8b 04 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%eax
  800d81:	a8 01                	test   $0x1,%al
  800d83:	74 33                	je     800db8 <dup_or_share+0x49>
  800d85:	89 d6                	mov    %edx,%esi
  800d87:	21 c1                	and    %eax,%ecx
  800d89:	89 cb                	mov    %ecx,%ebx
  800d8b:	83 e3 02             	and    $0x2,%ebx
  800d8e:	89 da                	mov    %ebx,%edx
  800d90:	83 ca 18             	or     $0x18,%edx
  800d93:	a8 18                	test   $0x18,%al
  800d95:	0f 45 da             	cmovne %edx,%ebx
  800d98:	c1 e6 0c             	shl    $0xc,%esi
  800d9b:	83 e0 1a             	and    $0x1a,%eax
  800d9e:	83 f8 02             	cmp    $0x2,%eax
  800da1:	74 32                	je     800dd5 <dup_or_share+0x66>
  800da3:	83 ec 0c             	sub    $0xc,%esp
  800da6:	53                   	push   %ebx
  800da7:	56                   	push   %esi
  800da8:	57                   	push   %edi
  800da9:	56                   	push   %esi
  800daa:	6a 00                	push   $0x0
  800dac:	e8 1a fe ff ff       	call   800bcb <sys_page_map>
  800db1:	83 c4 20             	add    $0x20,%esp
  800db4:	85 c0                	test   %eax,%eax
  800db6:	78 08                	js     800dc0 <dup_or_share+0x51>
  800db8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800dbb:	5b                   	pop    %ebx
  800dbc:	5e                   	pop    %esi
  800dbd:	5f                   	pop    %edi
  800dbe:	5d                   	pop    %ebp
  800dbf:	c3                   	ret
  800dc0:	50                   	push   %eax
  800dc1:	68 70 17 80 00       	push   $0x801770
  800dc6:	68 84 00 00 00       	push   $0x84
  800dcb:	68 e8 15 80 00       	push   $0x8015e8
  800dd0:	e8 7e f3 ff ff       	call   800153 <_panic>
  800dd5:	83 ec 04             	sub    $0x4,%esp
  800dd8:	53                   	push   %ebx
  800dd9:	56                   	push   %esi
  800dda:	57                   	push   %edi
  800ddb:	e8 c7 fd ff ff       	call   800ba7 <sys_page_alloc>
  800de0:	83 c4 10             	add    $0x10,%esp
  800de3:	85 c0                	test   %eax,%eax
  800de5:	78 57                	js     800e3e <dup_or_share+0xcf>
  800de7:	83 ec 0c             	sub    $0xc,%esp
  800dea:	53                   	push   %ebx
  800deb:	68 00 00 40 00       	push   $0x400000
  800df0:	6a 00                	push   $0x0
  800df2:	56                   	push   %esi
  800df3:	57                   	push   %edi
  800df4:	e8 d2 fd ff ff       	call   800bcb <sys_page_map>
  800df9:	83 c4 20             	add    $0x20,%esp
  800dfc:	85 c0                	test   %eax,%eax
  800dfe:	78 53                	js     800e53 <dup_or_share+0xe4>
  800e00:	83 ec 04             	sub    $0x4,%esp
  800e03:	68 00 10 00 00       	push   $0x1000
  800e08:	56                   	push   %esi
  800e09:	68 00 00 40 00       	push   $0x400000
  800e0e:	e8 ea fa ff ff       	call   8008fd <memmove>
  800e13:	83 c4 08             	add    $0x8,%esp
  800e16:	68 00 00 40 00       	push   $0x400000
  800e1b:	6a 00                	push   $0x0
  800e1d:	e8 cf fd ff ff       	call   800bf1 <sys_page_unmap>
  800e22:	83 c4 10             	add    $0x10,%esp
  800e25:	85 c0                	test   %eax,%eax
  800e27:	79 8f                	jns    800db8 <dup_or_share+0x49>
  800e29:	50                   	push   %eax
  800e2a:	68 32 16 80 00       	push   $0x801632
  800e2f:	68 8d 00 00 00       	push   $0x8d
  800e34:	68 e8 15 80 00       	push   $0x8015e8
  800e39:	e8 15 f3 ff ff       	call   800153 <_panic>
  800e3e:	50                   	push   %eax
  800e3f:	68 90 17 80 00       	push   $0x801790
  800e44:	68 88 00 00 00       	push   $0x88
  800e49:	68 e8 15 80 00       	push   $0x8015e8
  800e4e:	e8 00 f3 ff ff       	call   800153 <_panic>
  800e53:	50                   	push   %eax
  800e54:	68 70 17 80 00       	push   $0x801770
  800e59:	68 8a 00 00 00       	push   $0x8a
  800e5e:	68 e8 15 80 00       	push   $0x8015e8
  800e63:	e8 eb f2 ff ff       	call   800153 <_panic>

00800e68 <pgfault>:
  800e68:	55                   	push   %ebp
  800e69:	89 e5                	mov    %esp,%ebp
  800e6b:	53                   	push   %ebx
  800e6c:	83 ec 08             	sub    $0x8,%esp
  800e6f:	8b 45 08             	mov    0x8(%ebp),%eax
  800e72:	8b 18                	mov    (%eax),%ebx
  800e74:	89 d8                	mov    %ebx,%eax
  800e76:	c1 e8 0c             	shr    $0xc,%eax
  800e79:	8b 04 85 00 00 40 ef 	mov    -0x10c00000(,%eax,4),%eax
  800e80:	6a 07                	push   $0x7
  800e82:	68 00 f0 7f 00       	push   $0x7ff000
  800e87:	6a 00                	push   $0x0
  800e89:	e8 19 fd ff ff       	call   800ba7 <sys_page_alloc>
  800e8e:	83 c4 10             	add    $0x10,%esp
  800e91:	85 c0                	test   %eax,%eax
  800e93:	78 51                	js     800ee6 <pgfault+0x7e>
  800e95:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  800e9b:	83 ec 04             	sub    $0x4,%esp
  800e9e:	68 00 10 00 00       	push   $0x1000
  800ea3:	53                   	push   %ebx
  800ea4:	68 00 f0 7f 00       	push   $0x7ff000
  800ea9:	e8 4f fa ff ff       	call   8008fd <memmove>
  800eae:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  800eb5:	53                   	push   %ebx
  800eb6:	6a 00                	push   $0x0
  800eb8:	68 00 f0 7f 00       	push   $0x7ff000
  800ebd:	6a 00                	push   $0x0
  800ebf:	e8 07 fd ff ff       	call   800bcb <sys_page_map>
  800ec4:	83 c4 20             	add    $0x20,%esp
  800ec7:	85 c0                	test   %eax,%eax
  800ec9:	78 2d                	js     800ef8 <pgfault+0x90>
  800ecb:	83 ec 08             	sub    $0x8,%esp
  800ece:	68 00 f0 7f 00       	push   $0x7ff000
  800ed3:	6a 00                	push   $0x0
  800ed5:	e8 17 fd ff ff       	call   800bf1 <sys_page_unmap>
  800eda:	83 c4 10             	add    $0x10,%esp
  800edd:	85 c0                	test   %eax,%eax
  800edf:	78 29                	js     800f0a <pgfault+0xa2>
  800ee1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800ee4:	c9                   	leave
  800ee5:	c3                   	ret
  800ee6:	50                   	push   %eax
  800ee7:	68 f3 15 80 00       	push   $0x8015f3
  800eec:	6a 27                	push   $0x27
  800eee:	68 e8 15 80 00       	push   $0x8015e8
  800ef3:	e8 5b f2 ff ff       	call   800153 <_panic>
  800ef8:	50                   	push   %eax
  800ef9:	68 0f 16 80 00       	push   $0x80160f
  800efe:	6a 2c                	push   $0x2c
  800f00:	68 e8 15 80 00       	push   $0x8015e8
  800f05:	e8 49 f2 ff ff       	call   800153 <_panic>
  800f0a:	50                   	push   %eax
  800f0b:	68 29 16 80 00       	push   $0x801629
  800f10:	6a 2f                	push   $0x2f
  800f12:	68 e8 15 80 00       	push   $0x8015e8
  800f17:	e8 37 f2 ff ff       	call   800153 <_panic>

00800f1c <fork_v0>:
  800f1c:	55                   	push   %ebp
  800f1d:	89 e5                	mov    %esp,%ebp
  800f1f:	56                   	push   %esi
  800f20:	53                   	push   %ebx
  800f21:	b8 07 00 00 00       	mov    $0x7,%eax
  800f26:	cd 30                	int    $0x30
  800f28:	89 c6                	mov    %eax,%esi
  800f2a:	85 c0                	test   %eax,%eax
  800f2c:	78 23                	js     800f51 <fork_v0+0x35>
  800f2e:	bb 00 00 00 00       	mov    $0x0,%ebx
  800f33:	75 3c                	jne    800f71 <fork_v0+0x55>
  800f35:	e8 22 fc ff ff       	call   800b5c <sys_getenvid>
  800f3a:	25 ff 03 00 00       	and    $0x3ff,%eax
  800f3f:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800f45:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800f4a:	a3 04 20 80 00       	mov    %eax,0x802004
  800f4f:	eb 54                	jmp    800fa5 <fork_v0+0x89>
  800f51:	50                   	push   %eax
  800f52:	68 45 16 80 00       	push   $0x801645
  800f57:	68 a2 00 00 00       	push   $0xa2
  800f5c:	68 e8 15 80 00       	push   $0x8015e8
  800f61:	e8 ed f1 ff ff       	call   800153 <_panic>
  800f66:	83 c3 01             	add    $0x1,%ebx
  800f69:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800f6f:	74 22                	je     800f93 <fork_v0+0x77>
  800f71:	89 d8                	mov    %ebx,%eax
  800f73:	c1 e8 0a             	shr    $0xa,%eax
  800f76:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800f7d:	f7 d0                	not    %eax
  800f7f:	a8 05                	test   $0x5,%al
  800f81:	75 e3                	jne    800f66 <fork_v0+0x4a>
  800f83:	b9 07 00 00 00       	mov    $0x7,%ecx
  800f88:	89 da                	mov    %ebx,%edx
  800f8a:	89 f0                	mov    %esi,%eax
  800f8c:	e8 de fd ff ff       	call   800d6f <dup_or_share>
  800f91:	eb d3                	jmp    800f66 <fork_v0+0x4a>
  800f93:	83 ec 08             	sub    $0x8,%esp
  800f96:	6a 02                	push   $0x2
  800f98:	56                   	push   %esi
  800f99:	e8 76 fc ff ff       	call   800c14 <sys_env_set_status>
  800f9e:	83 c4 10             	add    $0x10,%esp
  800fa1:	85 c0                	test   %eax,%eax
  800fa3:	78 09                	js     800fae <fork_v0+0x92>
  800fa5:	89 f0                	mov    %esi,%eax
  800fa7:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800faa:	5b                   	pop    %ebx
  800fab:	5e                   	pop    %esi
  800fac:	5d                   	pop    %ebp
  800fad:	c3                   	ret
  800fae:	50                   	push   %eax
  800faf:	68 55 16 80 00       	push   $0x801655
  800fb4:	68 b8 00 00 00       	push   $0xb8
  800fb9:	68 e8 15 80 00       	push   $0x8015e8
  800fbe:	e8 90 f1 ff ff       	call   800153 <_panic>

00800fc3 <fork>:
  800fc3:	55                   	push   %ebp
  800fc4:	89 e5                	mov    %esp,%ebp
  800fc6:	56                   	push   %esi
  800fc7:	53                   	push   %ebx
  800fc8:	83 ec 0c             	sub    $0xc,%esp
  800fcb:	68 68 0e 80 00       	push   $0x800e68
  800fd0:	e8 2d 02 00 00       	call   801202 <set_pgfault_handler>
  800fd5:	b8 07 00 00 00       	mov    $0x7,%eax
  800fda:	cd 30                	int    $0x30
  800fdc:	89 c6                	mov    %eax,%esi
  800fde:	83 c4 10             	add    $0x10,%esp
  800fe1:	85 c0                	test   %eax,%eax
  800fe3:	78 26                	js     80100b <fork+0x48>
  800fe5:	bb 00 00 00 00       	mov    $0x0,%ebx
  800fea:	75 47                	jne    801033 <fork+0x70>
  800fec:	e8 6b fb ff ff       	call   800b5c <sys_getenvid>
  800ff1:	25 ff 03 00 00       	and    $0x3ff,%eax
  800ff6:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800ffc:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  801001:	a3 04 20 80 00       	mov    %eax,0x802004
  801006:	e9 94 00 00 00       	jmp    80109f <fork+0xdc>
  80100b:	50                   	push   %eax
  80100c:	68 45 16 80 00       	push   $0x801645
  801011:	68 d5 00 00 00       	push   $0xd5
  801016:	68 e8 15 80 00       	push   $0x8015e8
  80101b:	e8 33 f1 ff ff       	call   800153 <_panic>
  801020:	83 c3 01             	add    $0x1,%ebx
  801023:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  801029:	74 32                	je     80105d <fork+0x9a>
  80102b:	81 fb ff eb 0e 00    	cmp    $0xeebff,%ebx
  801031:	74 ed                	je     801020 <fork+0x5d>
  801033:	89 d8                	mov    %ebx,%eax
  801035:	c1 e8 0a             	shr    $0xa,%eax
  801038:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  80103f:	f7 d0                	not    %eax
  801041:	a8 05                	test   $0x5,%al
  801043:	75 db                	jne    801020 <fork+0x5d>
  801045:	8b 04 9d 00 00 40 ef 	mov    -0x10c00000(,%ebx,4),%eax
  80104c:	f7 d0                	not    %eax
  80104e:	a8 05                	test   $0x5,%al
  801050:	75 ce                	jne    801020 <fork+0x5d>
  801052:	89 da                	mov    %ebx,%edx
  801054:	89 f0                	mov    %esi,%eax
  801056:	e8 46 fc ff ff       	call   800ca1 <duppage>
  80105b:	eb c3                	jmp    801020 <fork+0x5d>
  80105d:	83 ec 04             	sub    $0x4,%esp
  801060:	6a 07                	push   $0x7
  801062:	68 00 f0 bf ee       	push   $0xeebff000
  801067:	56                   	push   %esi
  801068:	e8 3a fb ff ff       	call   800ba7 <sys_page_alloc>
  80106d:	83 c4 10             	add    $0x10,%esp
  801070:	85 c0                	test   %eax,%eax
  801072:	78 34                	js     8010a8 <fork+0xe5>
  801074:	a1 04 20 80 00       	mov    0x802004,%eax
  801079:	8b 40 64             	mov    0x64(%eax),%eax
  80107c:	83 ec 08             	sub    $0x8,%esp
  80107f:	50                   	push   %eax
  801080:	56                   	push   %esi
  801081:	e8 b1 fb ff ff       	call   800c37 <sys_env_set_pgfault_upcall>
  801086:	83 c4 10             	add    $0x10,%esp
  801089:	85 c0                	test   %eax,%eax
  80108b:	78 30                	js     8010bd <fork+0xfa>
  80108d:	83 ec 08             	sub    $0x8,%esp
  801090:	6a 02                	push   $0x2
  801092:	56                   	push   %esi
  801093:	e8 7c fb ff ff       	call   800c14 <sys_env_set_status>
  801098:	83 c4 10             	add    $0x10,%esp
  80109b:	85 c0                	test   %eax,%eax
  80109d:	78 33                	js     8010d2 <fork+0x10f>
  80109f:	89 f0                	mov    %esi,%eax
  8010a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8010a4:	5b                   	pop    %ebx
  8010a5:	5e                   	pop    %esi
  8010a6:	5d                   	pop    %ebp
  8010a7:	c3                   	ret
  8010a8:	50                   	push   %eax
  8010a9:	68 b4 17 80 00       	push   $0x8017b4
  8010ae:	68 f2 00 00 00       	push   $0xf2
  8010b3:	68 e8 15 80 00       	push   $0x8015e8
  8010b8:	e8 96 f0 ff ff       	call   800153 <_panic>
  8010bd:	50                   	push   %eax
  8010be:	68 e0 17 80 00       	push   $0x8017e0
  8010c3:	68 f5 00 00 00       	push   $0xf5
  8010c8:	68 e8 15 80 00       	push   $0x8015e8
  8010cd:	e8 81 f0 ff ff       	call   800153 <_panic>
  8010d2:	50                   	push   %eax
  8010d3:	68 55 16 80 00       	push   $0x801655
  8010d8:	68 f8 00 00 00       	push   $0xf8
  8010dd:	68 e8 15 80 00       	push   $0x8015e8
  8010e2:	e8 6c f0 ff ff       	call   800153 <_panic>

008010e7 <sfork>:
  8010e7:	55                   	push   %ebp
  8010e8:	89 e5                	mov    %esp,%ebp
  8010ea:	83 ec 0c             	sub    $0xc,%esp
  8010ed:	68 6c 16 80 00       	push   $0x80166c
  8010f2:	68 01 01 00 00       	push   $0x101
  8010f7:	68 e8 15 80 00       	push   $0x8015e8
  8010fc:	e8 52 f0 ff ff       	call   800153 <_panic>

00801101 <ipc_recv>:
  801101:	55                   	push   %ebp
  801102:	89 e5                	mov    %esp,%ebp
  801104:	56                   	push   %esi
  801105:	53                   	push   %ebx
  801106:	8b 75 08             	mov    0x8(%ebp),%esi
  801109:	8b 5d 10             	mov    0x10(%ebp),%ebx
  80110c:	83 ec 0c             	sub    $0xc,%esp
  80110f:	ff 75 0c             	push   0xc(%ebp)
  801112:	e8 68 fb ff ff       	call   800c7f <sys_ipc_recv>
  801117:	83 c4 10             	add    $0x10,%esp
  80111a:	85 f6                	test   %esi,%esi
  80111c:	74 14                	je     801132 <ipc_recv+0x31>
  80111e:	ba 00 00 00 00       	mov    $0x0,%edx
  801123:	85 c0                	test   %eax,%eax
  801125:	75 09                	jne    801130 <ipc_recv+0x2f>
  801127:	8b 15 04 20 80 00    	mov    0x802004,%edx
  80112d:	8b 52 74             	mov    0x74(%edx),%edx
  801130:	89 16                	mov    %edx,(%esi)
  801132:	85 db                	test   %ebx,%ebx
  801134:	74 25                	je     80115b <ipc_recv+0x5a>
  801136:	85 c0                	test   %eax,%eax
  801138:	74 0d                	je     801147 <ipc_recv+0x46>
  80113a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  801140:	8d 65 f8             	lea    -0x8(%ebp),%esp
  801143:	5b                   	pop    %ebx
  801144:	5e                   	pop    %esi
  801145:	5d                   	pop    %ebp
  801146:	c3                   	ret
  801147:	a1 04 20 80 00       	mov    0x802004,%eax
  80114c:	8b 40 78             	mov    0x78(%eax),%eax
  80114f:	89 03                	mov    %eax,(%ebx)
  801151:	a1 04 20 80 00       	mov    0x802004,%eax
  801156:	8b 40 70             	mov    0x70(%eax),%eax
  801159:	eb e5                	jmp    801140 <ipc_recv+0x3f>
  80115b:	85 c0                	test   %eax,%eax
  80115d:	75 e1                	jne    801140 <ipc_recv+0x3f>
  80115f:	eb f0                	jmp    801151 <ipc_recv+0x50>

00801161 <ipc_send>:
  801161:	55                   	push   %ebp
  801162:	89 e5                	mov    %esp,%ebp
  801164:	57                   	push   %edi
  801165:	56                   	push   %esi
  801166:	53                   	push   %ebx
  801167:	83 ec 0c             	sub    $0xc,%esp
  80116a:	8b 75 0c             	mov    0xc(%ebp),%esi
  80116d:	8b 5d 10             	mov    0x10(%ebp),%ebx
  801170:	8b 7d 14             	mov    0x14(%ebp),%edi
  801173:	85 db                	test   %ebx,%ebx
  801175:	b8 00 00 c0 ee       	mov    $0xeec00000,%eax
  80117a:	0f 44 d8             	cmove  %eax,%ebx
  80117d:	57                   	push   %edi
  80117e:	53                   	push   %ebx
  80117f:	56                   	push   %esi
  801180:	ff 75 08             	push   0x8(%ebp)
  801183:	e8 d2 fa ff ff       	call   800c5a <sys_ipc_try_send>
  801188:	83 c4 10             	add    $0x10,%esp
  80118b:	eb 13                	jmp    8011a0 <ipc_send+0x3f>
  80118d:	e8 ee f9 ff ff       	call   800b80 <sys_yield>
  801192:	57                   	push   %edi
  801193:	53                   	push   %ebx
  801194:	56                   	push   %esi
  801195:	ff 75 08             	push   0x8(%ebp)
  801198:	e8 bd fa ff ff       	call   800c5a <sys_ipc_try_send>
  80119d:	83 c4 10             	add    $0x10,%esp
  8011a0:	83 f8 f9             	cmp    $0xfffffff9,%eax
  8011a3:	74 e8                	je     80118d <ipc_send+0x2c>
  8011a5:	85 c0                	test   %eax,%eax
  8011a7:	78 08                	js     8011b1 <ipc_send+0x50>
  8011a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8011ac:	5b                   	pop    %ebx
  8011ad:	5e                   	pop    %esi
  8011ae:	5f                   	pop    %edi
  8011af:	5d                   	pop    %ebp
  8011b0:	c3                   	ret
  8011b1:	50                   	push   %eax
  8011b2:	68 82 16 80 00       	push   $0x801682
  8011b7:	6a 3b                	push   $0x3b
  8011b9:	68 8f 16 80 00       	push   $0x80168f
  8011be:	e8 90 ef ff ff       	call   800153 <_panic>

008011c3 <ipc_find_env>:
  8011c3:	55                   	push   %ebp
  8011c4:	89 e5                	mov    %esp,%ebp
  8011c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8011c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8011ce:	69 d0 84 00 00 00    	imul   $0x84,%eax,%edx
  8011d4:	81 c2 00 00 c0 ee    	add    $0xeec00000,%edx
  8011da:	8b 52 50             	mov    0x50(%edx),%edx
  8011dd:	39 ca                	cmp    %ecx,%edx
  8011df:	74 11                	je     8011f2 <ipc_find_env+0x2f>
  8011e1:	83 c0 01             	add    $0x1,%eax
  8011e4:	3d 00 04 00 00       	cmp    $0x400,%eax
  8011e9:	75 e3                	jne    8011ce <ipc_find_env+0xb>
  8011eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8011f0:	eb 0e                	jmp    801200 <ipc_find_env+0x3d>
  8011f2:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8011f8:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8011fd:	8b 40 48             	mov    0x48(%eax),%eax
  801200:	5d                   	pop    %ebp
  801201:	c3                   	ret

00801202 <set_pgfault_handler>:
  801202:	55                   	push   %ebp
  801203:	89 e5                	mov    %esp,%ebp
  801205:	83 ec 08             	sub    $0x8,%esp
  801208:	83 3d 08 20 80 00 00 	cmpl   $0x0,0x802008
  80120f:	74 0a                	je     80121b <set_pgfault_handler+0x19>
  801211:	8b 45 08             	mov    0x8(%ebp),%eax
  801214:	a3 08 20 80 00       	mov    %eax,0x802008
  801219:	c9                   	leave
  80121a:	c3                   	ret
  80121b:	83 ec 04             	sub    $0x4,%esp
  80121e:	6a 07                	push   $0x7
  801220:	68 00 f0 bf ee       	push   $0xeebff000
  801225:	6a 00                	push   $0x0
  801227:	e8 7b f9 ff ff       	call   800ba7 <sys_page_alloc>
  80122c:	83 c4 10             	add    $0x10,%esp
  80122f:	85 c0                	test   %eax,%eax
  801231:	78 e6                	js     801219 <set_pgfault_handler+0x17>
  801233:	83 ec 08             	sub    $0x8,%esp
  801236:	68 4b 12 80 00       	push   $0x80124b
  80123b:	6a 00                	push   $0x0
  80123d:	e8 f5 f9 ff ff       	call   800c37 <sys_env_set_pgfault_upcall>
  801242:	83 c4 10             	add    $0x10,%esp
  801245:	85 c0                	test   %eax,%eax
  801247:	79 c8                	jns    801211 <set_pgfault_handler+0xf>
  801249:	eb ce                	jmp    801219 <set_pgfault_handler+0x17>

0080124b <_pgfault_upcall>:
  80124b:	54                   	push   %esp
  80124c:	a1 08 20 80 00       	mov    0x802008,%eax
  801251:	ff d0                	call   *%eax
  801253:	83 c4 04             	add    $0x4,%esp
  801256:	8b 44 24 28          	mov    0x28(%esp),%eax
  80125a:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  80125e:	83 eb 04             	sub    $0x4,%ebx
  801261:	89 03                	mov    %eax,(%ebx)
  801263:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  801267:	58                   	pop    %eax
  801268:	58                   	pop    %eax
  801269:	61                   	popa
  80126a:	83 c4 04             	add    $0x4,%esp
  80126d:	9d                   	popf
  80126e:	5c                   	pop    %esp
  80126f:	c3                   	ret

00801270 <__udivdi3>:
  801270:	f3 0f 1e fb          	endbr32
  801274:	55                   	push   %ebp
  801275:	57                   	push   %edi
  801276:	56                   	push   %esi
  801277:	53                   	push   %ebx
  801278:	83 ec 1c             	sub    $0x1c,%esp
  80127b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  80127f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  801283:	8b 74 24 34          	mov    0x34(%esp),%esi
  801287:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  80128b:	85 c0                	test   %eax,%eax
  80128d:	75 19                	jne    8012a8 <__udivdi3+0x38>
  80128f:	39 de                	cmp    %ebx,%esi
  801291:	73 4d                	jae    8012e0 <__udivdi3+0x70>
  801293:	31 ff                	xor    %edi,%edi
  801295:	89 e8                	mov    %ebp,%eax
  801297:	89 f2                	mov    %esi,%edx
  801299:	f7 f3                	div    %ebx
  80129b:	89 fa                	mov    %edi,%edx
  80129d:	83 c4 1c             	add    $0x1c,%esp
  8012a0:	5b                   	pop    %ebx
  8012a1:	5e                   	pop    %esi
  8012a2:	5f                   	pop    %edi
  8012a3:	5d                   	pop    %ebp
  8012a4:	c3                   	ret
  8012a5:	8d 76 00             	lea    0x0(%esi),%esi
  8012a8:	39 c6                	cmp    %eax,%esi
  8012aa:	73 14                	jae    8012c0 <__udivdi3+0x50>
  8012ac:	31 ff                	xor    %edi,%edi
  8012ae:	31 c0                	xor    %eax,%eax
  8012b0:	89 fa                	mov    %edi,%edx
  8012b2:	83 c4 1c             	add    $0x1c,%esp
  8012b5:	5b                   	pop    %ebx
  8012b6:	5e                   	pop    %esi
  8012b7:	5f                   	pop    %edi
  8012b8:	5d                   	pop    %ebp
  8012b9:	c3                   	ret
  8012ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8012c0:	0f bd f8             	bsr    %eax,%edi
  8012c3:	83 f7 1f             	xor    $0x1f,%edi
  8012c6:	75 48                	jne    801310 <__udivdi3+0xa0>
  8012c8:	39 f0                	cmp    %esi,%eax
  8012ca:	72 06                	jb     8012d2 <__udivdi3+0x62>
  8012cc:	31 c0                	xor    %eax,%eax
  8012ce:	39 dd                	cmp    %ebx,%ebp
  8012d0:	72 de                	jb     8012b0 <__udivdi3+0x40>
  8012d2:	b8 01 00 00 00       	mov    $0x1,%eax
  8012d7:	eb d7                	jmp    8012b0 <__udivdi3+0x40>
  8012d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8012e0:	89 d9                	mov    %ebx,%ecx
  8012e2:	85 db                	test   %ebx,%ebx
  8012e4:	75 0b                	jne    8012f1 <__udivdi3+0x81>
  8012e6:	b8 01 00 00 00       	mov    $0x1,%eax
  8012eb:	31 d2                	xor    %edx,%edx
  8012ed:	f7 f3                	div    %ebx
  8012ef:	89 c1                	mov    %eax,%ecx
  8012f1:	31 d2                	xor    %edx,%edx
  8012f3:	89 f0                	mov    %esi,%eax
  8012f5:	f7 f1                	div    %ecx
  8012f7:	89 c6                	mov    %eax,%esi
  8012f9:	89 e8                	mov    %ebp,%eax
  8012fb:	89 f7                	mov    %esi,%edi
  8012fd:	f7 f1                	div    %ecx
  8012ff:	89 fa                	mov    %edi,%edx
  801301:	83 c4 1c             	add    $0x1c,%esp
  801304:	5b                   	pop    %ebx
  801305:	5e                   	pop    %esi
  801306:	5f                   	pop    %edi
  801307:	5d                   	pop    %ebp
  801308:	c3                   	ret
  801309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801310:	89 f9                	mov    %edi,%ecx
  801312:	ba 20 00 00 00       	mov    $0x20,%edx
  801317:	29 fa                	sub    %edi,%edx
  801319:	d3 e0                	shl    %cl,%eax
  80131b:	89 44 24 08          	mov    %eax,0x8(%esp)
  80131f:	89 d1                	mov    %edx,%ecx
  801321:	89 d8                	mov    %ebx,%eax
  801323:	d3 e8                	shr    %cl,%eax
  801325:	89 c1                	mov    %eax,%ecx
  801327:	8b 44 24 08          	mov    0x8(%esp),%eax
  80132b:	09 c1                	or     %eax,%ecx
  80132d:	89 f0                	mov    %esi,%eax
  80132f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  801333:	89 f9                	mov    %edi,%ecx
  801335:	d3 e3                	shl    %cl,%ebx
  801337:	89 d1                	mov    %edx,%ecx
  801339:	d3 e8                	shr    %cl,%eax
  80133b:	89 f9                	mov    %edi,%ecx
  80133d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  801341:	89 eb                	mov    %ebp,%ebx
  801343:	d3 e6                	shl    %cl,%esi
  801345:	89 d1                	mov    %edx,%ecx
  801347:	d3 eb                	shr    %cl,%ebx
  801349:	09 f3                	or     %esi,%ebx
  80134b:	89 c6                	mov    %eax,%esi
  80134d:	89 f2                	mov    %esi,%edx
  80134f:	89 d8                	mov    %ebx,%eax
  801351:	f7 74 24 08          	divl   0x8(%esp)
  801355:	89 d6                	mov    %edx,%esi
  801357:	89 c3                	mov    %eax,%ebx
  801359:	f7 64 24 0c          	mull   0xc(%esp)
  80135d:	39 d6                	cmp    %edx,%esi
  80135f:	72 1f                	jb     801380 <__udivdi3+0x110>
  801361:	89 f9                	mov    %edi,%ecx
  801363:	d3 e5                	shl    %cl,%ebp
  801365:	39 c5                	cmp    %eax,%ebp
  801367:	73 04                	jae    80136d <__udivdi3+0xfd>
  801369:	39 d6                	cmp    %edx,%esi
  80136b:	74 13                	je     801380 <__udivdi3+0x110>
  80136d:	89 d8                	mov    %ebx,%eax
  80136f:	31 ff                	xor    %edi,%edi
  801371:	e9 3a ff ff ff       	jmp    8012b0 <__udivdi3+0x40>
  801376:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80137d:	00 
  80137e:	66 90                	xchg   %ax,%ax
  801380:	8d 43 ff             	lea    -0x1(%ebx),%eax
  801383:	31 ff                	xor    %edi,%edi
  801385:	e9 26 ff ff ff       	jmp    8012b0 <__udivdi3+0x40>
  80138a:	66 90                	xchg   %ax,%ax
  80138c:	66 90                	xchg   %ax,%ax
  80138e:	66 90                	xchg   %ax,%ax

00801390 <__umoddi3>:
  801390:	f3 0f 1e fb          	endbr32
  801394:	55                   	push   %ebp
  801395:	57                   	push   %edi
  801396:	56                   	push   %esi
  801397:	53                   	push   %ebx
  801398:	83 ec 1c             	sub    $0x1c,%esp
  80139b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  80139f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  8013a3:	8b 74 24 30          	mov    0x30(%esp),%esi
  8013a7:	8b 7c 24 38          	mov    0x38(%esp),%edi
  8013ab:	89 da                	mov    %ebx,%edx
  8013ad:	85 c0                	test   %eax,%eax
  8013af:	75 17                	jne    8013c8 <__umoddi3+0x38>
  8013b1:	39 fb                	cmp    %edi,%ebx
  8013b3:	73 53                	jae    801408 <__umoddi3+0x78>
  8013b5:	89 f0                	mov    %esi,%eax
  8013b7:	f7 f7                	div    %edi
  8013b9:	89 d0                	mov    %edx,%eax
  8013bb:	31 d2                	xor    %edx,%edx
  8013bd:	83 c4 1c             	add    $0x1c,%esp
  8013c0:	5b                   	pop    %ebx
  8013c1:	5e                   	pop    %esi
  8013c2:	5f                   	pop    %edi
  8013c3:	5d                   	pop    %ebp
  8013c4:	c3                   	ret
  8013c5:	8d 76 00             	lea    0x0(%esi),%esi
  8013c8:	89 f1                	mov    %esi,%ecx
  8013ca:	39 c3                	cmp    %eax,%ebx
  8013cc:	73 12                	jae    8013e0 <__umoddi3+0x50>
  8013ce:	89 f0                	mov    %esi,%eax
  8013d0:	83 c4 1c             	add    $0x1c,%esp
  8013d3:	5b                   	pop    %ebx
  8013d4:	5e                   	pop    %esi
  8013d5:	5f                   	pop    %edi
  8013d6:	5d                   	pop    %ebp
  8013d7:	c3                   	ret
  8013d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8013df:	00 
  8013e0:	0f bd e8             	bsr    %eax,%ebp
  8013e3:	83 f5 1f             	xor    $0x1f,%ebp
  8013e6:	75 48                	jne    801430 <__umoddi3+0xa0>
  8013e8:	39 d8                	cmp    %ebx,%eax
  8013ea:	0f 82 d0 00 00 00    	jb     8014c0 <__umoddi3+0x130>
  8013f0:	39 fe                	cmp    %edi,%esi
  8013f2:	0f 83 c8 00 00 00    	jae    8014c0 <__umoddi3+0x130>
  8013f8:	89 c8                	mov    %ecx,%eax
  8013fa:	83 c4 1c             	add    $0x1c,%esp
  8013fd:	5b                   	pop    %ebx
  8013fe:	5e                   	pop    %esi
  8013ff:	5f                   	pop    %edi
  801400:	5d                   	pop    %ebp
  801401:	c3                   	ret
  801402:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  801408:	89 f9                	mov    %edi,%ecx
  80140a:	85 ff                	test   %edi,%edi
  80140c:	75 0b                	jne    801419 <__umoddi3+0x89>
  80140e:	b8 01 00 00 00       	mov    $0x1,%eax
  801413:	31 d2                	xor    %edx,%edx
  801415:	f7 f7                	div    %edi
  801417:	89 c1                	mov    %eax,%ecx
  801419:	89 d8                	mov    %ebx,%eax
  80141b:	31 d2                	xor    %edx,%edx
  80141d:	f7 f1                	div    %ecx
  80141f:	89 f0                	mov    %esi,%eax
  801421:	f7 f1                	div    %ecx
  801423:	89 d0                	mov    %edx,%eax
  801425:	31 d2                	xor    %edx,%edx
  801427:	eb 94                	jmp    8013bd <__umoddi3+0x2d>
  801429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801430:	89 e9                	mov    %ebp,%ecx
  801432:	ba 20 00 00 00       	mov    $0x20,%edx
  801437:	29 ea                	sub    %ebp,%edx
  801439:	d3 e0                	shl    %cl,%eax
  80143b:	89 44 24 08          	mov    %eax,0x8(%esp)
  80143f:	89 d1                	mov    %edx,%ecx
  801441:	89 f8                	mov    %edi,%eax
  801443:	d3 e8                	shr    %cl,%eax
  801445:	89 54 24 04          	mov    %edx,0x4(%esp)
  801449:	8b 54 24 04          	mov    0x4(%esp),%edx
  80144d:	89 c1                	mov    %eax,%ecx
  80144f:	8b 44 24 08          	mov    0x8(%esp),%eax
  801453:	09 c1                	or     %eax,%ecx
  801455:	89 d8                	mov    %ebx,%eax
  801457:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  80145b:	89 e9                	mov    %ebp,%ecx
  80145d:	d3 e7                	shl    %cl,%edi
  80145f:	89 d1                	mov    %edx,%ecx
  801461:	d3 e8                	shr    %cl,%eax
  801463:	89 e9                	mov    %ebp,%ecx
  801465:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  801469:	d3 e3                	shl    %cl,%ebx
  80146b:	89 c7                	mov    %eax,%edi
  80146d:	89 d1                	mov    %edx,%ecx
  80146f:	89 f0                	mov    %esi,%eax
  801471:	d3 e8                	shr    %cl,%eax
  801473:	89 fa                	mov    %edi,%edx
  801475:	89 e9                	mov    %ebp,%ecx
  801477:	09 d8                	or     %ebx,%eax
  801479:	d3 e6                	shl    %cl,%esi
  80147b:	f7 74 24 08          	divl   0x8(%esp)
  80147f:	89 d3                	mov    %edx,%ebx
  801481:	f7 64 24 0c          	mull   0xc(%esp)
  801485:	89 c7                	mov    %eax,%edi
  801487:	89 d1                	mov    %edx,%ecx
  801489:	39 d3                	cmp    %edx,%ebx
  80148b:	72 06                	jb     801493 <__umoddi3+0x103>
  80148d:	75 10                	jne    80149f <__umoddi3+0x10f>
  80148f:	39 c6                	cmp    %eax,%esi
  801491:	73 0c                	jae    80149f <__umoddi3+0x10f>
  801493:	2b 44 24 0c          	sub    0xc(%esp),%eax
  801497:	1b 54 24 08          	sbb    0x8(%esp),%edx
  80149b:	89 d1                	mov    %edx,%ecx
  80149d:	89 c7                	mov    %eax,%edi
  80149f:	89 f2                	mov    %esi,%edx
  8014a1:	29 fa                	sub    %edi,%edx
  8014a3:	19 cb                	sbb    %ecx,%ebx
  8014a5:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  8014aa:	89 d8                	mov    %ebx,%eax
  8014ac:	d3 e0                	shl    %cl,%eax
  8014ae:	89 e9                	mov    %ebp,%ecx
  8014b0:	d3 ea                	shr    %cl,%edx
  8014b2:	d3 eb                	shr    %cl,%ebx
  8014b4:	09 d0                	or     %edx,%eax
  8014b6:	89 da                	mov    %ebx,%edx
  8014b8:	83 c4 1c             	add    $0x1c,%esp
  8014bb:	5b                   	pop    %ebx
  8014bc:	5e                   	pop    %esi
  8014bd:	5f                   	pop    %edi
  8014be:	5d                   	pop    %ebp
  8014bf:	c3                   	ret
  8014c0:	89 da                	mov    %ebx,%edx
  8014c2:	89 f1                	mov    %esi,%ecx
  8014c4:	29 f9                	sub    %edi,%ecx
  8014c6:	19 c2                	sbb    %eax,%edx
  8014c8:	89 c8                	mov    %ecx,%eax
  8014ca:	e9 2b ff ff ff       	jmp    8013fa <__umoddi3+0x6a>
