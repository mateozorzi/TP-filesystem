
obj/user/fairness:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 70 00 00 00       	call   8000a1 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	56                   	push   %esi
  800037:	53                   	push   %ebx
  800038:	83 ec 10             	sub    $0x10,%esp
  80003b:	e8 83 0a 00 00       	call   800ac3 <sys_getenvid>
  800040:	89 c3                	mov    %eax,%ebx
  800042:	81 3d 04 20 80 00 84 	cmpl   $0xeec00084,0x802004
  800049:	00 c0 ee 
  80004c:	74 2d                	je     80007b <umain+0x48>
  80004e:	a1 cc 00 c0 ee       	mov    0xeec000cc,%eax
  800053:	83 ec 04             	sub    $0x4,%esp
  800056:	50                   	push   %eax
  800057:	53                   	push   %ebx
  800058:	68 d1 0f 80 00       	push   $0x800fd1
  80005d:	e8 33 01 00 00       	call   800195 <cprintf>
  800062:	83 c4 10             	add    $0x10,%esp
  800065:	a1 cc 00 c0 ee       	mov    0xeec000cc,%eax
  80006a:	6a 00                	push   $0x0
  80006c:	6a 00                	push   $0x0
  80006e:	6a 00                	push   $0x0
  800070:	50                   	push   %eax
  800071:	e8 f2 0b 00 00       	call   800c68 <ipc_send>
  800076:	83 c4 10             	add    $0x10,%esp
  800079:	eb ea                	jmp    800065 <umain+0x32>
  80007b:	8d 75 f4             	lea    -0xc(%ebp),%esi
  80007e:	83 ec 04             	sub    $0x4,%esp
  800081:	6a 00                	push   $0x0
  800083:	6a 00                	push   $0x0
  800085:	56                   	push   %esi
  800086:	e8 7d 0b 00 00       	call   800c08 <ipc_recv>
  80008b:	83 c4 0c             	add    $0xc,%esp
  80008e:	ff 75 f4             	push   -0xc(%ebp)
  800091:	53                   	push   %ebx
  800092:	68 c0 0f 80 00       	push   $0x800fc0
  800097:	e8 f9 00 00 00       	call   800195 <cprintf>
  80009c:	83 c4 10             	add    $0x10,%esp
  80009f:	eb dd                	jmp    80007e <umain+0x4b>

008000a1 <libmain>:
  8000a1:	55                   	push   %ebp
  8000a2:	89 e5                	mov    %esp,%ebp
  8000a4:	56                   	push   %esi
  8000a5:	53                   	push   %ebx
  8000a6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000a9:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000ac:	e8 12 0a 00 00       	call   800ac3 <sys_getenvid>
  8000b1:	85 c0                	test   %eax,%eax
  8000b3:	78 15                	js     8000ca <libmain+0x29>
  8000b5:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000ba:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8000c0:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8000c5:	a3 04 20 80 00       	mov    %eax,0x802004
  8000ca:	85 db                	test   %ebx,%ebx
  8000cc:	7e 07                	jle    8000d5 <libmain+0x34>
  8000ce:	8b 06                	mov    (%esi),%eax
  8000d0:	a3 00 20 80 00       	mov    %eax,0x802000
  8000d5:	83 ec 08             	sub    $0x8,%esp
  8000d8:	56                   	push   %esi
  8000d9:	53                   	push   %ebx
  8000da:	e8 54 ff ff ff       	call   800033 <umain>
  8000df:	e8 0a 00 00 00       	call   8000ee <exit>
  8000e4:	83 c4 10             	add    $0x10,%esp
  8000e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8000ea:	5b                   	pop    %ebx
  8000eb:	5e                   	pop    %esi
  8000ec:	5d                   	pop    %ebp
  8000ed:	c3                   	ret

008000ee <exit>:
  8000ee:	55                   	push   %ebp
  8000ef:	89 e5                	mov    %esp,%ebp
  8000f1:	83 ec 14             	sub    $0x14,%esp
  8000f4:	6a 00                	push   $0x0
  8000f6:	e8 a6 09 00 00       	call   800aa1 <sys_env_destroy>
  8000fb:	83 c4 10             	add    $0x10,%esp
  8000fe:	c9                   	leave
  8000ff:	c3                   	ret

00800100 <putch>:
  800100:	55                   	push   %ebp
  800101:	89 e5                	mov    %esp,%ebp
  800103:	53                   	push   %ebx
  800104:	83 ec 04             	sub    $0x4,%esp
  800107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80010a:	8b 13                	mov    (%ebx),%edx
  80010c:	8d 42 01             	lea    0x1(%edx),%eax
  80010f:	89 03                	mov    %eax,(%ebx)
  800111:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800114:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800118:	3d ff 00 00 00       	cmp    $0xff,%eax
  80011d:	74 09                	je     800128 <putch+0x28>
  80011f:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800123:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800126:	c9                   	leave
  800127:	c3                   	ret
  800128:	83 ec 08             	sub    $0x8,%esp
  80012b:	68 ff 00 00 00       	push   $0xff
  800130:	8d 43 08             	lea    0x8(%ebx),%eax
  800133:	50                   	push   %eax
  800134:	e8 1e 09 00 00       	call   800a57 <sys_cputs>
  800139:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  80013f:	83 c4 10             	add    $0x10,%esp
  800142:	eb db                	jmp    80011f <putch+0x1f>

00800144 <vcprintf>:
  800144:	55                   	push   %ebp
  800145:	89 e5                	mov    %esp,%ebp
  800147:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80014d:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800154:	00 00 00 
  800157:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  80015e:	00 00 00 
  800161:	ff 75 0c             	push   0xc(%ebp)
  800164:	ff 75 08             	push   0x8(%ebp)
  800167:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80016d:	50                   	push   %eax
  80016e:	68 00 01 80 00       	push   $0x800100
  800173:	e8 74 01 00 00       	call   8002ec <vprintfmt>
  800178:	83 c4 08             	add    $0x8,%esp
  80017b:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800181:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800187:	50                   	push   %eax
  800188:	e8 ca 08 00 00       	call   800a57 <sys_cputs>
  80018d:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800193:	c9                   	leave
  800194:	c3                   	ret

00800195 <cprintf>:
  800195:	55                   	push   %ebp
  800196:	89 e5                	mov    %esp,%ebp
  800198:	83 ec 10             	sub    $0x10,%esp
  80019b:	8d 45 0c             	lea    0xc(%ebp),%eax
  80019e:	50                   	push   %eax
  80019f:	ff 75 08             	push   0x8(%ebp)
  8001a2:	e8 9d ff ff ff       	call   800144 <vcprintf>
  8001a7:	c9                   	leave
  8001a8:	c3                   	ret

008001a9 <printnum>:
  8001a9:	55                   	push   %ebp
  8001aa:	89 e5                	mov    %esp,%ebp
  8001ac:	57                   	push   %edi
  8001ad:	56                   	push   %esi
  8001ae:	53                   	push   %ebx
  8001af:	83 ec 1c             	sub    $0x1c,%esp
  8001b2:	89 c7                	mov    %eax,%edi
  8001b4:	89 d6                	mov    %edx,%esi
  8001b6:	8b 45 08             	mov    0x8(%ebp),%eax
  8001b9:	8b 55 0c             	mov    0xc(%ebp),%edx
  8001bc:	89 d1                	mov    %edx,%ecx
  8001be:	89 c2                	mov    %eax,%edx
  8001c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8001c3:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8001c6:	8b 45 10             	mov    0x10(%ebp),%eax
  8001c9:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8001cc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8001cf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8001d6:	39 c2                	cmp    %eax,%edx
  8001d8:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8001db:	72 3e                	jb     80021b <printnum+0x72>
  8001dd:	83 ec 0c             	sub    $0xc,%esp
  8001e0:	ff 75 18             	push   0x18(%ebp)
  8001e3:	83 eb 01             	sub    $0x1,%ebx
  8001e6:	53                   	push   %ebx
  8001e7:	50                   	push   %eax
  8001e8:	83 ec 08             	sub    $0x8,%esp
  8001eb:	ff 75 e4             	push   -0x1c(%ebp)
  8001ee:	ff 75 e0             	push   -0x20(%ebp)
  8001f1:	ff 75 dc             	push   -0x24(%ebp)
  8001f4:	ff 75 d8             	push   -0x28(%ebp)
  8001f7:	e8 54 0b 00 00       	call   800d50 <__udivdi3>
  8001fc:	83 c4 18             	add    $0x18,%esp
  8001ff:	52                   	push   %edx
  800200:	50                   	push   %eax
  800201:	89 f2                	mov    %esi,%edx
  800203:	89 f8                	mov    %edi,%eax
  800205:	e8 9f ff ff ff       	call   8001a9 <printnum>
  80020a:	83 c4 20             	add    $0x20,%esp
  80020d:	eb 13                	jmp    800222 <printnum+0x79>
  80020f:	83 ec 08             	sub    $0x8,%esp
  800212:	56                   	push   %esi
  800213:	ff 75 18             	push   0x18(%ebp)
  800216:	ff d7                	call   *%edi
  800218:	83 c4 10             	add    $0x10,%esp
  80021b:	83 eb 01             	sub    $0x1,%ebx
  80021e:	85 db                	test   %ebx,%ebx
  800220:	7f ed                	jg     80020f <printnum+0x66>
  800222:	83 ec 08             	sub    $0x8,%esp
  800225:	56                   	push   %esi
  800226:	83 ec 04             	sub    $0x4,%esp
  800229:	ff 75 e4             	push   -0x1c(%ebp)
  80022c:	ff 75 e0             	push   -0x20(%ebp)
  80022f:	ff 75 dc             	push   -0x24(%ebp)
  800232:	ff 75 d8             	push   -0x28(%ebp)
  800235:	e8 36 0c 00 00       	call   800e70 <__umoddi3>
  80023a:	83 c4 14             	add    $0x14,%esp
  80023d:	0f be 80 f2 0f 80 00 	movsbl 0x800ff2(%eax),%eax
  800244:	50                   	push   %eax
  800245:	ff d7                	call   *%edi
  800247:	83 c4 10             	add    $0x10,%esp
  80024a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80024d:	5b                   	pop    %ebx
  80024e:	5e                   	pop    %esi
  80024f:	5f                   	pop    %edi
  800250:	5d                   	pop    %ebp
  800251:	c3                   	ret

00800252 <getuint>:
  800252:	83 fa 01             	cmp    $0x1,%edx
  800255:	7f 13                	jg     80026a <getuint+0x18>
  800257:	85 d2                	test   %edx,%edx
  800259:	74 1c                	je     800277 <getuint+0x25>
  80025b:	8b 10                	mov    (%eax),%edx
  80025d:	8d 4a 04             	lea    0x4(%edx),%ecx
  800260:	89 08                	mov    %ecx,(%eax)
  800262:	8b 02                	mov    (%edx),%eax
  800264:	ba 00 00 00 00       	mov    $0x0,%edx
  800269:	c3                   	ret
  80026a:	8b 10                	mov    (%eax),%edx
  80026c:	8d 4a 08             	lea    0x8(%edx),%ecx
  80026f:	89 08                	mov    %ecx,(%eax)
  800271:	8b 02                	mov    (%edx),%eax
  800273:	8b 52 04             	mov    0x4(%edx),%edx
  800276:	c3                   	ret
  800277:	8b 10                	mov    (%eax),%edx
  800279:	8d 4a 04             	lea    0x4(%edx),%ecx
  80027c:	89 08                	mov    %ecx,(%eax)
  80027e:	8b 02                	mov    (%edx),%eax
  800280:	ba 00 00 00 00       	mov    $0x0,%edx
  800285:	c3                   	ret

00800286 <getint>:
  800286:	83 fa 01             	cmp    $0x1,%edx
  800289:	7f 0f                	jg     80029a <getint+0x14>
  80028b:	85 d2                	test   %edx,%edx
  80028d:	74 18                	je     8002a7 <getint+0x21>
  80028f:	8b 10                	mov    (%eax),%edx
  800291:	8d 4a 04             	lea    0x4(%edx),%ecx
  800294:	89 08                	mov    %ecx,(%eax)
  800296:	8b 02                	mov    (%edx),%eax
  800298:	99                   	cltd
  800299:	c3                   	ret
  80029a:	8b 10                	mov    (%eax),%edx
  80029c:	8d 4a 08             	lea    0x8(%edx),%ecx
  80029f:	89 08                	mov    %ecx,(%eax)
  8002a1:	8b 02                	mov    (%edx),%eax
  8002a3:	8b 52 04             	mov    0x4(%edx),%edx
  8002a6:	c3                   	ret
  8002a7:	8b 10                	mov    (%eax),%edx
  8002a9:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002ac:	89 08                	mov    %ecx,(%eax)
  8002ae:	8b 02                	mov    (%edx),%eax
  8002b0:	99                   	cltd
  8002b1:	c3                   	ret

008002b2 <sprintputch>:
  8002b2:	55                   	push   %ebp
  8002b3:	89 e5                	mov    %esp,%ebp
  8002b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  8002b8:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8002bc:	8b 10                	mov    (%eax),%edx
  8002be:	3b 50 04             	cmp    0x4(%eax),%edx
  8002c1:	73 0a                	jae    8002cd <sprintputch+0x1b>
  8002c3:	8d 4a 01             	lea    0x1(%edx),%ecx
  8002c6:	89 08                	mov    %ecx,(%eax)
  8002c8:	8b 45 08             	mov    0x8(%ebp),%eax
  8002cb:	88 02                	mov    %al,(%edx)
  8002cd:	5d                   	pop    %ebp
  8002ce:	c3                   	ret

008002cf <printfmt>:
  8002cf:	55                   	push   %ebp
  8002d0:	89 e5                	mov    %esp,%ebp
  8002d2:	83 ec 08             	sub    $0x8,%esp
  8002d5:	8d 45 14             	lea    0x14(%ebp),%eax
  8002d8:	50                   	push   %eax
  8002d9:	ff 75 10             	push   0x10(%ebp)
  8002dc:	ff 75 0c             	push   0xc(%ebp)
  8002df:	ff 75 08             	push   0x8(%ebp)
  8002e2:	e8 05 00 00 00       	call   8002ec <vprintfmt>
  8002e7:	83 c4 10             	add    $0x10,%esp
  8002ea:	c9                   	leave
  8002eb:	c3                   	ret

008002ec <vprintfmt>:
  8002ec:	55                   	push   %ebp
  8002ed:	89 e5                	mov    %esp,%ebp
  8002ef:	57                   	push   %edi
  8002f0:	56                   	push   %esi
  8002f1:	53                   	push   %ebx
  8002f2:	83 ec 2c             	sub    $0x2c,%esp
  8002f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8002f8:	8b 75 0c             	mov    0xc(%ebp),%esi
  8002fb:	8b 7d 10             	mov    0x10(%ebp),%edi
  8002fe:	eb 0a                	jmp    80030a <vprintfmt+0x1e>
  800300:	83 ec 08             	sub    $0x8,%esp
  800303:	56                   	push   %esi
  800304:	50                   	push   %eax
  800305:	ff d3                	call   *%ebx
  800307:	83 c4 10             	add    $0x10,%esp
  80030a:	83 c7 01             	add    $0x1,%edi
  80030d:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800311:	83 f8 25             	cmp    $0x25,%eax
  800314:	74 0c                	je     800322 <vprintfmt+0x36>
  800316:	85 c0                	test   %eax,%eax
  800318:	75 e6                	jne    800300 <vprintfmt+0x14>
  80031a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80031d:	5b                   	pop    %ebx
  80031e:	5e                   	pop    %esi
  80031f:	5f                   	pop    %edi
  800320:	5d                   	pop    %ebp
  800321:	c3                   	ret
  800322:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800326:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80032d:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800334:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80033b:	b9 00 00 00 00       	mov    $0x0,%ecx
  800340:	8d 47 01             	lea    0x1(%edi),%eax
  800343:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800346:	0f b6 17             	movzbl (%edi),%edx
  800349:	8d 42 dd             	lea    -0x23(%edx),%eax
  80034c:	3c 55                	cmp    $0x55,%al
  80034e:	0f 87 c3 02 00 00    	ja     800617 <vprintfmt+0x32b>
  800354:	0f b6 c0             	movzbl %al,%eax
  800357:	ff 24 85 00 11 80 00 	jmp    *0x801100(,%eax,4)
  80035e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800361:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800365:	eb d9                	jmp    800340 <vprintfmt+0x54>
  800367:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80036a:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  80036e:	eb d0                	jmp    800340 <vprintfmt+0x54>
  800370:	0f b6 d2             	movzbl %dl,%edx
  800373:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800376:	b8 00 00 00 00       	mov    $0x0,%eax
  80037b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80037e:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800381:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800385:	0f be 17             	movsbl (%edi),%edx
  800388:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80038b:	83 f9 09             	cmp    $0x9,%ecx
  80038e:	77 52                	ja     8003e2 <vprintfmt+0xf6>
  800390:	83 c7 01             	add    $0x1,%edi
  800393:	eb e9                	jmp    80037e <vprintfmt+0x92>
  800395:	8b 45 14             	mov    0x14(%ebp),%eax
  800398:	8d 50 04             	lea    0x4(%eax),%edx
  80039b:	89 55 14             	mov    %edx,0x14(%ebp)
  80039e:	8b 00                	mov    (%eax),%eax
  8003a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003a3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003a6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8003aa:	79 94                	jns    800340 <vprintfmt+0x54>
  8003ac:	8b 45 d0             	mov    -0x30(%ebp),%eax
  8003af:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003b2:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003b9:	eb 85                	jmp    800340 <vprintfmt+0x54>
  8003bb:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8003be:	85 d2                	test   %edx,%edx
  8003c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8003c5:	0f 49 c2             	cmovns %edx,%eax
  8003c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003cb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003ce:	e9 6d ff ff ff       	jmp    800340 <vprintfmt+0x54>
  8003d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003d6:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8003dd:	e9 5e ff ff ff       	jmp    800340 <vprintfmt+0x54>
  8003e2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8003e5:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003e8:	eb bc                	jmp    8003a6 <vprintfmt+0xba>
  8003ea:	83 c1 01             	add    $0x1,%ecx
  8003ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003f0:	e9 4b ff ff ff       	jmp    800340 <vprintfmt+0x54>
  8003f5:	8b 45 14             	mov    0x14(%ebp),%eax
  8003f8:	8d 50 04             	lea    0x4(%eax),%edx
  8003fb:	89 55 14             	mov    %edx,0x14(%ebp)
  8003fe:	83 ec 08             	sub    $0x8,%esp
  800401:	56                   	push   %esi
  800402:	ff 30                	push   (%eax)
  800404:	ff d3                	call   *%ebx
  800406:	83 c4 10             	add    $0x10,%esp
  800409:	e9 a0 01 00 00       	jmp    8005ae <vprintfmt+0x2c2>
  80040e:	8b 45 14             	mov    0x14(%ebp),%eax
  800411:	8d 50 04             	lea    0x4(%eax),%edx
  800414:	89 55 14             	mov    %edx,0x14(%ebp)
  800417:	8b 10                	mov    (%eax),%edx
  800419:	89 d0                	mov    %edx,%eax
  80041b:	f7 d8                	neg    %eax
  80041d:	0f 48 c2             	cmovs  %edx,%eax
  800420:	83 f8 08             	cmp    $0x8,%eax
  800423:	7f 20                	jg     800445 <vprintfmt+0x159>
  800425:	8b 14 85 60 12 80 00 	mov    0x801260(,%eax,4),%edx
  80042c:	85 d2                	test   %edx,%edx
  80042e:	74 15                	je     800445 <vprintfmt+0x159>
  800430:	52                   	push   %edx
  800431:	68 13 10 80 00       	push   $0x801013
  800436:	56                   	push   %esi
  800437:	53                   	push   %ebx
  800438:	e8 92 fe ff ff       	call   8002cf <printfmt>
  80043d:	83 c4 10             	add    $0x10,%esp
  800440:	e9 69 01 00 00       	jmp    8005ae <vprintfmt+0x2c2>
  800445:	50                   	push   %eax
  800446:	68 0a 10 80 00       	push   $0x80100a
  80044b:	56                   	push   %esi
  80044c:	53                   	push   %ebx
  80044d:	e8 7d fe ff ff       	call   8002cf <printfmt>
  800452:	83 c4 10             	add    $0x10,%esp
  800455:	e9 54 01 00 00       	jmp    8005ae <vprintfmt+0x2c2>
  80045a:	8b 45 14             	mov    0x14(%ebp),%eax
  80045d:	8d 50 04             	lea    0x4(%eax),%edx
  800460:	89 55 14             	mov    %edx,0x14(%ebp)
  800463:	8b 08                	mov    (%eax),%ecx
  800465:	85 c9                	test   %ecx,%ecx
  800467:	b8 03 10 80 00       	mov    $0x801003,%eax
  80046c:	0f 45 c1             	cmovne %ecx,%eax
  80046f:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800472:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800476:	7e 06                	jle    80047e <vprintfmt+0x192>
  800478:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  80047c:	75 0b                	jne    800489 <vprintfmt+0x19d>
  80047e:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800481:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800484:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800487:	eb 5c                	jmp    8004e5 <vprintfmt+0x1f9>
  800489:	83 ec 08             	sub    $0x8,%esp
  80048c:	ff 75 d0             	push   -0x30(%ebp)
  80048f:	ff 75 cc             	push   -0x34(%ebp)
  800492:	e8 20 02 00 00       	call   8006b7 <strnlen>
  800497:	89 c2                	mov    %eax,%edx
  800499:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80049c:	29 d0                	sub    %edx,%eax
  80049e:	83 c4 10             	add    $0x10,%esp
  8004a1:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8004a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004a8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004ab:	89 c3                	mov    %eax,%ebx
  8004ad:	eb 0e                	jmp    8004bd <vprintfmt+0x1d1>
  8004af:	83 ec 08             	sub    $0x8,%esp
  8004b2:	56                   	push   %esi
  8004b3:	57                   	push   %edi
  8004b4:	ff 55 08             	call   *0x8(%ebp)
  8004b7:	83 eb 01             	sub    $0x1,%ebx
  8004ba:	83 c4 10             	add    $0x10,%esp
  8004bd:	85 db                	test   %ebx,%ebx
  8004bf:	7f ee                	jg     8004af <vprintfmt+0x1c3>
  8004c1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004c4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004c7:	85 c0                	test   %eax,%eax
  8004c9:	ba 00 00 00 00       	mov    $0x0,%edx
  8004ce:	0f 49 d0             	cmovns %eax,%edx
  8004d1:	29 d0                	sub    %edx,%eax
  8004d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004d6:	eb a6                	jmp    80047e <vprintfmt+0x192>
  8004d8:	83 ec 08             	sub    $0x8,%esp
  8004db:	56                   	push   %esi
  8004dc:	52                   	push   %edx
  8004dd:	ff 55 08             	call   *0x8(%ebp)
  8004e0:	83 c4 10             	add    $0x10,%esp
  8004e3:	89 d9                	mov    %ebx,%ecx
  8004e5:	8d 59 01             	lea    0x1(%ecx),%ebx
  8004e8:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8004ec:	0f be d0             	movsbl %al,%edx
  8004ef:	85 d2                	test   %edx,%edx
  8004f1:	74 28                	je     80051b <vprintfmt+0x22f>
  8004f3:	85 ff                	test   %edi,%edi
  8004f5:	78 05                	js     8004fc <vprintfmt+0x210>
  8004f7:	83 ef 01             	sub    $0x1,%edi
  8004fa:	78 2e                	js     80052a <vprintfmt+0x23e>
  8004fc:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800500:	74 d6                	je     8004d8 <vprintfmt+0x1ec>
  800502:	0f be c0             	movsbl %al,%eax
  800505:	83 e8 20             	sub    $0x20,%eax
  800508:	83 f8 5e             	cmp    $0x5e,%eax
  80050b:	76 cb                	jbe    8004d8 <vprintfmt+0x1ec>
  80050d:	83 ec 08             	sub    $0x8,%esp
  800510:	56                   	push   %esi
  800511:	6a 3f                	push   $0x3f
  800513:	ff 55 08             	call   *0x8(%ebp)
  800516:	83 c4 10             	add    $0x10,%esp
  800519:	eb c8                	jmp    8004e3 <vprintfmt+0x1f7>
  80051b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80051e:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800521:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800524:	01 c7                	add    %eax,%edi
  800526:	29 cf                	sub    %ecx,%edi
  800528:	eb 13                	jmp    80053d <vprintfmt+0x251>
  80052a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80052d:	eb ef                	jmp    80051e <vprintfmt+0x232>
  80052f:	83 ec 08             	sub    $0x8,%esp
  800532:	56                   	push   %esi
  800533:	6a 20                	push   $0x20
  800535:	ff d3                	call   *%ebx
  800537:	83 ef 01             	sub    $0x1,%edi
  80053a:	83 c4 10             	add    $0x10,%esp
  80053d:	85 ff                	test   %edi,%edi
  80053f:	7f ee                	jg     80052f <vprintfmt+0x243>
  800541:	eb 6b                	jmp    8005ae <vprintfmt+0x2c2>
  800543:	89 ca                	mov    %ecx,%edx
  800545:	8d 45 14             	lea    0x14(%ebp),%eax
  800548:	e8 39 fd ff ff       	call   800286 <getint>
  80054d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800550:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800553:	85 d2                	test   %edx,%edx
  800555:	78 0b                	js     800562 <vprintfmt+0x276>
  800557:	89 d1                	mov    %edx,%ecx
  800559:	89 c2                	mov    %eax,%edx
  80055b:	bf 0a 00 00 00       	mov    $0xa,%edi
  800560:	eb 32                	jmp    800594 <vprintfmt+0x2a8>
  800562:	83 ec 08             	sub    $0x8,%esp
  800565:	56                   	push   %esi
  800566:	6a 2d                	push   $0x2d
  800568:	ff d3                	call   *%ebx
  80056a:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80056d:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800570:	f7 da                	neg    %edx
  800572:	83 d1 00             	adc    $0x0,%ecx
  800575:	f7 d9                	neg    %ecx
  800577:	83 c4 10             	add    $0x10,%esp
  80057a:	bf 0a 00 00 00       	mov    $0xa,%edi
  80057f:	eb 13                	jmp    800594 <vprintfmt+0x2a8>
  800581:	89 ca                	mov    %ecx,%edx
  800583:	8d 45 14             	lea    0x14(%ebp),%eax
  800586:	e8 c7 fc ff ff       	call   800252 <getuint>
  80058b:	89 d1                	mov    %edx,%ecx
  80058d:	89 c2                	mov    %eax,%edx
  80058f:	bf 0a 00 00 00       	mov    $0xa,%edi
  800594:	83 ec 0c             	sub    $0xc,%esp
  800597:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80059b:	50                   	push   %eax
  80059c:	ff 75 e0             	push   -0x20(%ebp)
  80059f:	57                   	push   %edi
  8005a0:	51                   	push   %ecx
  8005a1:	52                   	push   %edx
  8005a2:	89 f2                	mov    %esi,%edx
  8005a4:	89 d8                	mov    %ebx,%eax
  8005a6:	e8 fe fb ff ff       	call   8001a9 <printnum>
  8005ab:	83 c4 20             	add    $0x20,%esp
  8005ae:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005b1:	e9 54 fd ff ff       	jmp    80030a <vprintfmt+0x1e>
  8005b6:	89 ca                	mov    %ecx,%edx
  8005b8:	8d 45 14             	lea    0x14(%ebp),%eax
  8005bb:	e8 92 fc ff ff       	call   800252 <getuint>
  8005c0:	89 d1                	mov    %edx,%ecx
  8005c2:	89 c2                	mov    %eax,%edx
  8005c4:	bf 08 00 00 00       	mov    $0x8,%edi
  8005c9:	eb c9                	jmp    800594 <vprintfmt+0x2a8>
  8005cb:	83 ec 08             	sub    $0x8,%esp
  8005ce:	56                   	push   %esi
  8005cf:	6a 30                	push   $0x30
  8005d1:	ff d3                	call   *%ebx
  8005d3:	83 c4 08             	add    $0x8,%esp
  8005d6:	56                   	push   %esi
  8005d7:	6a 78                	push   $0x78
  8005d9:	ff d3                	call   *%ebx
  8005db:	8b 45 14             	mov    0x14(%ebp),%eax
  8005de:	8d 50 04             	lea    0x4(%eax),%edx
  8005e1:	89 55 14             	mov    %edx,0x14(%ebp)
  8005e4:	8b 10                	mov    (%eax),%edx
  8005e6:	b9 00 00 00 00       	mov    $0x0,%ecx
  8005eb:	83 c4 10             	add    $0x10,%esp
  8005ee:	bf 10 00 00 00       	mov    $0x10,%edi
  8005f3:	eb 9f                	jmp    800594 <vprintfmt+0x2a8>
  8005f5:	89 ca                	mov    %ecx,%edx
  8005f7:	8d 45 14             	lea    0x14(%ebp),%eax
  8005fa:	e8 53 fc ff ff       	call   800252 <getuint>
  8005ff:	89 d1                	mov    %edx,%ecx
  800601:	89 c2                	mov    %eax,%edx
  800603:	bf 10 00 00 00       	mov    $0x10,%edi
  800608:	eb 8a                	jmp    800594 <vprintfmt+0x2a8>
  80060a:	83 ec 08             	sub    $0x8,%esp
  80060d:	56                   	push   %esi
  80060e:	6a 25                	push   $0x25
  800610:	ff d3                	call   *%ebx
  800612:	83 c4 10             	add    $0x10,%esp
  800615:	eb 97                	jmp    8005ae <vprintfmt+0x2c2>
  800617:	83 ec 08             	sub    $0x8,%esp
  80061a:	56                   	push   %esi
  80061b:	6a 25                	push   $0x25
  80061d:	ff d3                	call   *%ebx
  80061f:	83 c4 10             	add    $0x10,%esp
  800622:	89 f8                	mov    %edi,%eax
  800624:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800628:	74 05                	je     80062f <vprintfmt+0x343>
  80062a:	83 e8 01             	sub    $0x1,%eax
  80062d:	eb f5                	jmp    800624 <vprintfmt+0x338>
  80062f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800632:	e9 77 ff ff ff       	jmp    8005ae <vprintfmt+0x2c2>

00800637 <vsnprintf>:
  800637:	55                   	push   %ebp
  800638:	89 e5                	mov    %esp,%ebp
  80063a:	83 ec 18             	sub    $0x18,%esp
  80063d:	8b 45 08             	mov    0x8(%ebp),%eax
  800640:	8b 55 0c             	mov    0xc(%ebp),%edx
  800643:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800646:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  80064a:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80064d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800654:	85 c0                	test   %eax,%eax
  800656:	74 26                	je     80067e <vsnprintf+0x47>
  800658:	85 d2                	test   %edx,%edx
  80065a:	7e 22                	jle    80067e <vsnprintf+0x47>
  80065c:	ff 75 14             	push   0x14(%ebp)
  80065f:	ff 75 10             	push   0x10(%ebp)
  800662:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800665:	50                   	push   %eax
  800666:	68 b2 02 80 00       	push   $0x8002b2
  80066b:	e8 7c fc ff ff       	call   8002ec <vprintfmt>
  800670:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800673:	c6 00 00             	movb   $0x0,(%eax)
  800676:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800679:	83 c4 10             	add    $0x10,%esp
  80067c:	c9                   	leave
  80067d:	c3                   	ret
  80067e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800683:	eb f7                	jmp    80067c <vsnprintf+0x45>

00800685 <snprintf>:
  800685:	55                   	push   %ebp
  800686:	89 e5                	mov    %esp,%ebp
  800688:	83 ec 08             	sub    $0x8,%esp
  80068b:	8d 45 14             	lea    0x14(%ebp),%eax
  80068e:	50                   	push   %eax
  80068f:	ff 75 10             	push   0x10(%ebp)
  800692:	ff 75 0c             	push   0xc(%ebp)
  800695:	ff 75 08             	push   0x8(%ebp)
  800698:	e8 9a ff ff ff       	call   800637 <vsnprintf>
  80069d:	c9                   	leave
  80069e:	c3                   	ret

0080069f <strlen>:
  80069f:	55                   	push   %ebp
  8006a0:	89 e5                	mov    %esp,%ebp
  8006a2:	8b 55 08             	mov    0x8(%ebp),%edx
  8006a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8006aa:	eb 03                	jmp    8006af <strlen+0x10>
  8006ac:	83 c0 01             	add    $0x1,%eax
  8006af:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8006b3:	75 f7                	jne    8006ac <strlen+0xd>
  8006b5:	5d                   	pop    %ebp
  8006b6:	c3                   	ret

008006b7 <strnlen>:
  8006b7:	55                   	push   %ebp
  8006b8:	89 e5                	mov    %esp,%ebp
  8006ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c5:	eb 03                	jmp    8006ca <strnlen+0x13>
  8006c7:	83 c0 01             	add    $0x1,%eax
  8006ca:	39 d0                	cmp    %edx,%eax
  8006cc:	74 08                	je     8006d6 <strnlen+0x1f>
  8006ce:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8006d2:	75 f3                	jne    8006c7 <strnlen+0x10>
  8006d4:	89 c2                	mov    %eax,%edx
  8006d6:	89 d0                	mov    %edx,%eax
  8006d8:	5d                   	pop    %ebp
  8006d9:	c3                   	ret

008006da <strcpy>:
  8006da:	55                   	push   %ebp
  8006db:	89 e5                	mov    %esp,%ebp
  8006dd:	53                   	push   %ebx
  8006de:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006e1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8006e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8006e9:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8006ed:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8006f0:	83 c0 01             	add    $0x1,%eax
  8006f3:	84 d2                	test   %dl,%dl
  8006f5:	75 f2                	jne    8006e9 <strcpy+0xf>
  8006f7:	89 c8                	mov    %ecx,%eax
  8006f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006fc:	c9                   	leave
  8006fd:	c3                   	ret

008006fe <strcat>:
  8006fe:	55                   	push   %ebp
  8006ff:	89 e5                	mov    %esp,%ebp
  800701:	53                   	push   %ebx
  800702:	83 ec 10             	sub    $0x10,%esp
  800705:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800708:	53                   	push   %ebx
  800709:	e8 91 ff ff ff       	call   80069f <strlen>
  80070e:	83 c4 08             	add    $0x8,%esp
  800711:	ff 75 0c             	push   0xc(%ebp)
  800714:	01 d8                	add    %ebx,%eax
  800716:	50                   	push   %eax
  800717:	e8 be ff ff ff       	call   8006da <strcpy>
  80071c:	89 d8                	mov    %ebx,%eax
  80071e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800721:	c9                   	leave
  800722:	c3                   	ret

00800723 <strncpy>:
  800723:	55                   	push   %ebp
  800724:	89 e5                	mov    %esp,%ebp
  800726:	56                   	push   %esi
  800727:	53                   	push   %ebx
  800728:	8b 75 08             	mov    0x8(%ebp),%esi
  80072b:	8b 55 0c             	mov    0xc(%ebp),%edx
  80072e:	89 f3                	mov    %esi,%ebx
  800730:	03 5d 10             	add    0x10(%ebp),%ebx
  800733:	89 f0                	mov    %esi,%eax
  800735:	eb 0f                	jmp    800746 <strncpy+0x23>
  800737:	83 c0 01             	add    $0x1,%eax
  80073a:	0f b6 0a             	movzbl (%edx),%ecx
  80073d:	88 48 ff             	mov    %cl,-0x1(%eax)
  800740:	80 f9 01             	cmp    $0x1,%cl
  800743:	83 da ff             	sbb    $0xffffffff,%edx
  800746:	39 d8                	cmp    %ebx,%eax
  800748:	75 ed                	jne    800737 <strncpy+0x14>
  80074a:	89 f0                	mov    %esi,%eax
  80074c:	5b                   	pop    %ebx
  80074d:	5e                   	pop    %esi
  80074e:	5d                   	pop    %ebp
  80074f:	c3                   	ret

00800750 <strlcpy>:
  800750:	55                   	push   %ebp
  800751:	89 e5                	mov    %esp,%ebp
  800753:	56                   	push   %esi
  800754:	53                   	push   %ebx
  800755:	8b 75 08             	mov    0x8(%ebp),%esi
  800758:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80075b:	8b 55 10             	mov    0x10(%ebp),%edx
  80075e:	89 f0                	mov    %esi,%eax
  800760:	85 d2                	test   %edx,%edx
  800762:	74 21                	je     800785 <strlcpy+0x35>
  800764:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800768:	89 f2                	mov    %esi,%edx
  80076a:	eb 09                	jmp    800775 <strlcpy+0x25>
  80076c:	83 c1 01             	add    $0x1,%ecx
  80076f:	83 c2 01             	add    $0x1,%edx
  800772:	88 5a ff             	mov    %bl,-0x1(%edx)
  800775:	39 c2                	cmp    %eax,%edx
  800777:	74 09                	je     800782 <strlcpy+0x32>
  800779:	0f b6 19             	movzbl (%ecx),%ebx
  80077c:	84 db                	test   %bl,%bl
  80077e:	75 ec                	jne    80076c <strlcpy+0x1c>
  800780:	89 d0                	mov    %edx,%eax
  800782:	c6 00 00             	movb   $0x0,(%eax)
  800785:	29 f0                	sub    %esi,%eax
  800787:	5b                   	pop    %ebx
  800788:	5e                   	pop    %esi
  800789:	5d                   	pop    %ebp
  80078a:	c3                   	ret

0080078b <strcmp>:
  80078b:	55                   	push   %ebp
  80078c:	89 e5                	mov    %esp,%ebp
  80078e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800791:	8b 55 0c             	mov    0xc(%ebp),%edx
  800794:	eb 06                	jmp    80079c <strcmp+0x11>
  800796:	83 c1 01             	add    $0x1,%ecx
  800799:	83 c2 01             	add    $0x1,%edx
  80079c:	0f b6 01             	movzbl (%ecx),%eax
  80079f:	84 c0                	test   %al,%al
  8007a1:	74 04                	je     8007a7 <strcmp+0x1c>
  8007a3:	3a 02                	cmp    (%edx),%al
  8007a5:	74 ef                	je     800796 <strcmp+0xb>
  8007a7:	0f b6 c0             	movzbl %al,%eax
  8007aa:	0f b6 12             	movzbl (%edx),%edx
  8007ad:	29 d0                	sub    %edx,%eax
  8007af:	5d                   	pop    %ebp
  8007b0:	c3                   	ret

008007b1 <strncmp>:
  8007b1:	55                   	push   %ebp
  8007b2:	89 e5                	mov    %esp,%ebp
  8007b4:	53                   	push   %ebx
  8007b5:	8b 45 08             	mov    0x8(%ebp),%eax
  8007b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007bb:	8b 55 10             	mov    0x10(%ebp),%edx
  8007be:	eb 09                	jmp    8007c9 <strncmp+0x18>
  8007c0:	83 ea 01             	sub    $0x1,%edx
  8007c3:	83 c0 01             	add    $0x1,%eax
  8007c6:	83 c1 01             	add    $0x1,%ecx
  8007c9:	85 d2                	test   %edx,%edx
  8007cb:	74 18                	je     8007e5 <strncmp+0x34>
  8007cd:	0f b6 18             	movzbl (%eax),%ebx
  8007d0:	84 db                	test   %bl,%bl
  8007d2:	74 04                	je     8007d8 <strncmp+0x27>
  8007d4:	3a 19                	cmp    (%ecx),%bl
  8007d6:	74 e8                	je     8007c0 <strncmp+0xf>
  8007d8:	0f b6 00             	movzbl (%eax),%eax
  8007db:	0f b6 11             	movzbl (%ecx),%edx
  8007de:	29 d0                	sub    %edx,%eax
  8007e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007e3:	c9                   	leave
  8007e4:	c3                   	ret
  8007e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8007ea:	eb f4                	jmp    8007e0 <strncmp+0x2f>

008007ec <strchr>:
  8007ec:	55                   	push   %ebp
  8007ed:	89 e5                	mov    %esp,%ebp
  8007ef:	8b 45 08             	mov    0x8(%ebp),%eax
  8007f2:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007f6:	eb 03                	jmp    8007fb <strchr+0xf>
  8007f8:	83 c0 01             	add    $0x1,%eax
  8007fb:	0f b6 10             	movzbl (%eax),%edx
  8007fe:	84 d2                	test   %dl,%dl
  800800:	74 06                	je     800808 <strchr+0x1c>
  800802:	38 ca                	cmp    %cl,%dl
  800804:	75 f2                	jne    8007f8 <strchr+0xc>
  800806:	eb 05                	jmp    80080d <strchr+0x21>
  800808:	b8 00 00 00 00       	mov    $0x0,%eax
  80080d:	5d                   	pop    %ebp
  80080e:	c3                   	ret

0080080f <strfind>:
  80080f:	55                   	push   %ebp
  800810:	89 e5                	mov    %esp,%ebp
  800812:	8b 45 08             	mov    0x8(%ebp),%eax
  800815:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800819:	0f b6 10             	movzbl (%eax),%edx
  80081c:	38 ca                	cmp    %cl,%dl
  80081e:	74 09                	je     800829 <strfind+0x1a>
  800820:	84 d2                	test   %dl,%dl
  800822:	74 05                	je     800829 <strfind+0x1a>
  800824:	83 c0 01             	add    $0x1,%eax
  800827:	eb f0                	jmp    800819 <strfind+0xa>
  800829:	5d                   	pop    %ebp
  80082a:	c3                   	ret

0080082b <memset>:
  80082b:	55                   	push   %ebp
  80082c:	89 e5                	mov    %esp,%ebp
  80082e:	57                   	push   %edi
  80082f:	8b 55 08             	mov    0x8(%ebp),%edx
  800832:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800835:	85 c9                	test   %ecx,%ecx
  800837:	74 24                	je     80085d <memset+0x32>
  800839:	89 d0                	mov    %edx,%eax
  80083b:	09 c8                	or     %ecx,%eax
  80083d:	a8 03                	test   $0x3,%al
  80083f:	75 14                	jne    800855 <memset+0x2a>
  800841:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800845:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  80084b:	c1 e9 02             	shr    $0x2,%ecx
  80084e:	89 d7                	mov    %edx,%edi
  800850:	fc                   	cld
  800851:	f3 ab                	rep stos %eax,%es:(%edi)
  800853:	eb 08                	jmp    80085d <memset+0x32>
  800855:	89 d7                	mov    %edx,%edi
  800857:	8b 45 0c             	mov    0xc(%ebp),%eax
  80085a:	fc                   	cld
  80085b:	f3 aa                	rep stos %al,%es:(%edi)
  80085d:	89 d0                	mov    %edx,%eax
  80085f:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800862:	c9                   	leave
  800863:	c3                   	ret

00800864 <memmove>:
  800864:	55                   	push   %ebp
  800865:	89 e5                	mov    %esp,%ebp
  800867:	57                   	push   %edi
  800868:	56                   	push   %esi
  800869:	8b 45 08             	mov    0x8(%ebp),%eax
  80086c:	8b 75 0c             	mov    0xc(%ebp),%esi
  80086f:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800872:	39 c6                	cmp    %eax,%esi
  800874:	73 32                	jae    8008a8 <memmove+0x44>
  800876:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800879:	39 d0                	cmp    %edx,%eax
  80087b:	73 2b                	jae    8008a8 <memmove+0x44>
  80087d:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800880:	89 fe                	mov    %edi,%esi
  800882:	09 ce                	or     %ecx,%esi
  800884:	09 d6                	or     %edx,%esi
  800886:	f7 c6 03 00 00 00    	test   $0x3,%esi
  80088c:	75 0e                	jne    80089c <memmove+0x38>
  80088e:	83 ef 04             	sub    $0x4,%edi
  800891:	8d 72 fc             	lea    -0x4(%edx),%esi
  800894:	c1 e9 02             	shr    $0x2,%ecx
  800897:	fd                   	std
  800898:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80089a:	eb 09                	jmp    8008a5 <memmove+0x41>
  80089c:	83 ef 01             	sub    $0x1,%edi
  80089f:	8d 72 ff             	lea    -0x1(%edx),%esi
  8008a2:	fd                   	std
  8008a3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008a5:	fc                   	cld
  8008a6:	eb 1a                	jmp    8008c2 <memmove+0x5e>
  8008a8:	89 c2                	mov    %eax,%edx
  8008aa:	09 ca                	or     %ecx,%edx
  8008ac:	09 f2                	or     %esi,%edx
  8008ae:	f6 c2 03             	test   $0x3,%dl
  8008b1:	75 0a                	jne    8008bd <memmove+0x59>
  8008b3:	c1 e9 02             	shr    $0x2,%ecx
  8008b6:	89 c7                	mov    %eax,%edi
  8008b8:	fc                   	cld
  8008b9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008bb:	eb 05                	jmp    8008c2 <memmove+0x5e>
  8008bd:	89 c7                	mov    %eax,%edi
  8008bf:	fc                   	cld
  8008c0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008c2:	5e                   	pop    %esi
  8008c3:	5f                   	pop    %edi
  8008c4:	5d                   	pop    %ebp
  8008c5:	c3                   	ret

008008c6 <memcpy>:
  8008c6:	55                   	push   %ebp
  8008c7:	89 e5                	mov    %esp,%ebp
  8008c9:	83 ec 0c             	sub    $0xc,%esp
  8008cc:	ff 75 10             	push   0x10(%ebp)
  8008cf:	ff 75 0c             	push   0xc(%ebp)
  8008d2:	ff 75 08             	push   0x8(%ebp)
  8008d5:	e8 8a ff ff ff       	call   800864 <memmove>
  8008da:	c9                   	leave
  8008db:	c3                   	ret

008008dc <memcmp>:
  8008dc:	55                   	push   %ebp
  8008dd:	89 e5                	mov    %esp,%ebp
  8008df:	56                   	push   %esi
  8008e0:	53                   	push   %ebx
  8008e1:	8b 45 08             	mov    0x8(%ebp),%eax
  8008e4:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008e7:	89 c6                	mov    %eax,%esi
  8008e9:	03 75 10             	add    0x10(%ebp),%esi
  8008ec:	eb 06                	jmp    8008f4 <memcmp+0x18>
  8008ee:	83 c0 01             	add    $0x1,%eax
  8008f1:	83 c2 01             	add    $0x1,%edx
  8008f4:	39 f0                	cmp    %esi,%eax
  8008f6:	74 14                	je     80090c <memcmp+0x30>
  8008f8:	0f b6 08             	movzbl (%eax),%ecx
  8008fb:	0f b6 1a             	movzbl (%edx),%ebx
  8008fe:	38 d9                	cmp    %bl,%cl
  800900:	74 ec                	je     8008ee <memcmp+0x12>
  800902:	0f b6 c1             	movzbl %cl,%eax
  800905:	0f b6 db             	movzbl %bl,%ebx
  800908:	29 d8                	sub    %ebx,%eax
  80090a:	eb 05                	jmp    800911 <memcmp+0x35>
  80090c:	b8 00 00 00 00       	mov    $0x0,%eax
  800911:	5b                   	pop    %ebx
  800912:	5e                   	pop    %esi
  800913:	5d                   	pop    %ebp
  800914:	c3                   	ret

00800915 <memfind>:
  800915:	55                   	push   %ebp
  800916:	89 e5                	mov    %esp,%ebp
  800918:	8b 45 08             	mov    0x8(%ebp),%eax
  80091b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80091e:	89 c2                	mov    %eax,%edx
  800920:	03 55 10             	add    0x10(%ebp),%edx
  800923:	eb 03                	jmp    800928 <memfind+0x13>
  800925:	83 c0 01             	add    $0x1,%eax
  800928:	39 d0                	cmp    %edx,%eax
  80092a:	73 04                	jae    800930 <memfind+0x1b>
  80092c:	38 08                	cmp    %cl,(%eax)
  80092e:	75 f5                	jne    800925 <memfind+0x10>
  800930:	5d                   	pop    %ebp
  800931:	c3                   	ret

00800932 <strtol>:
  800932:	55                   	push   %ebp
  800933:	89 e5                	mov    %esp,%ebp
  800935:	57                   	push   %edi
  800936:	56                   	push   %esi
  800937:	53                   	push   %ebx
  800938:	8b 55 08             	mov    0x8(%ebp),%edx
  80093b:	8b 5d 10             	mov    0x10(%ebp),%ebx
  80093e:	eb 03                	jmp    800943 <strtol+0x11>
  800940:	83 c2 01             	add    $0x1,%edx
  800943:	0f b6 02             	movzbl (%edx),%eax
  800946:	3c 20                	cmp    $0x20,%al
  800948:	74 f6                	je     800940 <strtol+0xe>
  80094a:	3c 09                	cmp    $0x9,%al
  80094c:	74 f2                	je     800940 <strtol+0xe>
  80094e:	3c 2b                	cmp    $0x2b,%al
  800950:	74 2a                	je     80097c <strtol+0x4a>
  800952:	bf 00 00 00 00       	mov    $0x0,%edi
  800957:	3c 2d                	cmp    $0x2d,%al
  800959:	74 2b                	je     800986 <strtol+0x54>
  80095b:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800961:	75 0f                	jne    800972 <strtol+0x40>
  800963:	80 3a 30             	cmpb   $0x30,(%edx)
  800966:	74 28                	je     800990 <strtol+0x5e>
  800968:	85 db                	test   %ebx,%ebx
  80096a:	b8 0a 00 00 00       	mov    $0xa,%eax
  80096f:	0f 44 d8             	cmove  %eax,%ebx
  800972:	b9 00 00 00 00       	mov    $0x0,%ecx
  800977:	89 5d 10             	mov    %ebx,0x10(%ebp)
  80097a:	eb 46                	jmp    8009c2 <strtol+0x90>
  80097c:	83 c2 01             	add    $0x1,%edx
  80097f:	bf 00 00 00 00       	mov    $0x0,%edi
  800984:	eb d5                	jmp    80095b <strtol+0x29>
  800986:	83 c2 01             	add    $0x1,%edx
  800989:	bf 01 00 00 00       	mov    $0x1,%edi
  80098e:	eb cb                	jmp    80095b <strtol+0x29>
  800990:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800994:	74 0e                	je     8009a4 <strtol+0x72>
  800996:	85 db                	test   %ebx,%ebx
  800998:	75 d8                	jne    800972 <strtol+0x40>
  80099a:	83 c2 01             	add    $0x1,%edx
  80099d:	bb 08 00 00 00       	mov    $0x8,%ebx
  8009a2:	eb ce                	jmp    800972 <strtol+0x40>
  8009a4:	83 c2 02             	add    $0x2,%edx
  8009a7:	bb 10 00 00 00       	mov    $0x10,%ebx
  8009ac:	eb c4                	jmp    800972 <strtol+0x40>
  8009ae:	0f be c0             	movsbl %al,%eax
  8009b1:	83 e8 30             	sub    $0x30,%eax
  8009b4:	3b 45 10             	cmp    0x10(%ebp),%eax
  8009b7:	7d 3a                	jge    8009f3 <strtol+0xc1>
  8009b9:	83 c2 01             	add    $0x1,%edx
  8009bc:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  8009c0:	01 c1                	add    %eax,%ecx
  8009c2:	0f b6 02             	movzbl (%edx),%eax
  8009c5:	8d 70 d0             	lea    -0x30(%eax),%esi
  8009c8:	89 f3                	mov    %esi,%ebx
  8009ca:	80 fb 09             	cmp    $0x9,%bl
  8009cd:	76 df                	jbe    8009ae <strtol+0x7c>
  8009cf:	8d 70 9f             	lea    -0x61(%eax),%esi
  8009d2:	89 f3                	mov    %esi,%ebx
  8009d4:	80 fb 19             	cmp    $0x19,%bl
  8009d7:	77 08                	ja     8009e1 <strtol+0xaf>
  8009d9:	0f be c0             	movsbl %al,%eax
  8009dc:	83 e8 57             	sub    $0x57,%eax
  8009df:	eb d3                	jmp    8009b4 <strtol+0x82>
  8009e1:	8d 70 bf             	lea    -0x41(%eax),%esi
  8009e4:	89 f3                	mov    %esi,%ebx
  8009e6:	80 fb 19             	cmp    $0x19,%bl
  8009e9:	77 08                	ja     8009f3 <strtol+0xc1>
  8009eb:	0f be c0             	movsbl %al,%eax
  8009ee:	83 e8 37             	sub    $0x37,%eax
  8009f1:	eb c1                	jmp    8009b4 <strtol+0x82>
  8009f3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  8009f7:	74 05                	je     8009fe <strtol+0xcc>
  8009f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  8009fc:	89 10                	mov    %edx,(%eax)
  8009fe:	89 c8                	mov    %ecx,%eax
  800a00:	f7 d8                	neg    %eax
  800a02:	85 ff                	test   %edi,%edi
  800a04:	0f 45 c8             	cmovne %eax,%ecx
  800a07:	89 c8                	mov    %ecx,%eax
  800a09:	5b                   	pop    %ebx
  800a0a:	5e                   	pop    %esi
  800a0b:	5f                   	pop    %edi
  800a0c:	5d                   	pop    %ebp
  800a0d:	c3                   	ret

00800a0e <syscall>:
  800a0e:	55                   	push   %ebp
  800a0f:	89 e5                	mov    %esp,%ebp
  800a11:	57                   	push   %edi
  800a12:	56                   	push   %esi
  800a13:	53                   	push   %ebx
  800a14:	83 ec 1c             	sub    $0x1c,%esp
  800a17:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a1a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a1d:	89 ca                	mov    %ecx,%edx
  800a1f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a22:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a25:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a28:	8b 75 14             	mov    0x14(%ebp),%esi
  800a2b:	cd 30                	int    $0x30
  800a2d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800a31:	74 04                	je     800a37 <syscall+0x29>
  800a33:	85 c0                	test   %eax,%eax
  800a35:	7f 08                	jg     800a3f <syscall+0x31>
  800a37:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800a3a:	5b                   	pop    %ebx
  800a3b:	5e                   	pop    %esi
  800a3c:	5f                   	pop    %edi
  800a3d:	5d                   	pop    %ebp
  800a3e:	c3                   	ret
  800a3f:	83 ec 0c             	sub    $0xc,%esp
  800a42:	50                   	push   %eax
  800a43:	ff 75 e0             	push   -0x20(%ebp)
  800a46:	68 a9 10 80 00       	push   $0x8010a9
  800a4b:	6a 1e                	push   $0x1e
  800a4d:	68 c6 10 80 00       	push   $0x8010c6
  800a52:	e8 b2 02 00 00       	call   800d09 <_panic>

00800a57 <sys_cputs>:
  800a57:	55                   	push   %ebp
  800a58:	89 e5                	mov    %esp,%ebp
  800a5a:	83 ec 08             	sub    $0x8,%esp
  800a5d:	6a 00                	push   $0x0
  800a5f:	6a 00                	push   $0x0
  800a61:	6a 00                	push   $0x0
  800a63:	ff 75 0c             	push   0xc(%ebp)
  800a66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a69:	ba 00 00 00 00       	mov    $0x0,%edx
  800a6e:	b8 00 00 00 00       	mov    $0x0,%eax
  800a73:	e8 96 ff ff ff       	call   800a0e <syscall>
  800a78:	83 c4 10             	add    $0x10,%esp
  800a7b:	c9                   	leave
  800a7c:	c3                   	ret

00800a7d <sys_cgetc>:
  800a7d:	55                   	push   %ebp
  800a7e:	89 e5                	mov    %esp,%ebp
  800a80:	83 ec 08             	sub    $0x8,%esp
  800a83:	6a 00                	push   $0x0
  800a85:	6a 00                	push   $0x0
  800a87:	6a 00                	push   $0x0
  800a89:	6a 00                	push   $0x0
  800a8b:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a90:	ba 00 00 00 00       	mov    $0x0,%edx
  800a95:	b8 01 00 00 00       	mov    $0x1,%eax
  800a9a:	e8 6f ff ff ff       	call   800a0e <syscall>
  800a9f:	c9                   	leave
  800aa0:	c3                   	ret

00800aa1 <sys_env_destroy>:
  800aa1:	55                   	push   %ebp
  800aa2:	89 e5                	mov    %esp,%ebp
  800aa4:	83 ec 08             	sub    $0x8,%esp
  800aa7:	6a 00                	push   $0x0
  800aa9:	6a 00                	push   $0x0
  800aab:	6a 00                	push   $0x0
  800aad:	6a 00                	push   $0x0
  800aaf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ab2:	ba 01 00 00 00       	mov    $0x1,%edx
  800ab7:	b8 03 00 00 00       	mov    $0x3,%eax
  800abc:	e8 4d ff ff ff       	call   800a0e <syscall>
  800ac1:	c9                   	leave
  800ac2:	c3                   	ret

00800ac3 <sys_getenvid>:
  800ac3:	55                   	push   %ebp
  800ac4:	89 e5                	mov    %esp,%ebp
  800ac6:	83 ec 08             	sub    $0x8,%esp
  800ac9:	6a 00                	push   $0x0
  800acb:	6a 00                	push   $0x0
  800acd:	6a 00                	push   $0x0
  800acf:	6a 00                	push   $0x0
  800ad1:	b9 00 00 00 00       	mov    $0x0,%ecx
  800ad6:	ba 00 00 00 00       	mov    $0x0,%edx
  800adb:	b8 02 00 00 00       	mov    $0x2,%eax
  800ae0:	e8 29 ff ff ff       	call   800a0e <syscall>
  800ae5:	c9                   	leave
  800ae6:	c3                   	ret

00800ae7 <sys_yield>:
  800ae7:	55                   	push   %ebp
  800ae8:	89 e5                	mov    %esp,%ebp
  800aea:	83 ec 08             	sub    $0x8,%esp
  800aed:	6a 00                	push   $0x0
  800aef:	6a 00                	push   $0x0
  800af1:	6a 00                	push   $0x0
  800af3:	6a 00                	push   $0x0
  800af5:	b9 00 00 00 00       	mov    $0x0,%ecx
  800afa:	ba 00 00 00 00       	mov    $0x0,%edx
  800aff:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b04:	e8 05 ff ff ff       	call   800a0e <syscall>
  800b09:	83 c4 10             	add    $0x10,%esp
  800b0c:	c9                   	leave
  800b0d:	c3                   	ret

00800b0e <sys_page_alloc>:
  800b0e:	55                   	push   %ebp
  800b0f:	89 e5                	mov    %esp,%ebp
  800b11:	83 ec 08             	sub    $0x8,%esp
  800b14:	6a 00                	push   $0x0
  800b16:	6a 00                	push   $0x0
  800b18:	ff 75 10             	push   0x10(%ebp)
  800b1b:	ff 75 0c             	push   0xc(%ebp)
  800b1e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b21:	ba 01 00 00 00       	mov    $0x1,%edx
  800b26:	b8 04 00 00 00       	mov    $0x4,%eax
  800b2b:	e8 de fe ff ff       	call   800a0e <syscall>
  800b30:	c9                   	leave
  800b31:	c3                   	ret

00800b32 <sys_page_map>:
  800b32:	55                   	push   %ebp
  800b33:	89 e5                	mov    %esp,%ebp
  800b35:	83 ec 08             	sub    $0x8,%esp
  800b38:	ff 75 18             	push   0x18(%ebp)
  800b3b:	ff 75 14             	push   0x14(%ebp)
  800b3e:	ff 75 10             	push   0x10(%ebp)
  800b41:	ff 75 0c             	push   0xc(%ebp)
  800b44:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b47:	ba 01 00 00 00       	mov    $0x1,%edx
  800b4c:	b8 05 00 00 00       	mov    $0x5,%eax
  800b51:	e8 b8 fe ff ff       	call   800a0e <syscall>
  800b56:	c9                   	leave
  800b57:	c3                   	ret

00800b58 <sys_page_unmap>:
  800b58:	55                   	push   %ebp
  800b59:	89 e5                	mov    %esp,%ebp
  800b5b:	83 ec 08             	sub    $0x8,%esp
  800b5e:	6a 00                	push   $0x0
  800b60:	6a 00                	push   $0x0
  800b62:	6a 00                	push   $0x0
  800b64:	ff 75 0c             	push   0xc(%ebp)
  800b67:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b6a:	ba 01 00 00 00       	mov    $0x1,%edx
  800b6f:	b8 06 00 00 00       	mov    $0x6,%eax
  800b74:	e8 95 fe ff ff       	call   800a0e <syscall>
  800b79:	c9                   	leave
  800b7a:	c3                   	ret

00800b7b <sys_env_set_status>:
  800b7b:	55                   	push   %ebp
  800b7c:	89 e5                	mov    %esp,%ebp
  800b7e:	83 ec 08             	sub    $0x8,%esp
  800b81:	6a 00                	push   $0x0
  800b83:	6a 00                	push   $0x0
  800b85:	6a 00                	push   $0x0
  800b87:	ff 75 0c             	push   0xc(%ebp)
  800b8a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b8d:	ba 01 00 00 00       	mov    $0x1,%edx
  800b92:	b8 08 00 00 00       	mov    $0x8,%eax
  800b97:	e8 72 fe ff ff       	call   800a0e <syscall>
  800b9c:	c9                   	leave
  800b9d:	c3                   	ret

00800b9e <sys_env_set_pgfault_upcall>:
  800b9e:	55                   	push   %ebp
  800b9f:	89 e5                	mov    %esp,%ebp
  800ba1:	83 ec 08             	sub    $0x8,%esp
  800ba4:	6a 00                	push   $0x0
  800ba6:	6a 00                	push   $0x0
  800ba8:	6a 00                	push   $0x0
  800baa:	ff 75 0c             	push   0xc(%ebp)
  800bad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bb0:	ba 01 00 00 00       	mov    $0x1,%edx
  800bb5:	b8 09 00 00 00       	mov    $0x9,%eax
  800bba:	e8 4f fe ff ff       	call   800a0e <syscall>
  800bbf:	c9                   	leave
  800bc0:	c3                   	ret

00800bc1 <sys_ipc_try_send>:
  800bc1:	55                   	push   %ebp
  800bc2:	89 e5                	mov    %esp,%ebp
  800bc4:	83 ec 08             	sub    $0x8,%esp
  800bc7:	6a 00                	push   $0x0
  800bc9:	ff 75 14             	push   0x14(%ebp)
  800bcc:	ff 75 10             	push   0x10(%ebp)
  800bcf:	ff 75 0c             	push   0xc(%ebp)
  800bd2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bd5:	ba 00 00 00 00       	mov    $0x0,%edx
  800bda:	b8 0c 00 00 00       	mov    $0xc,%eax
  800bdf:	e8 2a fe ff ff       	call   800a0e <syscall>
  800be4:	c9                   	leave
  800be5:	c3                   	ret

00800be6 <sys_ipc_recv>:
  800be6:	55                   	push   %ebp
  800be7:	89 e5                	mov    %esp,%ebp
  800be9:	83 ec 08             	sub    $0x8,%esp
  800bec:	6a 00                	push   $0x0
  800bee:	6a 00                	push   $0x0
  800bf0:	6a 00                	push   $0x0
  800bf2:	6a 00                	push   $0x0
  800bf4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bf7:	ba 01 00 00 00       	mov    $0x1,%edx
  800bfc:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c01:	e8 08 fe ff ff       	call   800a0e <syscall>
  800c06:	c9                   	leave
  800c07:	c3                   	ret

00800c08 <ipc_recv>:
  800c08:	55                   	push   %ebp
  800c09:	89 e5                	mov    %esp,%ebp
  800c0b:	56                   	push   %esi
  800c0c:	53                   	push   %ebx
  800c0d:	8b 75 08             	mov    0x8(%ebp),%esi
  800c10:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800c13:	83 ec 0c             	sub    $0xc,%esp
  800c16:	ff 75 0c             	push   0xc(%ebp)
  800c19:	e8 c8 ff ff ff       	call   800be6 <sys_ipc_recv>
  800c1e:	83 c4 10             	add    $0x10,%esp
  800c21:	85 f6                	test   %esi,%esi
  800c23:	74 14                	je     800c39 <ipc_recv+0x31>
  800c25:	ba 00 00 00 00       	mov    $0x0,%edx
  800c2a:	85 c0                	test   %eax,%eax
  800c2c:	75 09                	jne    800c37 <ipc_recv+0x2f>
  800c2e:	8b 15 04 20 80 00    	mov    0x802004,%edx
  800c34:	8b 52 74             	mov    0x74(%edx),%edx
  800c37:	89 16                	mov    %edx,(%esi)
  800c39:	85 db                	test   %ebx,%ebx
  800c3b:	74 25                	je     800c62 <ipc_recv+0x5a>
  800c3d:	85 c0                	test   %eax,%eax
  800c3f:	74 0d                	je     800c4e <ipc_recv+0x46>
  800c41:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800c47:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800c4a:	5b                   	pop    %ebx
  800c4b:	5e                   	pop    %esi
  800c4c:	5d                   	pop    %ebp
  800c4d:	c3                   	ret
  800c4e:	a1 04 20 80 00       	mov    0x802004,%eax
  800c53:	8b 40 78             	mov    0x78(%eax),%eax
  800c56:	89 03                	mov    %eax,(%ebx)
  800c58:	a1 04 20 80 00       	mov    0x802004,%eax
  800c5d:	8b 40 70             	mov    0x70(%eax),%eax
  800c60:	eb e5                	jmp    800c47 <ipc_recv+0x3f>
  800c62:	85 c0                	test   %eax,%eax
  800c64:	75 e1                	jne    800c47 <ipc_recv+0x3f>
  800c66:	eb f0                	jmp    800c58 <ipc_recv+0x50>

00800c68 <ipc_send>:
  800c68:	55                   	push   %ebp
  800c69:	89 e5                	mov    %esp,%ebp
  800c6b:	57                   	push   %edi
  800c6c:	56                   	push   %esi
  800c6d:	53                   	push   %ebx
  800c6e:	83 ec 0c             	sub    $0xc,%esp
  800c71:	8b 75 0c             	mov    0xc(%ebp),%esi
  800c74:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800c77:	8b 7d 14             	mov    0x14(%ebp),%edi
  800c7a:	85 db                	test   %ebx,%ebx
  800c7c:	b8 00 00 c0 ee       	mov    $0xeec00000,%eax
  800c81:	0f 44 d8             	cmove  %eax,%ebx
  800c84:	57                   	push   %edi
  800c85:	53                   	push   %ebx
  800c86:	56                   	push   %esi
  800c87:	ff 75 08             	push   0x8(%ebp)
  800c8a:	e8 32 ff ff ff       	call   800bc1 <sys_ipc_try_send>
  800c8f:	83 c4 10             	add    $0x10,%esp
  800c92:	eb 13                	jmp    800ca7 <ipc_send+0x3f>
  800c94:	e8 4e fe ff ff       	call   800ae7 <sys_yield>
  800c99:	57                   	push   %edi
  800c9a:	53                   	push   %ebx
  800c9b:	56                   	push   %esi
  800c9c:	ff 75 08             	push   0x8(%ebp)
  800c9f:	e8 1d ff ff ff       	call   800bc1 <sys_ipc_try_send>
  800ca4:	83 c4 10             	add    $0x10,%esp
  800ca7:	83 f8 f9             	cmp    $0xfffffff9,%eax
  800caa:	74 e8                	je     800c94 <ipc_send+0x2c>
  800cac:	85 c0                	test   %eax,%eax
  800cae:	78 08                	js     800cb8 <ipc_send+0x50>
  800cb0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800cb3:	5b                   	pop    %ebx
  800cb4:	5e                   	pop    %esi
  800cb5:	5f                   	pop    %edi
  800cb6:	5d                   	pop    %ebp
  800cb7:	c3                   	ret
  800cb8:	50                   	push   %eax
  800cb9:	68 d4 10 80 00       	push   $0x8010d4
  800cbe:	6a 3b                	push   $0x3b
  800cc0:	68 e1 10 80 00       	push   $0x8010e1
  800cc5:	e8 3f 00 00 00       	call   800d09 <_panic>

00800cca <ipc_find_env>:
  800cca:	55                   	push   %ebp
  800ccb:	89 e5                	mov    %esp,%ebp
  800ccd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800cd0:	b8 00 00 00 00       	mov    $0x0,%eax
  800cd5:	69 d0 84 00 00 00    	imul   $0x84,%eax,%edx
  800cdb:	81 c2 00 00 c0 ee    	add    $0xeec00000,%edx
  800ce1:	8b 52 50             	mov    0x50(%edx),%edx
  800ce4:	39 ca                	cmp    %ecx,%edx
  800ce6:	74 11                	je     800cf9 <ipc_find_env+0x2f>
  800ce8:	83 c0 01             	add    $0x1,%eax
  800ceb:	3d 00 04 00 00       	cmp    $0x400,%eax
  800cf0:	75 e3                	jne    800cd5 <ipc_find_env+0xb>
  800cf2:	b8 00 00 00 00       	mov    $0x0,%eax
  800cf7:	eb 0e                	jmp    800d07 <ipc_find_env+0x3d>
  800cf9:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800cff:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800d04:	8b 40 48             	mov    0x48(%eax),%eax
  800d07:	5d                   	pop    %ebp
  800d08:	c3                   	ret

00800d09 <_panic>:
  800d09:	55                   	push   %ebp
  800d0a:	89 e5                	mov    %esp,%ebp
  800d0c:	56                   	push   %esi
  800d0d:	53                   	push   %ebx
  800d0e:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800d11:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800d17:	e8 a7 fd ff ff       	call   800ac3 <sys_getenvid>
  800d1c:	83 ec 0c             	sub    $0xc,%esp
  800d1f:	ff 75 0c             	push   0xc(%ebp)
  800d22:	ff 75 08             	push   0x8(%ebp)
  800d25:	56                   	push   %esi
  800d26:	50                   	push   %eax
  800d27:	68 84 12 80 00       	push   $0x801284
  800d2c:	e8 64 f4 ff ff       	call   800195 <cprintf>
  800d31:	83 c4 18             	add    $0x18,%esp
  800d34:	53                   	push   %ebx
  800d35:	ff 75 10             	push   0x10(%ebp)
  800d38:	e8 07 f4 ff ff       	call   800144 <vcprintf>
  800d3d:	c7 04 24 cf 0f 80 00 	movl   $0x800fcf,(%esp)
  800d44:	e8 4c f4 ff ff       	call   800195 <cprintf>
  800d49:	83 c4 10             	add    $0x10,%esp
  800d4c:	cc                   	int3
  800d4d:	eb fd                	jmp    800d4c <_panic+0x43>
  800d4f:	90                   	nop

00800d50 <__udivdi3>:
  800d50:	f3 0f 1e fb          	endbr32
  800d54:	55                   	push   %ebp
  800d55:	57                   	push   %edi
  800d56:	56                   	push   %esi
  800d57:	53                   	push   %ebx
  800d58:	83 ec 1c             	sub    $0x1c,%esp
  800d5b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d5f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800d63:	8b 74 24 34          	mov    0x34(%esp),%esi
  800d67:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800d6b:	85 c0                	test   %eax,%eax
  800d6d:	75 19                	jne    800d88 <__udivdi3+0x38>
  800d6f:	39 de                	cmp    %ebx,%esi
  800d71:	73 4d                	jae    800dc0 <__udivdi3+0x70>
  800d73:	31 ff                	xor    %edi,%edi
  800d75:	89 e8                	mov    %ebp,%eax
  800d77:	89 f2                	mov    %esi,%edx
  800d79:	f7 f3                	div    %ebx
  800d7b:	89 fa                	mov    %edi,%edx
  800d7d:	83 c4 1c             	add    $0x1c,%esp
  800d80:	5b                   	pop    %ebx
  800d81:	5e                   	pop    %esi
  800d82:	5f                   	pop    %edi
  800d83:	5d                   	pop    %ebp
  800d84:	c3                   	ret
  800d85:	8d 76 00             	lea    0x0(%esi),%esi
  800d88:	39 c6                	cmp    %eax,%esi
  800d8a:	73 14                	jae    800da0 <__udivdi3+0x50>
  800d8c:	31 ff                	xor    %edi,%edi
  800d8e:	31 c0                	xor    %eax,%eax
  800d90:	89 fa                	mov    %edi,%edx
  800d92:	83 c4 1c             	add    $0x1c,%esp
  800d95:	5b                   	pop    %ebx
  800d96:	5e                   	pop    %esi
  800d97:	5f                   	pop    %edi
  800d98:	5d                   	pop    %ebp
  800d99:	c3                   	ret
  800d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800da0:	0f bd f8             	bsr    %eax,%edi
  800da3:	83 f7 1f             	xor    $0x1f,%edi
  800da6:	75 48                	jne    800df0 <__udivdi3+0xa0>
  800da8:	39 f0                	cmp    %esi,%eax
  800daa:	72 06                	jb     800db2 <__udivdi3+0x62>
  800dac:	31 c0                	xor    %eax,%eax
  800dae:	39 dd                	cmp    %ebx,%ebp
  800db0:	72 de                	jb     800d90 <__udivdi3+0x40>
  800db2:	b8 01 00 00 00       	mov    $0x1,%eax
  800db7:	eb d7                	jmp    800d90 <__udivdi3+0x40>
  800db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800dc0:	89 d9                	mov    %ebx,%ecx
  800dc2:	85 db                	test   %ebx,%ebx
  800dc4:	75 0b                	jne    800dd1 <__udivdi3+0x81>
  800dc6:	b8 01 00 00 00       	mov    $0x1,%eax
  800dcb:	31 d2                	xor    %edx,%edx
  800dcd:	f7 f3                	div    %ebx
  800dcf:	89 c1                	mov    %eax,%ecx
  800dd1:	31 d2                	xor    %edx,%edx
  800dd3:	89 f0                	mov    %esi,%eax
  800dd5:	f7 f1                	div    %ecx
  800dd7:	89 c6                	mov    %eax,%esi
  800dd9:	89 e8                	mov    %ebp,%eax
  800ddb:	89 f7                	mov    %esi,%edi
  800ddd:	f7 f1                	div    %ecx
  800ddf:	89 fa                	mov    %edi,%edx
  800de1:	83 c4 1c             	add    $0x1c,%esp
  800de4:	5b                   	pop    %ebx
  800de5:	5e                   	pop    %esi
  800de6:	5f                   	pop    %edi
  800de7:	5d                   	pop    %ebp
  800de8:	c3                   	ret
  800de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800df0:	89 f9                	mov    %edi,%ecx
  800df2:	ba 20 00 00 00       	mov    $0x20,%edx
  800df7:	29 fa                	sub    %edi,%edx
  800df9:	d3 e0                	shl    %cl,%eax
  800dfb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800dff:	89 d1                	mov    %edx,%ecx
  800e01:	89 d8                	mov    %ebx,%eax
  800e03:	d3 e8                	shr    %cl,%eax
  800e05:	89 c1                	mov    %eax,%ecx
  800e07:	8b 44 24 08          	mov    0x8(%esp),%eax
  800e0b:	09 c1                	or     %eax,%ecx
  800e0d:	89 f0                	mov    %esi,%eax
  800e0f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800e13:	89 f9                	mov    %edi,%ecx
  800e15:	d3 e3                	shl    %cl,%ebx
  800e17:	89 d1                	mov    %edx,%ecx
  800e19:	d3 e8                	shr    %cl,%eax
  800e1b:	89 f9                	mov    %edi,%ecx
  800e1d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800e21:	89 eb                	mov    %ebp,%ebx
  800e23:	d3 e6                	shl    %cl,%esi
  800e25:	89 d1                	mov    %edx,%ecx
  800e27:	d3 eb                	shr    %cl,%ebx
  800e29:	09 f3                	or     %esi,%ebx
  800e2b:	89 c6                	mov    %eax,%esi
  800e2d:	89 f2                	mov    %esi,%edx
  800e2f:	89 d8                	mov    %ebx,%eax
  800e31:	f7 74 24 08          	divl   0x8(%esp)
  800e35:	89 d6                	mov    %edx,%esi
  800e37:	89 c3                	mov    %eax,%ebx
  800e39:	f7 64 24 0c          	mull   0xc(%esp)
  800e3d:	39 d6                	cmp    %edx,%esi
  800e3f:	72 1f                	jb     800e60 <__udivdi3+0x110>
  800e41:	89 f9                	mov    %edi,%ecx
  800e43:	d3 e5                	shl    %cl,%ebp
  800e45:	39 c5                	cmp    %eax,%ebp
  800e47:	73 04                	jae    800e4d <__udivdi3+0xfd>
  800e49:	39 d6                	cmp    %edx,%esi
  800e4b:	74 13                	je     800e60 <__udivdi3+0x110>
  800e4d:	89 d8                	mov    %ebx,%eax
  800e4f:	31 ff                	xor    %edi,%edi
  800e51:	e9 3a ff ff ff       	jmp    800d90 <__udivdi3+0x40>
  800e56:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800e5d:	00 
  800e5e:	66 90                	xchg   %ax,%ax
  800e60:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800e63:	31 ff                	xor    %edi,%edi
  800e65:	e9 26 ff ff ff       	jmp    800d90 <__udivdi3+0x40>
  800e6a:	66 90                	xchg   %ax,%ax
  800e6c:	66 90                	xchg   %ax,%ax
  800e6e:	66 90                	xchg   %ax,%ax

00800e70 <__umoddi3>:
  800e70:	f3 0f 1e fb          	endbr32
  800e74:	55                   	push   %ebp
  800e75:	57                   	push   %edi
  800e76:	56                   	push   %esi
  800e77:	53                   	push   %ebx
  800e78:	83 ec 1c             	sub    $0x1c,%esp
  800e7b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800e7f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800e83:	8b 74 24 30          	mov    0x30(%esp),%esi
  800e87:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800e8b:	89 da                	mov    %ebx,%edx
  800e8d:	85 c0                	test   %eax,%eax
  800e8f:	75 17                	jne    800ea8 <__umoddi3+0x38>
  800e91:	39 fb                	cmp    %edi,%ebx
  800e93:	73 53                	jae    800ee8 <__umoddi3+0x78>
  800e95:	89 f0                	mov    %esi,%eax
  800e97:	f7 f7                	div    %edi
  800e99:	89 d0                	mov    %edx,%eax
  800e9b:	31 d2                	xor    %edx,%edx
  800e9d:	83 c4 1c             	add    $0x1c,%esp
  800ea0:	5b                   	pop    %ebx
  800ea1:	5e                   	pop    %esi
  800ea2:	5f                   	pop    %edi
  800ea3:	5d                   	pop    %ebp
  800ea4:	c3                   	ret
  800ea5:	8d 76 00             	lea    0x0(%esi),%esi
  800ea8:	89 f1                	mov    %esi,%ecx
  800eaa:	39 c3                	cmp    %eax,%ebx
  800eac:	73 12                	jae    800ec0 <__umoddi3+0x50>
  800eae:	89 f0                	mov    %esi,%eax
  800eb0:	83 c4 1c             	add    $0x1c,%esp
  800eb3:	5b                   	pop    %ebx
  800eb4:	5e                   	pop    %esi
  800eb5:	5f                   	pop    %edi
  800eb6:	5d                   	pop    %ebp
  800eb7:	c3                   	ret
  800eb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800ebf:	00 
  800ec0:	0f bd e8             	bsr    %eax,%ebp
  800ec3:	83 f5 1f             	xor    $0x1f,%ebp
  800ec6:	75 48                	jne    800f10 <__umoddi3+0xa0>
  800ec8:	39 d8                	cmp    %ebx,%eax
  800eca:	0f 82 d0 00 00 00    	jb     800fa0 <__umoddi3+0x130>
  800ed0:	39 fe                	cmp    %edi,%esi
  800ed2:	0f 83 c8 00 00 00    	jae    800fa0 <__umoddi3+0x130>
  800ed8:	89 c8                	mov    %ecx,%eax
  800eda:	83 c4 1c             	add    $0x1c,%esp
  800edd:	5b                   	pop    %ebx
  800ede:	5e                   	pop    %esi
  800edf:	5f                   	pop    %edi
  800ee0:	5d                   	pop    %ebp
  800ee1:	c3                   	ret
  800ee2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800ee8:	89 f9                	mov    %edi,%ecx
  800eea:	85 ff                	test   %edi,%edi
  800eec:	75 0b                	jne    800ef9 <__umoddi3+0x89>
  800eee:	b8 01 00 00 00       	mov    $0x1,%eax
  800ef3:	31 d2                	xor    %edx,%edx
  800ef5:	f7 f7                	div    %edi
  800ef7:	89 c1                	mov    %eax,%ecx
  800ef9:	89 d8                	mov    %ebx,%eax
  800efb:	31 d2                	xor    %edx,%edx
  800efd:	f7 f1                	div    %ecx
  800eff:	89 f0                	mov    %esi,%eax
  800f01:	f7 f1                	div    %ecx
  800f03:	89 d0                	mov    %edx,%eax
  800f05:	31 d2                	xor    %edx,%edx
  800f07:	eb 94                	jmp    800e9d <__umoddi3+0x2d>
  800f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800f10:	89 e9                	mov    %ebp,%ecx
  800f12:	ba 20 00 00 00       	mov    $0x20,%edx
  800f17:	29 ea                	sub    %ebp,%edx
  800f19:	d3 e0                	shl    %cl,%eax
  800f1b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800f1f:	89 d1                	mov    %edx,%ecx
  800f21:	89 f8                	mov    %edi,%eax
  800f23:	d3 e8                	shr    %cl,%eax
  800f25:	89 54 24 04          	mov    %edx,0x4(%esp)
  800f29:	8b 54 24 04          	mov    0x4(%esp),%edx
  800f2d:	89 c1                	mov    %eax,%ecx
  800f2f:	8b 44 24 08          	mov    0x8(%esp),%eax
  800f33:	09 c1                	or     %eax,%ecx
  800f35:	89 d8                	mov    %ebx,%eax
  800f37:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800f3b:	89 e9                	mov    %ebp,%ecx
  800f3d:	d3 e7                	shl    %cl,%edi
  800f3f:	89 d1                	mov    %edx,%ecx
  800f41:	d3 e8                	shr    %cl,%eax
  800f43:	89 e9                	mov    %ebp,%ecx
  800f45:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800f49:	d3 e3                	shl    %cl,%ebx
  800f4b:	89 c7                	mov    %eax,%edi
  800f4d:	89 d1                	mov    %edx,%ecx
  800f4f:	89 f0                	mov    %esi,%eax
  800f51:	d3 e8                	shr    %cl,%eax
  800f53:	89 fa                	mov    %edi,%edx
  800f55:	89 e9                	mov    %ebp,%ecx
  800f57:	09 d8                	or     %ebx,%eax
  800f59:	d3 e6                	shl    %cl,%esi
  800f5b:	f7 74 24 08          	divl   0x8(%esp)
  800f5f:	89 d3                	mov    %edx,%ebx
  800f61:	f7 64 24 0c          	mull   0xc(%esp)
  800f65:	89 c7                	mov    %eax,%edi
  800f67:	89 d1                	mov    %edx,%ecx
  800f69:	39 d3                	cmp    %edx,%ebx
  800f6b:	72 06                	jb     800f73 <__umoddi3+0x103>
  800f6d:	75 10                	jne    800f7f <__umoddi3+0x10f>
  800f6f:	39 c6                	cmp    %eax,%esi
  800f71:	73 0c                	jae    800f7f <__umoddi3+0x10f>
  800f73:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800f77:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800f7b:	89 d1                	mov    %edx,%ecx
  800f7d:	89 c7                	mov    %eax,%edi
  800f7f:	89 f2                	mov    %esi,%edx
  800f81:	29 fa                	sub    %edi,%edx
  800f83:	19 cb                	sbb    %ecx,%ebx
  800f85:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800f8a:	89 d8                	mov    %ebx,%eax
  800f8c:	d3 e0                	shl    %cl,%eax
  800f8e:	89 e9                	mov    %ebp,%ecx
  800f90:	d3 ea                	shr    %cl,%edx
  800f92:	d3 eb                	shr    %cl,%ebx
  800f94:	09 d0                	or     %edx,%eax
  800f96:	89 da                	mov    %ebx,%edx
  800f98:	83 c4 1c             	add    $0x1c,%esp
  800f9b:	5b                   	pop    %ebx
  800f9c:	5e                   	pop    %esi
  800f9d:	5f                   	pop    %edi
  800f9e:	5d                   	pop    %ebp
  800f9f:	c3                   	ret
  800fa0:	89 da                	mov    %ebx,%edx
  800fa2:	89 f1                	mov    %esi,%ecx
  800fa4:	29 f9                	sub    %edi,%ecx
  800fa6:	19 c2                	sbb    %eax,%edx
  800fa8:	89 c8                	mov    %ecx,%eax
  800faa:	e9 2b ff ff ff       	jmp    800eda <__umoddi3+0x6a>
