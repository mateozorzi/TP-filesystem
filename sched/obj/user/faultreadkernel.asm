
obj/user/faultreadkernel:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 1d 00 00 00       	call   80004e <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 10             	sub    $0x10,%esp
  800039:	ff 35 00 00 10 f0    	push   0xf0100000
  80003f:	68 60 0e 80 00       	push   $0x800e60
  800044:	e8 f9 00 00 00       	call   800142 <cprintf>
  800049:	83 c4 10             	add    $0x10,%esp
  80004c:	c9                   	leave
  80004d:	c3                   	ret

0080004e <libmain>:
  80004e:	55                   	push   %ebp
  80004f:	89 e5                	mov    %esp,%ebp
  800051:	56                   	push   %esi
  800052:	53                   	push   %ebx
  800053:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800056:	8b 75 0c             	mov    0xc(%ebp),%esi
  800059:	e8 12 0a 00 00       	call   800a70 <sys_getenvid>
  80005e:	85 c0                	test   %eax,%eax
  800060:	78 15                	js     800077 <libmain+0x29>
  800062:	25 ff 03 00 00       	and    $0x3ff,%eax
  800067:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  80006d:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800072:	a3 04 20 80 00       	mov    %eax,0x802004
  800077:	85 db                	test   %ebx,%ebx
  800079:	7e 07                	jle    800082 <libmain+0x34>
  80007b:	8b 06                	mov    (%esi),%eax
  80007d:	a3 00 20 80 00       	mov    %eax,0x802000
  800082:	83 ec 08             	sub    $0x8,%esp
  800085:	56                   	push   %esi
  800086:	53                   	push   %ebx
  800087:	e8 a7 ff ff ff       	call   800033 <umain>
  80008c:	e8 0a 00 00 00       	call   80009b <exit>
  800091:	83 c4 10             	add    $0x10,%esp
  800094:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800097:	5b                   	pop    %ebx
  800098:	5e                   	pop    %esi
  800099:	5d                   	pop    %ebp
  80009a:	c3                   	ret

0080009b <exit>:
  80009b:	55                   	push   %ebp
  80009c:	89 e5                	mov    %esp,%ebp
  80009e:	83 ec 14             	sub    $0x14,%esp
  8000a1:	6a 00                	push   $0x0
  8000a3:	e8 a6 09 00 00       	call   800a4e <sys_env_destroy>
  8000a8:	83 c4 10             	add    $0x10,%esp
  8000ab:	c9                   	leave
  8000ac:	c3                   	ret

008000ad <putch>:
  8000ad:	55                   	push   %ebp
  8000ae:	89 e5                	mov    %esp,%ebp
  8000b0:	53                   	push   %ebx
  8000b1:	83 ec 04             	sub    $0x4,%esp
  8000b4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000b7:	8b 13                	mov    (%ebx),%edx
  8000b9:	8d 42 01             	lea    0x1(%edx),%eax
  8000bc:	89 03                	mov    %eax,(%ebx)
  8000be:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000c1:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8000c5:	3d ff 00 00 00       	cmp    $0xff,%eax
  8000ca:	74 09                	je     8000d5 <putch+0x28>
  8000cc:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8000d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8000d3:	c9                   	leave
  8000d4:	c3                   	ret
  8000d5:	83 ec 08             	sub    $0x8,%esp
  8000d8:	68 ff 00 00 00       	push   $0xff
  8000dd:	8d 43 08             	lea    0x8(%ebx),%eax
  8000e0:	50                   	push   %eax
  8000e1:	e8 1e 09 00 00       	call   800a04 <sys_cputs>
  8000e6:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8000ec:	83 c4 10             	add    $0x10,%esp
  8000ef:	eb db                	jmp    8000cc <putch+0x1f>

008000f1 <vcprintf>:
  8000f1:	55                   	push   %ebp
  8000f2:	89 e5                	mov    %esp,%ebp
  8000f4:	81 ec 18 01 00 00    	sub    $0x118,%esp
  8000fa:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800101:	00 00 00 
  800104:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  80010b:	00 00 00 
  80010e:	ff 75 0c             	push   0xc(%ebp)
  800111:	ff 75 08             	push   0x8(%ebp)
  800114:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80011a:	50                   	push   %eax
  80011b:	68 ad 00 80 00       	push   $0x8000ad
  800120:	e8 74 01 00 00       	call   800299 <vprintfmt>
  800125:	83 c4 08             	add    $0x8,%esp
  800128:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  80012e:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800134:	50                   	push   %eax
  800135:	e8 ca 08 00 00       	call   800a04 <sys_cputs>
  80013a:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800140:	c9                   	leave
  800141:	c3                   	ret

00800142 <cprintf>:
  800142:	55                   	push   %ebp
  800143:	89 e5                	mov    %esp,%ebp
  800145:	83 ec 10             	sub    $0x10,%esp
  800148:	8d 45 0c             	lea    0xc(%ebp),%eax
  80014b:	50                   	push   %eax
  80014c:	ff 75 08             	push   0x8(%ebp)
  80014f:	e8 9d ff ff ff       	call   8000f1 <vcprintf>
  800154:	c9                   	leave
  800155:	c3                   	ret

00800156 <printnum>:
  800156:	55                   	push   %ebp
  800157:	89 e5                	mov    %esp,%ebp
  800159:	57                   	push   %edi
  80015a:	56                   	push   %esi
  80015b:	53                   	push   %ebx
  80015c:	83 ec 1c             	sub    $0x1c,%esp
  80015f:	89 c7                	mov    %eax,%edi
  800161:	89 d6                	mov    %edx,%esi
  800163:	8b 45 08             	mov    0x8(%ebp),%eax
  800166:	8b 55 0c             	mov    0xc(%ebp),%edx
  800169:	89 d1                	mov    %edx,%ecx
  80016b:	89 c2                	mov    %eax,%edx
  80016d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800170:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800173:	8b 45 10             	mov    0x10(%ebp),%eax
  800176:	8b 5d 14             	mov    0x14(%ebp),%ebx
  800179:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80017c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800183:	39 c2                	cmp    %eax,%edx
  800185:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  800188:	72 3e                	jb     8001c8 <printnum+0x72>
  80018a:	83 ec 0c             	sub    $0xc,%esp
  80018d:	ff 75 18             	push   0x18(%ebp)
  800190:	83 eb 01             	sub    $0x1,%ebx
  800193:	53                   	push   %ebx
  800194:	50                   	push   %eax
  800195:	83 ec 08             	sub    $0x8,%esp
  800198:	ff 75 e4             	push   -0x1c(%ebp)
  80019b:	ff 75 e0             	push   -0x20(%ebp)
  80019e:	ff 75 dc             	push   -0x24(%ebp)
  8001a1:	ff 75 d8             	push   -0x28(%ebp)
  8001a4:	e8 57 0a 00 00       	call   800c00 <__udivdi3>
  8001a9:	83 c4 18             	add    $0x18,%esp
  8001ac:	52                   	push   %edx
  8001ad:	50                   	push   %eax
  8001ae:	89 f2                	mov    %esi,%edx
  8001b0:	89 f8                	mov    %edi,%eax
  8001b2:	e8 9f ff ff ff       	call   800156 <printnum>
  8001b7:	83 c4 20             	add    $0x20,%esp
  8001ba:	eb 13                	jmp    8001cf <printnum+0x79>
  8001bc:	83 ec 08             	sub    $0x8,%esp
  8001bf:	56                   	push   %esi
  8001c0:	ff 75 18             	push   0x18(%ebp)
  8001c3:	ff d7                	call   *%edi
  8001c5:	83 c4 10             	add    $0x10,%esp
  8001c8:	83 eb 01             	sub    $0x1,%ebx
  8001cb:	85 db                	test   %ebx,%ebx
  8001cd:	7f ed                	jg     8001bc <printnum+0x66>
  8001cf:	83 ec 08             	sub    $0x8,%esp
  8001d2:	56                   	push   %esi
  8001d3:	83 ec 04             	sub    $0x4,%esp
  8001d6:	ff 75 e4             	push   -0x1c(%ebp)
  8001d9:	ff 75 e0             	push   -0x20(%ebp)
  8001dc:	ff 75 dc             	push   -0x24(%ebp)
  8001df:	ff 75 d8             	push   -0x28(%ebp)
  8001e2:	e8 39 0b 00 00       	call   800d20 <__umoddi3>
  8001e7:	83 c4 14             	add    $0x14,%esp
  8001ea:	0f be 80 b5 0e 80 00 	movsbl 0x800eb5(%eax),%eax
  8001f1:	50                   	push   %eax
  8001f2:	ff d7                	call   *%edi
  8001f4:	83 c4 10             	add    $0x10,%esp
  8001f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8001fa:	5b                   	pop    %ebx
  8001fb:	5e                   	pop    %esi
  8001fc:	5f                   	pop    %edi
  8001fd:	5d                   	pop    %ebp
  8001fe:	c3                   	ret

008001ff <getuint>:
  8001ff:	83 fa 01             	cmp    $0x1,%edx
  800202:	7f 13                	jg     800217 <getuint+0x18>
  800204:	85 d2                	test   %edx,%edx
  800206:	74 1c                	je     800224 <getuint+0x25>
  800208:	8b 10                	mov    (%eax),%edx
  80020a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80020d:	89 08                	mov    %ecx,(%eax)
  80020f:	8b 02                	mov    (%edx),%eax
  800211:	ba 00 00 00 00       	mov    $0x0,%edx
  800216:	c3                   	ret
  800217:	8b 10                	mov    (%eax),%edx
  800219:	8d 4a 08             	lea    0x8(%edx),%ecx
  80021c:	89 08                	mov    %ecx,(%eax)
  80021e:	8b 02                	mov    (%edx),%eax
  800220:	8b 52 04             	mov    0x4(%edx),%edx
  800223:	c3                   	ret
  800224:	8b 10                	mov    (%eax),%edx
  800226:	8d 4a 04             	lea    0x4(%edx),%ecx
  800229:	89 08                	mov    %ecx,(%eax)
  80022b:	8b 02                	mov    (%edx),%eax
  80022d:	ba 00 00 00 00       	mov    $0x0,%edx
  800232:	c3                   	ret

00800233 <getint>:
  800233:	83 fa 01             	cmp    $0x1,%edx
  800236:	7f 0f                	jg     800247 <getint+0x14>
  800238:	85 d2                	test   %edx,%edx
  80023a:	74 18                	je     800254 <getint+0x21>
  80023c:	8b 10                	mov    (%eax),%edx
  80023e:	8d 4a 04             	lea    0x4(%edx),%ecx
  800241:	89 08                	mov    %ecx,(%eax)
  800243:	8b 02                	mov    (%edx),%eax
  800245:	99                   	cltd
  800246:	c3                   	ret
  800247:	8b 10                	mov    (%eax),%edx
  800249:	8d 4a 08             	lea    0x8(%edx),%ecx
  80024c:	89 08                	mov    %ecx,(%eax)
  80024e:	8b 02                	mov    (%edx),%eax
  800250:	8b 52 04             	mov    0x4(%edx),%edx
  800253:	c3                   	ret
  800254:	8b 10                	mov    (%eax),%edx
  800256:	8d 4a 04             	lea    0x4(%edx),%ecx
  800259:	89 08                	mov    %ecx,(%eax)
  80025b:	8b 02                	mov    (%edx),%eax
  80025d:	99                   	cltd
  80025e:	c3                   	ret

0080025f <sprintputch>:
  80025f:	55                   	push   %ebp
  800260:	89 e5                	mov    %esp,%ebp
  800262:	8b 45 0c             	mov    0xc(%ebp),%eax
  800265:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800269:	8b 10                	mov    (%eax),%edx
  80026b:	3b 50 04             	cmp    0x4(%eax),%edx
  80026e:	73 0a                	jae    80027a <sprintputch+0x1b>
  800270:	8d 4a 01             	lea    0x1(%edx),%ecx
  800273:	89 08                	mov    %ecx,(%eax)
  800275:	8b 45 08             	mov    0x8(%ebp),%eax
  800278:	88 02                	mov    %al,(%edx)
  80027a:	5d                   	pop    %ebp
  80027b:	c3                   	ret

0080027c <printfmt>:
  80027c:	55                   	push   %ebp
  80027d:	89 e5                	mov    %esp,%ebp
  80027f:	83 ec 08             	sub    $0x8,%esp
  800282:	8d 45 14             	lea    0x14(%ebp),%eax
  800285:	50                   	push   %eax
  800286:	ff 75 10             	push   0x10(%ebp)
  800289:	ff 75 0c             	push   0xc(%ebp)
  80028c:	ff 75 08             	push   0x8(%ebp)
  80028f:	e8 05 00 00 00       	call   800299 <vprintfmt>
  800294:	83 c4 10             	add    $0x10,%esp
  800297:	c9                   	leave
  800298:	c3                   	ret

00800299 <vprintfmt>:
  800299:	55                   	push   %ebp
  80029a:	89 e5                	mov    %esp,%ebp
  80029c:	57                   	push   %edi
  80029d:	56                   	push   %esi
  80029e:	53                   	push   %ebx
  80029f:	83 ec 2c             	sub    $0x2c,%esp
  8002a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8002a5:	8b 75 0c             	mov    0xc(%ebp),%esi
  8002a8:	8b 7d 10             	mov    0x10(%ebp),%edi
  8002ab:	eb 0a                	jmp    8002b7 <vprintfmt+0x1e>
  8002ad:	83 ec 08             	sub    $0x8,%esp
  8002b0:	56                   	push   %esi
  8002b1:	50                   	push   %eax
  8002b2:	ff d3                	call   *%ebx
  8002b4:	83 c4 10             	add    $0x10,%esp
  8002b7:	83 c7 01             	add    $0x1,%edi
  8002ba:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8002be:	83 f8 25             	cmp    $0x25,%eax
  8002c1:	74 0c                	je     8002cf <vprintfmt+0x36>
  8002c3:	85 c0                	test   %eax,%eax
  8002c5:	75 e6                	jne    8002ad <vprintfmt+0x14>
  8002c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002ca:	5b                   	pop    %ebx
  8002cb:	5e                   	pop    %esi
  8002cc:	5f                   	pop    %edi
  8002cd:	5d                   	pop    %ebp
  8002ce:	c3                   	ret
  8002cf:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8002d3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  8002da:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8002e1:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  8002e8:	b9 00 00 00 00       	mov    $0x0,%ecx
  8002ed:	8d 47 01             	lea    0x1(%edi),%eax
  8002f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8002f3:	0f b6 17             	movzbl (%edi),%edx
  8002f6:	8d 42 dd             	lea    -0x23(%edx),%eax
  8002f9:	3c 55                	cmp    $0x55,%al
  8002fb:	0f 87 c3 02 00 00    	ja     8005c4 <vprintfmt+0x32b>
  800301:	0f b6 c0             	movzbl %al,%eax
  800304:	ff 24 85 a0 0f 80 00 	jmp    *0x800fa0(,%eax,4)
  80030b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80030e:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800312:	eb d9                	jmp    8002ed <vprintfmt+0x54>
  800314:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800317:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  80031b:	eb d0                	jmp    8002ed <vprintfmt+0x54>
  80031d:	0f b6 d2             	movzbl %dl,%edx
  800320:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800323:	b8 00 00 00 00       	mov    $0x0,%eax
  800328:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80032b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  80032e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800332:	0f be 17             	movsbl (%edi),%edx
  800335:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800338:	83 f9 09             	cmp    $0x9,%ecx
  80033b:	77 52                	ja     80038f <vprintfmt+0xf6>
  80033d:	83 c7 01             	add    $0x1,%edi
  800340:	eb e9                	jmp    80032b <vprintfmt+0x92>
  800342:	8b 45 14             	mov    0x14(%ebp),%eax
  800345:	8d 50 04             	lea    0x4(%eax),%edx
  800348:	89 55 14             	mov    %edx,0x14(%ebp)
  80034b:	8b 00                	mov    (%eax),%eax
  80034d:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800350:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800353:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800357:	79 94                	jns    8002ed <vprintfmt+0x54>
  800359:	8b 45 d0             	mov    -0x30(%ebp),%eax
  80035c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80035f:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800366:	eb 85                	jmp    8002ed <vprintfmt+0x54>
  800368:	8b 55 e0             	mov    -0x20(%ebp),%edx
  80036b:	85 d2                	test   %edx,%edx
  80036d:	b8 00 00 00 00       	mov    $0x0,%eax
  800372:	0f 49 c2             	cmovns %edx,%eax
  800375:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800378:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80037b:	e9 6d ff ff ff       	jmp    8002ed <vprintfmt+0x54>
  800380:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800383:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  80038a:	e9 5e ff ff ff       	jmp    8002ed <vprintfmt+0x54>
  80038f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  800392:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800395:	eb bc                	jmp    800353 <vprintfmt+0xba>
  800397:	83 c1 01             	add    $0x1,%ecx
  80039a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80039d:	e9 4b ff ff ff       	jmp    8002ed <vprintfmt+0x54>
  8003a2:	8b 45 14             	mov    0x14(%ebp),%eax
  8003a5:	8d 50 04             	lea    0x4(%eax),%edx
  8003a8:	89 55 14             	mov    %edx,0x14(%ebp)
  8003ab:	83 ec 08             	sub    $0x8,%esp
  8003ae:	56                   	push   %esi
  8003af:	ff 30                	push   (%eax)
  8003b1:	ff d3                	call   *%ebx
  8003b3:	83 c4 10             	add    $0x10,%esp
  8003b6:	e9 a0 01 00 00       	jmp    80055b <vprintfmt+0x2c2>
  8003bb:	8b 45 14             	mov    0x14(%ebp),%eax
  8003be:	8d 50 04             	lea    0x4(%eax),%edx
  8003c1:	89 55 14             	mov    %edx,0x14(%ebp)
  8003c4:	8b 10                	mov    (%eax),%edx
  8003c6:	89 d0                	mov    %edx,%eax
  8003c8:	f7 d8                	neg    %eax
  8003ca:	0f 48 c2             	cmovs  %edx,%eax
  8003cd:	83 f8 08             	cmp    $0x8,%eax
  8003d0:	7f 20                	jg     8003f2 <vprintfmt+0x159>
  8003d2:	8b 14 85 00 11 80 00 	mov    0x801100(,%eax,4),%edx
  8003d9:	85 d2                	test   %edx,%edx
  8003db:	74 15                	je     8003f2 <vprintfmt+0x159>
  8003dd:	52                   	push   %edx
  8003de:	68 d6 0e 80 00       	push   $0x800ed6
  8003e3:	56                   	push   %esi
  8003e4:	53                   	push   %ebx
  8003e5:	e8 92 fe ff ff       	call   80027c <printfmt>
  8003ea:	83 c4 10             	add    $0x10,%esp
  8003ed:	e9 69 01 00 00       	jmp    80055b <vprintfmt+0x2c2>
  8003f2:	50                   	push   %eax
  8003f3:	68 cd 0e 80 00       	push   $0x800ecd
  8003f8:	56                   	push   %esi
  8003f9:	53                   	push   %ebx
  8003fa:	e8 7d fe ff ff       	call   80027c <printfmt>
  8003ff:	83 c4 10             	add    $0x10,%esp
  800402:	e9 54 01 00 00       	jmp    80055b <vprintfmt+0x2c2>
  800407:	8b 45 14             	mov    0x14(%ebp),%eax
  80040a:	8d 50 04             	lea    0x4(%eax),%edx
  80040d:	89 55 14             	mov    %edx,0x14(%ebp)
  800410:	8b 08                	mov    (%eax),%ecx
  800412:	85 c9                	test   %ecx,%ecx
  800414:	b8 c6 0e 80 00       	mov    $0x800ec6,%eax
  800419:	0f 45 c1             	cmovne %ecx,%eax
  80041c:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80041f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800423:	7e 06                	jle    80042b <vprintfmt+0x192>
  800425:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800429:	75 0b                	jne    800436 <vprintfmt+0x19d>
  80042b:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  80042e:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800431:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800434:	eb 5c                	jmp    800492 <vprintfmt+0x1f9>
  800436:	83 ec 08             	sub    $0x8,%esp
  800439:	ff 75 d0             	push   -0x30(%ebp)
  80043c:	ff 75 cc             	push   -0x34(%ebp)
  80043f:	e8 20 02 00 00       	call   800664 <strnlen>
  800444:	89 c2                	mov    %eax,%edx
  800446:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800449:	29 d0                	sub    %edx,%eax
  80044b:	83 c4 10             	add    $0x10,%esp
  80044e:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800452:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800455:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800458:	89 c3                	mov    %eax,%ebx
  80045a:	eb 0e                	jmp    80046a <vprintfmt+0x1d1>
  80045c:	83 ec 08             	sub    $0x8,%esp
  80045f:	56                   	push   %esi
  800460:	57                   	push   %edi
  800461:	ff 55 08             	call   *0x8(%ebp)
  800464:	83 eb 01             	sub    $0x1,%ebx
  800467:	83 c4 10             	add    $0x10,%esp
  80046a:	85 db                	test   %ebx,%ebx
  80046c:	7f ee                	jg     80045c <vprintfmt+0x1c3>
  80046e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800471:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800474:	85 c0                	test   %eax,%eax
  800476:	ba 00 00 00 00       	mov    $0x0,%edx
  80047b:	0f 49 d0             	cmovns %eax,%edx
  80047e:	29 d0                	sub    %edx,%eax
  800480:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800483:	eb a6                	jmp    80042b <vprintfmt+0x192>
  800485:	83 ec 08             	sub    $0x8,%esp
  800488:	56                   	push   %esi
  800489:	52                   	push   %edx
  80048a:	ff 55 08             	call   *0x8(%ebp)
  80048d:	83 c4 10             	add    $0x10,%esp
  800490:	89 d9                	mov    %ebx,%ecx
  800492:	8d 59 01             	lea    0x1(%ecx),%ebx
  800495:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  800499:	0f be d0             	movsbl %al,%edx
  80049c:	85 d2                	test   %edx,%edx
  80049e:	74 28                	je     8004c8 <vprintfmt+0x22f>
  8004a0:	85 ff                	test   %edi,%edi
  8004a2:	78 05                	js     8004a9 <vprintfmt+0x210>
  8004a4:	83 ef 01             	sub    $0x1,%edi
  8004a7:	78 2e                	js     8004d7 <vprintfmt+0x23e>
  8004a9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8004ad:	74 d6                	je     800485 <vprintfmt+0x1ec>
  8004af:	0f be c0             	movsbl %al,%eax
  8004b2:	83 e8 20             	sub    $0x20,%eax
  8004b5:	83 f8 5e             	cmp    $0x5e,%eax
  8004b8:	76 cb                	jbe    800485 <vprintfmt+0x1ec>
  8004ba:	83 ec 08             	sub    $0x8,%esp
  8004bd:	56                   	push   %esi
  8004be:	6a 3f                	push   $0x3f
  8004c0:	ff 55 08             	call   *0x8(%ebp)
  8004c3:	83 c4 10             	add    $0x10,%esp
  8004c6:	eb c8                	jmp    800490 <vprintfmt+0x1f7>
  8004c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004cb:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8004ce:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004d1:	01 c7                	add    %eax,%edi
  8004d3:	29 cf                	sub    %ecx,%edi
  8004d5:	eb 13                	jmp    8004ea <vprintfmt+0x251>
  8004d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004da:	eb ef                	jmp    8004cb <vprintfmt+0x232>
  8004dc:	83 ec 08             	sub    $0x8,%esp
  8004df:	56                   	push   %esi
  8004e0:	6a 20                	push   $0x20
  8004e2:	ff d3                	call   *%ebx
  8004e4:	83 ef 01             	sub    $0x1,%edi
  8004e7:	83 c4 10             	add    $0x10,%esp
  8004ea:	85 ff                	test   %edi,%edi
  8004ec:	7f ee                	jg     8004dc <vprintfmt+0x243>
  8004ee:	eb 6b                	jmp    80055b <vprintfmt+0x2c2>
  8004f0:	89 ca                	mov    %ecx,%edx
  8004f2:	8d 45 14             	lea    0x14(%ebp),%eax
  8004f5:	e8 39 fd ff ff       	call   800233 <getint>
  8004fa:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8004fd:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800500:	85 d2                	test   %edx,%edx
  800502:	78 0b                	js     80050f <vprintfmt+0x276>
  800504:	89 d1                	mov    %edx,%ecx
  800506:	89 c2                	mov    %eax,%edx
  800508:	bf 0a 00 00 00       	mov    $0xa,%edi
  80050d:	eb 32                	jmp    800541 <vprintfmt+0x2a8>
  80050f:	83 ec 08             	sub    $0x8,%esp
  800512:	56                   	push   %esi
  800513:	6a 2d                	push   $0x2d
  800515:	ff d3                	call   *%ebx
  800517:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80051a:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  80051d:	f7 da                	neg    %edx
  80051f:	83 d1 00             	adc    $0x0,%ecx
  800522:	f7 d9                	neg    %ecx
  800524:	83 c4 10             	add    $0x10,%esp
  800527:	bf 0a 00 00 00       	mov    $0xa,%edi
  80052c:	eb 13                	jmp    800541 <vprintfmt+0x2a8>
  80052e:	89 ca                	mov    %ecx,%edx
  800530:	8d 45 14             	lea    0x14(%ebp),%eax
  800533:	e8 c7 fc ff ff       	call   8001ff <getuint>
  800538:	89 d1                	mov    %edx,%ecx
  80053a:	89 c2                	mov    %eax,%edx
  80053c:	bf 0a 00 00 00       	mov    $0xa,%edi
  800541:	83 ec 0c             	sub    $0xc,%esp
  800544:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800548:	50                   	push   %eax
  800549:	ff 75 e0             	push   -0x20(%ebp)
  80054c:	57                   	push   %edi
  80054d:	51                   	push   %ecx
  80054e:	52                   	push   %edx
  80054f:	89 f2                	mov    %esi,%edx
  800551:	89 d8                	mov    %ebx,%eax
  800553:	e8 fe fb ff ff       	call   800156 <printnum>
  800558:	83 c4 20             	add    $0x20,%esp
  80055b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80055e:	e9 54 fd ff ff       	jmp    8002b7 <vprintfmt+0x1e>
  800563:	89 ca                	mov    %ecx,%edx
  800565:	8d 45 14             	lea    0x14(%ebp),%eax
  800568:	e8 92 fc ff ff       	call   8001ff <getuint>
  80056d:	89 d1                	mov    %edx,%ecx
  80056f:	89 c2                	mov    %eax,%edx
  800571:	bf 08 00 00 00       	mov    $0x8,%edi
  800576:	eb c9                	jmp    800541 <vprintfmt+0x2a8>
  800578:	83 ec 08             	sub    $0x8,%esp
  80057b:	56                   	push   %esi
  80057c:	6a 30                	push   $0x30
  80057e:	ff d3                	call   *%ebx
  800580:	83 c4 08             	add    $0x8,%esp
  800583:	56                   	push   %esi
  800584:	6a 78                	push   $0x78
  800586:	ff d3                	call   *%ebx
  800588:	8b 45 14             	mov    0x14(%ebp),%eax
  80058b:	8d 50 04             	lea    0x4(%eax),%edx
  80058e:	89 55 14             	mov    %edx,0x14(%ebp)
  800591:	8b 10                	mov    (%eax),%edx
  800593:	b9 00 00 00 00       	mov    $0x0,%ecx
  800598:	83 c4 10             	add    $0x10,%esp
  80059b:	bf 10 00 00 00       	mov    $0x10,%edi
  8005a0:	eb 9f                	jmp    800541 <vprintfmt+0x2a8>
  8005a2:	89 ca                	mov    %ecx,%edx
  8005a4:	8d 45 14             	lea    0x14(%ebp),%eax
  8005a7:	e8 53 fc ff ff       	call   8001ff <getuint>
  8005ac:	89 d1                	mov    %edx,%ecx
  8005ae:	89 c2                	mov    %eax,%edx
  8005b0:	bf 10 00 00 00       	mov    $0x10,%edi
  8005b5:	eb 8a                	jmp    800541 <vprintfmt+0x2a8>
  8005b7:	83 ec 08             	sub    $0x8,%esp
  8005ba:	56                   	push   %esi
  8005bb:	6a 25                	push   $0x25
  8005bd:	ff d3                	call   *%ebx
  8005bf:	83 c4 10             	add    $0x10,%esp
  8005c2:	eb 97                	jmp    80055b <vprintfmt+0x2c2>
  8005c4:	83 ec 08             	sub    $0x8,%esp
  8005c7:	56                   	push   %esi
  8005c8:	6a 25                	push   $0x25
  8005ca:	ff d3                	call   *%ebx
  8005cc:	83 c4 10             	add    $0x10,%esp
  8005cf:	89 f8                	mov    %edi,%eax
  8005d1:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  8005d5:	74 05                	je     8005dc <vprintfmt+0x343>
  8005d7:	83 e8 01             	sub    $0x1,%eax
  8005da:	eb f5                	jmp    8005d1 <vprintfmt+0x338>
  8005dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8005df:	e9 77 ff ff ff       	jmp    80055b <vprintfmt+0x2c2>

008005e4 <vsnprintf>:
  8005e4:	55                   	push   %ebp
  8005e5:	89 e5                	mov    %esp,%ebp
  8005e7:	83 ec 18             	sub    $0x18,%esp
  8005ea:	8b 45 08             	mov    0x8(%ebp),%eax
  8005ed:	8b 55 0c             	mov    0xc(%ebp),%edx
  8005f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  8005f3:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  8005f7:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  8005fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800601:	85 c0                	test   %eax,%eax
  800603:	74 26                	je     80062b <vsnprintf+0x47>
  800605:	85 d2                	test   %edx,%edx
  800607:	7e 22                	jle    80062b <vsnprintf+0x47>
  800609:	ff 75 14             	push   0x14(%ebp)
  80060c:	ff 75 10             	push   0x10(%ebp)
  80060f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800612:	50                   	push   %eax
  800613:	68 5f 02 80 00       	push   $0x80025f
  800618:	e8 7c fc ff ff       	call   800299 <vprintfmt>
  80061d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800620:	c6 00 00             	movb   $0x0,(%eax)
  800623:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800626:	83 c4 10             	add    $0x10,%esp
  800629:	c9                   	leave
  80062a:	c3                   	ret
  80062b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800630:	eb f7                	jmp    800629 <vsnprintf+0x45>

00800632 <snprintf>:
  800632:	55                   	push   %ebp
  800633:	89 e5                	mov    %esp,%ebp
  800635:	83 ec 08             	sub    $0x8,%esp
  800638:	8d 45 14             	lea    0x14(%ebp),%eax
  80063b:	50                   	push   %eax
  80063c:	ff 75 10             	push   0x10(%ebp)
  80063f:	ff 75 0c             	push   0xc(%ebp)
  800642:	ff 75 08             	push   0x8(%ebp)
  800645:	e8 9a ff ff ff       	call   8005e4 <vsnprintf>
  80064a:	c9                   	leave
  80064b:	c3                   	ret

0080064c <strlen>:
  80064c:	55                   	push   %ebp
  80064d:	89 e5                	mov    %esp,%ebp
  80064f:	8b 55 08             	mov    0x8(%ebp),%edx
  800652:	b8 00 00 00 00       	mov    $0x0,%eax
  800657:	eb 03                	jmp    80065c <strlen+0x10>
  800659:	83 c0 01             	add    $0x1,%eax
  80065c:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800660:	75 f7                	jne    800659 <strlen+0xd>
  800662:	5d                   	pop    %ebp
  800663:	c3                   	ret

00800664 <strnlen>:
  800664:	55                   	push   %ebp
  800665:	89 e5                	mov    %esp,%ebp
  800667:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80066a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80066d:	b8 00 00 00 00       	mov    $0x0,%eax
  800672:	eb 03                	jmp    800677 <strnlen+0x13>
  800674:	83 c0 01             	add    $0x1,%eax
  800677:	39 d0                	cmp    %edx,%eax
  800679:	74 08                	je     800683 <strnlen+0x1f>
  80067b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  80067f:	75 f3                	jne    800674 <strnlen+0x10>
  800681:	89 c2                	mov    %eax,%edx
  800683:	89 d0                	mov    %edx,%eax
  800685:	5d                   	pop    %ebp
  800686:	c3                   	ret

00800687 <strcpy>:
  800687:	55                   	push   %ebp
  800688:	89 e5                	mov    %esp,%ebp
  80068a:	53                   	push   %ebx
  80068b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80068e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800691:	b8 00 00 00 00       	mov    $0x0,%eax
  800696:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  80069a:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  80069d:	83 c0 01             	add    $0x1,%eax
  8006a0:	84 d2                	test   %dl,%dl
  8006a2:	75 f2                	jne    800696 <strcpy+0xf>
  8006a4:	89 c8                	mov    %ecx,%eax
  8006a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006a9:	c9                   	leave
  8006aa:	c3                   	ret

008006ab <strcat>:
  8006ab:	55                   	push   %ebp
  8006ac:	89 e5                	mov    %esp,%ebp
  8006ae:	53                   	push   %ebx
  8006af:	83 ec 10             	sub    $0x10,%esp
  8006b2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006b5:	53                   	push   %ebx
  8006b6:	e8 91 ff ff ff       	call   80064c <strlen>
  8006bb:	83 c4 08             	add    $0x8,%esp
  8006be:	ff 75 0c             	push   0xc(%ebp)
  8006c1:	01 d8                	add    %ebx,%eax
  8006c3:	50                   	push   %eax
  8006c4:	e8 be ff ff ff       	call   800687 <strcpy>
  8006c9:	89 d8                	mov    %ebx,%eax
  8006cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006ce:	c9                   	leave
  8006cf:	c3                   	ret

008006d0 <strncpy>:
  8006d0:	55                   	push   %ebp
  8006d1:	89 e5                	mov    %esp,%ebp
  8006d3:	56                   	push   %esi
  8006d4:	53                   	push   %ebx
  8006d5:	8b 75 08             	mov    0x8(%ebp),%esi
  8006d8:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006db:	89 f3                	mov    %esi,%ebx
  8006dd:	03 5d 10             	add    0x10(%ebp),%ebx
  8006e0:	89 f0                	mov    %esi,%eax
  8006e2:	eb 0f                	jmp    8006f3 <strncpy+0x23>
  8006e4:	83 c0 01             	add    $0x1,%eax
  8006e7:	0f b6 0a             	movzbl (%edx),%ecx
  8006ea:	88 48 ff             	mov    %cl,-0x1(%eax)
  8006ed:	80 f9 01             	cmp    $0x1,%cl
  8006f0:	83 da ff             	sbb    $0xffffffff,%edx
  8006f3:	39 d8                	cmp    %ebx,%eax
  8006f5:	75 ed                	jne    8006e4 <strncpy+0x14>
  8006f7:	89 f0                	mov    %esi,%eax
  8006f9:	5b                   	pop    %ebx
  8006fa:	5e                   	pop    %esi
  8006fb:	5d                   	pop    %ebp
  8006fc:	c3                   	ret

008006fd <strlcpy>:
  8006fd:	55                   	push   %ebp
  8006fe:	89 e5                	mov    %esp,%ebp
  800700:	56                   	push   %esi
  800701:	53                   	push   %ebx
  800702:	8b 75 08             	mov    0x8(%ebp),%esi
  800705:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800708:	8b 55 10             	mov    0x10(%ebp),%edx
  80070b:	89 f0                	mov    %esi,%eax
  80070d:	85 d2                	test   %edx,%edx
  80070f:	74 21                	je     800732 <strlcpy+0x35>
  800711:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800715:	89 f2                	mov    %esi,%edx
  800717:	eb 09                	jmp    800722 <strlcpy+0x25>
  800719:	83 c1 01             	add    $0x1,%ecx
  80071c:	83 c2 01             	add    $0x1,%edx
  80071f:	88 5a ff             	mov    %bl,-0x1(%edx)
  800722:	39 c2                	cmp    %eax,%edx
  800724:	74 09                	je     80072f <strlcpy+0x32>
  800726:	0f b6 19             	movzbl (%ecx),%ebx
  800729:	84 db                	test   %bl,%bl
  80072b:	75 ec                	jne    800719 <strlcpy+0x1c>
  80072d:	89 d0                	mov    %edx,%eax
  80072f:	c6 00 00             	movb   $0x0,(%eax)
  800732:	29 f0                	sub    %esi,%eax
  800734:	5b                   	pop    %ebx
  800735:	5e                   	pop    %esi
  800736:	5d                   	pop    %ebp
  800737:	c3                   	ret

00800738 <strcmp>:
  800738:	55                   	push   %ebp
  800739:	89 e5                	mov    %esp,%ebp
  80073b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80073e:	8b 55 0c             	mov    0xc(%ebp),%edx
  800741:	eb 06                	jmp    800749 <strcmp+0x11>
  800743:	83 c1 01             	add    $0x1,%ecx
  800746:	83 c2 01             	add    $0x1,%edx
  800749:	0f b6 01             	movzbl (%ecx),%eax
  80074c:	84 c0                	test   %al,%al
  80074e:	74 04                	je     800754 <strcmp+0x1c>
  800750:	3a 02                	cmp    (%edx),%al
  800752:	74 ef                	je     800743 <strcmp+0xb>
  800754:	0f b6 c0             	movzbl %al,%eax
  800757:	0f b6 12             	movzbl (%edx),%edx
  80075a:	29 d0                	sub    %edx,%eax
  80075c:	5d                   	pop    %ebp
  80075d:	c3                   	ret

0080075e <strncmp>:
  80075e:	55                   	push   %ebp
  80075f:	89 e5                	mov    %esp,%ebp
  800761:	53                   	push   %ebx
  800762:	8b 45 08             	mov    0x8(%ebp),%eax
  800765:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800768:	8b 55 10             	mov    0x10(%ebp),%edx
  80076b:	eb 09                	jmp    800776 <strncmp+0x18>
  80076d:	83 ea 01             	sub    $0x1,%edx
  800770:	83 c0 01             	add    $0x1,%eax
  800773:	83 c1 01             	add    $0x1,%ecx
  800776:	85 d2                	test   %edx,%edx
  800778:	74 18                	je     800792 <strncmp+0x34>
  80077a:	0f b6 18             	movzbl (%eax),%ebx
  80077d:	84 db                	test   %bl,%bl
  80077f:	74 04                	je     800785 <strncmp+0x27>
  800781:	3a 19                	cmp    (%ecx),%bl
  800783:	74 e8                	je     80076d <strncmp+0xf>
  800785:	0f b6 00             	movzbl (%eax),%eax
  800788:	0f b6 11             	movzbl (%ecx),%edx
  80078b:	29 d0                	sub    %edx,%eax
  80078d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800790:	c9                   	leave
  800791:	c3                   	ret
  800792:	b8 00 00 00 00       	mov    $0x0,%eax
  800797:	eb f4                	jmp    80078d <strncmp+0x2f>

00800799 <strchr>:
  800799:	55                   	push   %ebp
  80079a:	89 e5                	mov    %esp,%ebp
  80079c:	8b 45 08             	mov    0x8(%ebp),%eax
  80079f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007a3:	eb 03                	jmp    8007a8 <strchr+0xf>
  8007a5:	83 c0 01             	add    $0x1,%eax
  8007a8:	0f b6 10             	movzbl (%eax),%edx
  8007ab:	84 d2                	test   %dl,%dl
  8007ad:	74 06                	je     8007b5 <strchr+0x1c>
  8007af:	38 ca                	cmp    %cl,%dl
  8007b1:	75 f2                	jne    8007a5 <strchr+0xc>
  8007b3:	eb 05                	jmp    8007ba <strchr+0x21>
  8007b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8007ba:	5d                   	pop    %ebp
  8007bb:	c3                   	ret

008007bc <strfind>:
  8007bc:	55                   	push   %ebp
  8007bd:	89 e5                	mov    %esp,%ebp
  8007bf:	8b 45 08             	mov    0x8(%ebp),%eax
  8007c2:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007c6:	0f b6 10             	movzbl (%eax),%edx
  8007c9:	38 ca                	cmp    %cl,%dl
  8007cb:	74 09                	je     8007d6 <strfind+0x1a>
  8007cd:	84 d2                	test   %dl,%dl
  8007cf:	74 05                	je     8007d6 <strfind+0x1a>
  8007d1:	83 c0 01             	add    $0x1,%eax
  8007d4:	eb f0                	jmp    8007c6 <strfind+0xa>
  8007d6:	5d                   	pop    %ebp
  8007d7:	c3                   	ret

008007d8 <memset>:
  8007d8:	55                   	push   %ebp
  8007d9:	89 e5                	mov    %esp,%ebp
  8007db:	57                   	push   %edi
  8007dc:	8b 55 08             	mov    0x8(%ebp),%edx
  8007df:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8007e2:	85 c9                	test   %ecx,%ecx
  8007e4:	74 24                	je     80080a <memset+0x32>
  8007e6:	89 d0                	mov    %edx,%eax
  8007e8:	09 c8                	or     %ecx,%eax
  8007ea:	a8 03                	test   $0x3,%al
  8007ec:	75 14                	jne    800802 <memset+0x2a>
  8007ee:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  8007f2:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  8007f8:	c1 e9 02             	shr    $0x2,%ecx
  8007fb:	89 d7                	mov    %edx,%edi
  8007fd:	fc                   	cld
  8007fe:	f3 ab                	rep stos %eax,%es:(%edi)
  800800:	eb 08                	jmp    80080a <memset+0x32>
  800802:	89 d7                	mov    %edx,%edi
  800804:	8b 45 0c             	mov    0xc(%ebp),%eax
  800807:	fc                   	cld
  800808:	f3 aa                	rep stos %al,%es:(%edi)
  80080a:	89 d0                	mov    %edx,%eax
  80080c:	8b 7d fc             	mov    -0x4(%ebp),%edi
  80080f:	c9                   	leave
  800810:	c3                   	ret

00800811 <memmove>:
  800811:	55                   	push   %ebp
  800812:	89 e5                	mov    %esp,%ebp
  800814:	57                   	push   %edi
  800815:	56                   	push   %esi
  800816:	8b 45 08             	mov    0x8(%ebp),%eax
  800819:	8b 75 0c             	mov    0xc(%ebp),%esi
  80081c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  80081f:	39 c6                	cmp    %eax,%esi
  800821:	73 32                	jae    800855 <memmove+0x44>
  800823:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800826:	39 d0                	cmp    %edx,%eax
  800828:	73 2b                	jae    800855 <memmove+0x44>
  80082a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  80082d:	89 fe                	mov    %edi,%esi
  80082f:	09 ce                	or     %ecx,%esi
  800831:	09 d6                	or     %edx,%esi
  800833:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800839:	75 0e                	jne    800849 <memmove+0x38>
  80083b:	83 ef 04             	sub    $0x4,%edi
  80083e:	8d 72 fc             	lea    -0x4(%edx),%esi
  800841:	c1 e9 02             	shr    $0x2,%ecx
  800844:	fd                   	std
  800845:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800847:	eb 09                	jmp    800852 <memmove+0x41>
  800849:	83 ef 01             	sub    $0x1,%edi
  80084c:	8d 72 ff             	lea    -0x1(%edx),%esi
  80084f:	fd                   	std
  800850:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800852:	fc                   	cld
  800853:	eb 1a                	jmp    80086f <memmove+0x5e>
  800855:	89 c2                	mov    %eax,%edx
  800857:	09 ca                	or     %ecx,%edx
  800859:	09 f2                	or     %esi,%edx
  80085b:	f6 c2 03             	test   $0x3,%dl
  80085e:	75 0a                	jne    80086a <memmove+0x59>
  800860:	c1 e9 02             	shr    $0x2,%ecx
  800863:	89 c7                	mov    %eax,%edi
  800865:	fc                   	cld
  800866:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800868:	eb 05                	jmp    80086f <memmove+0x5e>
  80086a:	89 c7                	mov    %eax,%edi
  80086c:	fc                   	cld
  80086d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  80086f:	5e                   	pop    %esi
  800870:	5f                   	pop    %edi
  800871:	5d                   	pop    %ebp
  800872:	c3                   	ret

00800873 <memcpy>:
  800873:	55                   	push   %ebp
  800874:	89 e5                	mov    %esp,%ebp
  800876:	83 ec 0c             	sub    $0xc,%esp
  800879:	ff 75 10             	push   0x10(%ebp)
  80087c:	ff 75 0c             	push   0xc(%ebp)
  80087f:	ff 75 08             	push   0x8(%ebp)
  800882:	e8 8a ff ff ff       	call   800811 <memmove>
  800887:	c9                   	leave
  800888:	c3                   	ret

00800889 <memcmp>:
  800889:	55                   	push   %ebp
  80088a:	89 e5                	mov    %esp,%ebp
  80088c:	56                   	push   %esi
  80088d:	53                   	push   %ebx
  80088e:	8b 45 08             	mov    0x8(%ebp),%eax
  800891:	8b 55 0c             	mov    0xc(%ebp),%edx
  800894:	89 c6                	mov    %eax,%esi
  800896:	03 75 10             	add    0x10(%ebp),%esi
  800899:	eb 06                	jmp    8008a1 <memcmp+0x18>
  80089b:	83 c0 01             	add    $0x1,%eax
  80089e:	83 c2 01             	add    $0x1,%edx
  8008a1:	39 f0                	cmp    %esi,%eax
  8008a3:	74 14                	je     8008b9 <memcmp+0x30>
  8008a5:	0f b6 08             	movzbl (%eax),%ecx
  8008a8:	0f b6 1a             	movzbl (%edx),%ebx
  8008ab:	38 d9                	cmp    %bl,%cl
  8008ad:	74 ec                	je     80089b <memcmp+0x12>
  8008af:	0f b6 c1             	movzbl %cl,%eax
  8008b2:	0f b6 db             	movzbl %bl,%ebx
  8008b5:	29 d8                	sub    %ebx,%eax
  8008b7:	eb 05                	jmp    8008be <memcmp+0x35>
  8008b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8008be:	5b                   	pop    %ebx
  8008bf:	5e                   	pop    %esi
  8008c0:	5d                   	pop    %ebp
  8008c1:	c3                   	ret

008008c2 <memfind>:
  8008c2:	55                   	push   %ebp
  8008c3:	89 e5                	mov    %esp,%ebp
  8008c5:	8b 45 08             	mov    0x8(%ebp),%eax
  8008c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8008cb:	89 c2                	mov    %eax,%edx
  8008cd:	03 55 10             	add    0x10(%ebp),%edx
  8008d0:	eb 03                	jmp    8008d5 <memfind+0x13>
  8008d2:	83 c0 01             	add    $0x1,%eax
  8008d5:	39 d0                	cmp    %edx,%eax
  8008d7:	73 04                	jae    8008dd <memfind+0x1b>
  8008d9:	38 08                	cmp    %cl,(%eax)
  8008db:	75 f5                	jne    8008d2 <memfind+0x10>
  8008dd:	5d                   	pop    %ebp
  8008de:	c3                   	ret

008008df <strtol>:
  8008df:	55                   	push   %ebp
  8008e0:	89 e5                	mov    %esp,%ebp
  8008e2:	57                   	push   %edi
  8008e3:	56                   	push   %esi
  8008e4:	53                   	push   %ebx
  8008e5:	8b 55 08             	mov    0x8(%ebp),%edx
  8008e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8008eb:	eb 03                	jmp    8008f0 <strtol+0x11>
  8008ed:	83 c2 01             	add    $0x1,%edx
  8008f0:	0f b6 02             	movzbl (%edx),%eax
  8008f3:	3c 20                	cmp    $0x20,%al
  8008f5:	74 f6                	je     8008ed <strtol+0xe>
  8008f7:	3c 09                	cmp    $0x9,%al
  8008f9:	74 f2                	je     8008ed <strtol+0xe>
  8008fb:	3c 2b                	cmp    $0x2b,%al
  8008fd:	74 2a                	je     800929 <strtol+0x4a>
  8008ff:	bf 00 00 00 00       	mov    $0x0,%edi
  800904:	3c 2d                	cmp    $0x2d,%al
  800906:	74 2b                	je     800933 <strtol+0x54>
  800908:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  80090e:	75 0f                	jne    80091f <strtol+0x40>
  800910:	80 3a 30             	cmpb   $0x30,(%edx)
  800913:	74 28                	je     80093d <strtol+0x5e>
  800915:	85 db                	test   %ebx,%ebx
  800917:	b8 0a 00 00 00       	mov    $0xa,%eax
  80091c:	0f 44 d8             	cmove  %eax,%ebx
  80091f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800924:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800927:	eb 46                	jmp    80096f <strtol+0x90>
  800929:	83 c2 01             	add    $0x1,%edx
  80092c:	bf 00 00 00 00       	mov    $0x0,%edi
  800931:	eb d5                	jmp    800908 <strtol+0x29>
  800933:	83 c2 01             	add    $0x1,%edx
  800936:	bf 01 00 00 00       	mov    $0x1,%edi
  80093b:	eb cb                	jmp    800908 <strtol+0x29>
  80093d:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800941:	74 0e                	je     800951 <strtol+0x72>
  800943:	85 db                	test   %ebx,%ebx
  800945:	75 d8                	jne    80091f <strtol+0x40>
  800947:	83 c2 01             	add    $0x1,%edx
  80094a:	bb 08 00 00 00       	mov    $0x8,%ebx
  80094f:	eb ce                	jmp    80091f <strtol+0x40>
  800951:	83 c2 02             	add    $0x2,%edx
  800954:	bb 10 00 00 00       	mov    $0x10,%ebx
  800959:	eb c4                	jmp    80091f <strtol+0x40>
  80095b:	0f be c0             	movsbl %al,%eax
  80095e:	83 e8 30             	sub    $0x30,%eax
  800961:	3b 45 10             	cmp    0x10(%ebp),%eax
  800964:	7d 3a                	jge    8009a0 <strtol+0xc1>
  800966:	83 c2 01             	add    $0x1,%edx
  800969:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  80096d:	01 c1                	add    %eax,%ecx
  80096f:	0f b6 02             	movzbl (%edx),%eax
  800972:	8d 70 d0             	lea    -0x30(%eax),%esi
  800975:	89 f3                	mov    %esi,%ebx
  800977:	80 fb 09             	cmp    $0x9,%bl
  80097a:	76 df                	jbe    80095b <strtol+0x7c>
  80097c:	8d 70 9f             	lea    -0x61(%eax),%esi
  80097f:	89 f3                	mov    %esi,%ebx
  800981:	80 fb 19             	cmp    $0x19,%bl
  800984:	77 08                	ja     80098e <strtol+0xaf>
  800986:	0f be c0             	movsbl %al,%eax
  800989:	83 e8 57             	sub    $0x57,%eax
  80098c:	eb d3                	jmp    800961 <strtol+0x82>
  80098e:	8d 70 bf             	lea    -0x41(%eax),%esi
  800991:	89 f3                	mov    %esi,%ebx
  800993:	80 fb 19             	cmp    $0x19,%bl
  800996:	77 08                	ja     8009a0 <strtol+0xc1>
  800998:	0f be c0             	movsbl %al,%eax
  80099b:	83 e8 37             	sub    $0x37,%eax
  80099e:	eb c1                	jmp    800961 <strtol+0x82>
  8009a0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  8009a4:	74 05                	je     8009ab <strtol+0xcc>
  8009a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  8009a9:	89 10                	mov    %edx,(%eax)
  8009ab:	89 c8                	mov    %ecx,%eax
  8009ad:	f7 d8                	neg    %eax
  8009af:	85 ff                	test   %edi,%edi
  8009b1:	0f 45 c8             	cmovne %eax,%ecx
  8009b4:	89 c8                	mov    %ecx,%eax
  8009b6:	5b                   	pop    %ebx
  8009b7:	5e                   	pop    %esi
  8009b8:	5f                   	pop    %edi
  8009b9:	5d                   	pop    %ebp
  8009ba:	c3                   	ret

008009bb <syscall>:
  8009bb:	55                   	push   %ebp
  8009bc:	89 e5                	mov    %esp,%ebp
  8009be:	57                   	push   %edi
  8009bf:	56                   	push   %esi
  8009c0:	53                   	push   %ebx
  8009c1:	83 ec 1c             	sub    $0x1c,%esp
  8009c4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8009c7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8009ca:	89 ca                	mov    %ecx,%edx
  8009cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8009cf:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8009d2:	8b 7d 10             	mov    0x10(%ebp),%edi
  8009d5:	8b 75 14             	mov    0x14(%ebp),%esi
  8009d8:	cd 30                	int    $0x30
  8009da:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8009de:	74 04                	je     8009e4 <syscall+0x29>
  8009e0:	85 c0                	test   %eax,%eax
  8009e2:	7f 08                	jg     8009ec <syscall+0x31>
  8009e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8009e7:	5b                   	pop    %ebx
  8009e8:	5e                   	pop    %esi
  8009e9:	5f                   	pop    %edi
  8009ea:	5d                   	pop    %ebp
  8009eb:	c3                   	ret
  8009ec:	83 ec 0c             	sub    $0xc,%esp
  8009ef:	50                   	push   %eax
  8009f0:	ff 75 e0             	push   -0x20(%ebp)
  8009f3:	68 6c 0f 80 00       	push   $0x800f6c
  8009f8:	6a 1e                	push   $0x1e
  8009fa:	68 89 0f 80 00       	push   $0x800f89
  8009ff:	e8 b1 01 00 00       	call   800bb5 <_panic>

00800a04 <sys_cputs>:
  800a04:	55                   	push   %ebp
  800a05:	89 e5                	mov    %esp,%ebp
  800a07:	83 ec 08             	sub    $0x8,%esp
  800a0a:	6a 00                	push   $0x0
  800a0c:	6a 00                	push   $0x0
  800a0e:	6a 00                	push   $0x0
  800a10:	ff 75 0c             	push   0xc(%ebp)
  800a13:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a16:	ba 00 00 00 00       	mov    $0x0,%edx
  800a1b:	b8 00 00 00 00       	mov    $0x0,%eax
  800a20:	e8 96 ff ff ff       	call   8009bb <syscall>
  800a25:	83 c4 10             	add    $0x10,%esp
  800a28:	c9                   	leave
  800a29:	c3                   	ret

00800a2a <sys_cgetc>:
  800a2a:	55                   	push   %ebp
  800a2b:	89 e5                	mov    %esp,%ebp
  800a2d:	83 ec 08             	sub    $0x8,%esp
  800a30:	6a 00                	push   $0x0
  800a32:	6a 00                	push   $0x0
  800a34:	6a 00                	push   $0x0
  800a36:	6a 00                	push   $0x0
  800a38:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a3d:	ba 00 00 00 00       	mov    $0x0,%edx
  800a42:	b8 01 00 00 00       	mov    $0x1,%eax
  800a47:	e8 6f ff ff ff       	call   8009bb <syscall>
  800a4c:	c9                   	leave
  800a4d:	c3                   	ret

00800a4e <sys_env_destroy>:
  800a4e:	55                   	push   %ebp
  800a4f:	89 e5                	mov    %esp,%ebp
  800a51:	83 ec 08             	sub    $0x8,%esp
  800a54:	6a 00                	push   $0x0
  800a56:	6a 00                	push   $0x0
  800a58:	6a 00                	push   $0x0
  800a5a:	6a 00                	push   $0x0
  800a5c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a5f:	ba 01 00 00 00       	mov    $0x1,%edx
  800a64:	b8 03 00 00 00       	mov    $0x3,%eax
  800a69:	e8 4d ff ff ff       	call   8009bb <syscall>
  800a6e:	c9                   	leave
  800a6f:	c3                   	ret

00800a70 <sys_getenvid>:
  800a70:	55                   	push   %ebp
  800a71:	89 e5                	mov    %esp,%ebp
  800a73:	83 ec 08             	sub    $0x8,%esp
  800a76:	6a 00                	push   $0x0
  800a78:	6a 00                	push   $0x0
  800a7a:	6a 00                	push   $0x0
  800a7c:	6a 00                	push   $0x0
  800a7e:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a83:	ba 00 00 00 00       	mov    $0x0,%edx
  800a88:	b8 02 00 00 00       	mov    $0x2,%eax
  800a8d:	e8 29 ff ff ff       	call   8009bb <syscall>
  800a92:	c9                   	leave
  800a93:	c3                   	ret

00800a94 <sys_yield>:
  800a94:	55                   	push   %ebp
  800a95:	89 e5                	mov    %esp,%ebp
  800a97:	83 ec 08             	sub    $0x8,%esp
  800a9a:	6a 00                	push   $0x0
  800a9c:	6a 00                	push   $0x0
  800a9e:	6a 00                	push   $0x0
  800aa0:	6a 00                	push   $0x0
  800aa2:	b9 00 00 00 00       	mov    $0x0,%ecx
  800aa7:	ba 00 00 00 00       	mov    $0x0,%edx
  800aac:	b8 0a 00 00 00       	mov    $0xa,%eax
  800ab1:	e8 05 ff ff ff       	call   8009bb <syscall>
  800ab6:	83 c4 10             	add    $0x10,%esp
  800ab9:	c9                   	leave
  800aba:	c3                   	ret

00800abb <sys_page_alloc>:
  800abb:	55                   	push   %ebp
  800abc:	89 e5                	mov    %esp,%ebp
  800abe:	83 ec 08             	sub    $0x8,%esp
  800ac1:	6a 00                	push   $0x0
  800ac3:	6a 00                	push   $0x0
  800ac5:	ff 75 10             	push   0x10(%ebp)
  800ac8:	ff 75 0c             	push   0xc(%ebp)
  800acb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ace:	ba 01 00 00 00       	mov    $0x1,%edx
  800ad3:	b8 04 00 00 00       	mov    $0x4,%eax
  800ad8:	e8 de fe ff ff       	call   8009bb <syscall>
  800add:	c9                   	leave
  800ade:	c3                   	ret

00800adf <sys_page_map>:
  800adf:	55                   	push   %ebp
  800ae0:	89 e5                	mov    %esp,%ebp
  800ae2:	83 ec 08             	sub    $0x8,%esp
  800ae5:	ff 75 18             	push   0x18(%ebp)
  800ae8:	ff 75 14             	push   0x14(%ebp)
  800aeb:	ff 75 10             	push   0x10(%ebp)
  800aee:	ff 75 0c             	push   0xc(%ebp)
  800af1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800af4:	ba 01 00 00 00       	mov    $0x1,%edx
  800af9:	b8 05 00 00 00       	mov    $0x5,%eax
  800afe:	e8 b8 fe ff ff       	call   8009bb <syscall>
  800b03:	c9                   	leave
  800b04:	c3                   	ret

00800b05 <sys_page_unmap>:
  800b05:	55                   	push   %ebp
  800b06:	89 e5                	mov    %esp,%ebp
  800b08:	83 ec 08             	sub    $0x8,%esp
  800b0b:	6a 00                	push   $0x0
  800b0d:	6a 00                	push   $0x0
  800b0f:	6a 00                	push   $0x0
  800b11:	ff 75 0c             	push   0xc(%ebp)
  800b14:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b17:	ba 01 00 00 00       	mov    $0x1,%edx
  800b1c:	b8 06 00 00 00       	mov    $0x6,%eax
  800b21:	e8 95 fe ff ff       	call   8009bb <syscall>
  800b26:	c9                   	leave
  800b27:	c3                   	ret

00800b28 <sys_env_set_status>:
  800b28:	55                   	push   %ebp
  800b29:	89 e5                	mov    %esp,%ebp
  800b2b:	83 ec 08             	sub    $0x8,%esp
  800b2e:	6a 00                	push   $0x0
  800b30:	6a 00                	push   $0x0
  800b32:	6a 00                	push   $0x0
  800b34:	ff 75 0c             	push   0xc(%ebp)
  800b37:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b3a:	ba 01 00 00 00       	mov    $0x1,%edx
  800b3f:	b8 08 00 00 00       	mov    $0x8,%eax
  800b44:	e8 72 fe ff ff       	call   8009bb <syscall>
  800b49:	c9                   	leave
  800b4a:	c3                   	ret

00800b4b <sys_env_set_pgfault_upcall>:
  800b4b:	55                   	push   %ebp
  800b4c:	89 e5                	mov    %esp,%ebp
  800b4e:	83 ec 08             	sub    $0x8,%esp
  800b51:	6a 00                	push   $0x0
  800b53:	6a 00                	push   $0x0
  800b55:	6a 00                	push   $0x0
  800b57:	ff 75 0c             	push   0xc(%ebp)
  800b5a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b5d:	ba 01 00 00 00       	mov    $0x1,%edx
  800b62:	b8 09 00 00 00       	mov    $0x9,%eax
  800b67:	e8 4f fe ff ff       	call   8009bb <syscall>
  800b6c:	c9                   	leave
  800b6d:	c3                   	ret

00800b6e <sys_ipc_try_send>:
  800b6e:	55                   	push   %ebp
  800b6f:	89 e5                	mov    %esp,%ebp
  800b71:	83 ec 08             	sub    $0x8,%esp
  800b74:	6a 00                	push   $0x0
  800b76:	ff 75 14             	push   0x14(%ebp)
  800b79:	ff 75 10             	push   0x10(%ebp)
  800b7c:	ff 75 0c             	push   0xc(%ebp)
  800b7f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b82:	ba 00 00 00 00       	mov    $0x0,%edx
  800b87:	b8 0c 00 00 00       	mov    $0xc,%eax
  800b8c:	e8 2a fe ff ff       	call   8009bb <syscall>
  800b91:	c9                   	leave
  800b92:	c3                   	ret

00800b93 <sys_ipc_recv>:
  800b93:	55                   	push   %ebp
  800b94:	89 e5                	mov    %esp,%ebp
  800b96:	83 ec 08             	sub    $0x8,%esp
  800b99:	6a 00                	push   $0x0
  800b9b:	6a 00                	push   $0x0
  800b9d:	6a 00                	push   $0x0
  800b9f:	6a 00                	push   $0x0
  800ba1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ba4:	ba 01 00 00 00       	mov    $0x1,%edx
  800ba9:	b8 0d 00 00 00       	mov    $0xd,%eax
  800bae:	e8 08 fe ff ff       	call   8009bb <syscall>
  800bb3:	c9                   	leave
  800bb4:	c3                   	ret

00800bb5 <_panic>:
  800bb5:	55                   	push   %ebp
  800bb6:	89 e5                	mov    %esp,%ebp
  800bb8:	56                   	push   %esi
  800bb9:	53                   	push   %ebx
  800bba:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800bbd:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800bc3:	e8 a8 fe ff ff       	call   800a70 <sys_getenvid>
  800bc8:	83 ec 0c             	sub    $0xc,%esp
  800bcb:	ff 75 0c             	push   0xc(%ebp)
  800bce:	ff 75 08             	push   0x8(%ebp)
  800bd1:	56                   	push   %esi
  800bd2:	50                   	push   %eax
  800bd3:	68 88 0e 80 00       	push   $0x800e88
  800bd8:	e8 65 f5 ff ff       	call   800142 <cprintf>
  800bdd:	83 c4 18             	add    $0x18,%esp
  800be0:	53                   	push   %ebx
  800be1:	ff 75 10             	push   0x10(%ebp)
  800be4:	e8 08 f5 ff ff       	call   8000f1 <vcprintf>
  800be9:	c7 04 24 97 0f 80 00 	movl   $0x800f97,(%esp)
  800bf0:	e8 4d f5 ff ff       	call   800142 <cprintf>
  800bf5:	83 c4 10             	add    $0x10,%esp
  800bf8:	cc                   	int3
  800bf9:	eb fd                	jmp    800bf8 <_panic+0x43>
  800bfb:	66 90                	xchg   %ax,%ax
  800bfd:	66 90                	xchg   %ax,%ax
  800bff:	90                   	nop

00800c00 <__udivdi3>:
  800c00:	f3 0f 1e fb          	endbr32
  800c04:	55                   	push   %ebp
  800c05:	57                   	push   %edi
  800c06:	56                   	push   %esi
  800c07:	53                   	push   %ebx
  800c08:	83 ec 1c             	sub    $0x1c,%esp
  800c0b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800c0f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c13:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c17:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c1b:	85 c0                	test   %eax,%eax
  800c1d:	75 19                	jne    800c38 <__udivdi3+0x38>
  800c1f:	39 de                	cmp    %ebx,%esi
  800c21:	73 4d                	jae    800c70 <__udivdi3+0x70>
  800c23:	31 ff                	xor    %edi,%edi
  800c25:	89 e8                	mov    %ebp,%eax
  800c27:	89 f2                	mov    %esi,%edx
  800c29:	f7 f3                	div    %ebx
  800c2b:	89 fa                	mov    %edi,%edx
  800c2d:	83 c4 1c             	add    $0x1c,%esp
  800c30:	5b                   	pop    %ebx
  800c31:	5e                   	pop    %esi
  800c32:	5f                   	pop    %edi
  800c33:	5d                   	pop    %ebp
  800c34:	c3                   	ret
  800c35:	8d 76 00             	lea    0x0(%esi),%esi
  800c38:	39 c6                	cmp    %eax,%esi
  800c3a:	73 14                	jae    800c50 <__udivdi3+0x50>
  800c3c:	31 ff                	xor    %edi,%edi
  800c3e:	31 c0                	xor    %eax,%eax
  800c40:	89 fa                	mov    %edi,%edx
  800c42:	83 c4 1c             	add    $0x1c,%esp
  800c45:	5b                   	pop    %ebx
  800c46:	5e                   	pop    %esi
  800c47:	5f                   	pop    %edi
  800c48:	5d                   	pop    %ebp
  800c49:	c3                   	ret
  800c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800c50:	0f bd f8             	bsr    %eax,%edi
  800c53:	83 f7 1f             	xor    $0x1f,%edi
  800c56:	75 48                	jne    800ca0 <__udivdi3+0xa0>
  800c58:	39 f0                	cmp    %esi,%eax
  800c5a:	72 06                	jb     800c62 <__udivdi3+0x62>
  800c5c:	31 c0                	xor    %eax,%eax
  800c5e:	39 dd                	cmp    %ebx,%ebp
  800c60:	72 de                	jb     800c40 <__udivdi3+0x40>
  800c62:	b8 01 00 00 00       	mov    $0x1,%eax
  800c67:	eb d7                	jmp    800c40 <__udivdi3+0x40>
  800c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800c70:	89 d9                	mov    %ebx,%ecx
  800c72:	85 db                	test   %ebx,%ebx
  800c74:	75 0b                	jne    800c81 <__udivdi3+0x81>
  800c76:	b8 01 00 00 00       	mov    $0x1,%eax
  800c7b:	31 d2                	xor    %edx,%edx
  800c7d:	f7 f3                	div    %ebx
  800c7f:	89 c1                	mov    %eax,%ecx
  800c81:	31 d2                	xor    %edx,%edx
  800c83:	89 f0                	mov    %esi,%eax
  800c85:	f7 f1                	div    %ecx
  800c87:	89 c6                	mov    %eax,%esi
  800c89:	89 e8                	mov    %ebp,%eax
  800c8b:	89 f7                	mov    %esi,%edi
  800c8d:	f7 f1                	div    %ecx
  800c8f:	89 fa                	mov    %edi,%edx
  800c91:	83 c4 1c             	add    $0x1c,%esp
  800c94:	5b                   	pop    %ebx
  800c95:	5e                   	pop    %esi
  800c96:	5f                   	pop    %edi
  800c97:	5d                   	pop    %ebp
  800c98:	c3                   	ret
  800c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800ca0:	89 f9                	mov    %edi,%ecx
  800ca2:	ba 20 00 00 00       	mov    $0x20,%edx
  800ca7:	29 fa                	sub    %edi,%edx
  800ca9:	d3 e0                	shl    %cl,%eax
  800cab:	89 44 24 08          	mov    %eax,0x8(%esp)
  800caf:	89 d1                	mov    %edx,%ecx
  800cb1:	89 d8                	mov    %ebx,%eax
  800cb3:	d3 e8                	shr    %cl,%eax
  800cb5:	89 c1                	mov    %eax,%ecx
  800cb7:	8b 44 24 08          	mov    0x8(%esp),%eax
  800cbb:	09 c1                	or     %eax,%ecx
  800cbd:	89 f0                	mov    %esi,%eax
  800cbf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800cc3:	89 f9                	mov    %edi,%ecx
  800cc5:	d3 e3                	shl    %cl,%ebx
  800cc7:	89 d1                	mov    %edx,%ecx
  800cc9:	d3 e8                	shr    %cl,%eax
  800ccb:	89 f9                	mov    %edi,%ecx
  800ccd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800cd1:	89 eb                	mov    %ebp,%ebx
  800cd3:	d3 e6                	shl    %cl,%esi
  800cd5:	89 d1                	mov    %edx,%ecx
  800cd7:	d3 eb                	shr    %cl,%ebx
  800cd9:	09 f3                	or     %esi,%ebx
  800cdb:	89 c6                	mov    %eax,%esi
  800cdd:	89 f2                	mov    %esi,%edx
  800cdf:	89 d8                	mov    %ebx,%eax
  800ce1:	f7 74 24 08          	divl   0x8(%esp)
  800ce5:	89 d6                	mov    %edx,%esi
  800ce7:	89 c3                	mov    %eax,%ebx
  800ce9:	f7 64 24 0c          	mull   0xc(%esp)
  800ced:	39 d6                	cmp    %edx,%esi
  800cef:	72 1f                	jb     800d10 <__udivdi3+0x110>
  800cf1:	89 f9                	mov    %edi,%ecx
  800cf3:	d3 e5                	shl    %cl,%ebp
  800cf5:	39 c5                	cmp    %eax,%ebp
  800cf7:	73 04                	jae    800cfd <__udivdi3+0xfd>
  800cf9:	39 d6                	cmp    %edx,%esi
  800cfb:	74 13                	je     800d10 <__udivdi3+0x110>
  800cfd:	89 d8                	mov    %ebx,%eax
  800cff:	31 ff                	xor    %edi,%edi
  800d01:	e9 3a ff ff ff       	jmp    800c40 <__udivdi3+0x40>
  800d06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d0d:	00 
  800d0e:	66 90                	xchg   %ax,%ax
  800d10:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d13:	31 ff                	xor    %edi,%edi
  800d15:	e9 26 ff ff ff       	jmp    800c40 <__udivdi3+0x40>
  800d1a:	66 90                	xchg   %ax,%ax
  800d1c:	66 90                	xchg   %ax,%ax
  800d1e:	66 90                	xchg   %ax,%ax

00800d20 <__umoddi3>:
  800d20:	f3 0f 1e fb          	endbr32
  800d24:	55                   	push   %ebp
  800d25:	57                   	push   %edi
  800d26:	56                   	push   %esi
  800d27:	53                   	push   %ebx
  800d28:	83 ec 1c             	sub    $0x1c,%esp
  800d2b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d2f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d33:	8b 74 24 30          	mov    0x30(%esp),%esi
  800d37:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800d3b:	89 da                	mov    %ebx,%edx
  800d3d:	85 c0                	test   %eax,%eax
  800d3f:	75 17                	jne    800d58 <__umoddi3+0x38>
  800d41:	39 fb                	cmp    %edi,%ebx
  800d43:	73 53                	jae    800d98 <__umoddi3+0x78>
  800d45:	89 f0                	mov    %esi,%eax
  800d47:	f7 f7                	div    %edi
  800d49:	89 d0                	mov    %edx,%eax
  800d4b:	31 d2                	xor    %edx,%edx
  800d4d:	83 c4 1c             	add    $0x1c,%esp
  800d50:	5b                   	pop    %ebx
  800d51:	5e                   	pop    %esi
  800d52:	5f                   	pop    %edi
  800d53:	5d                   	pop    %ebp
  800d54:	c3                   	ret
  800d55:	8d 76 00             	lea    0x0(%esi),%esi
  800d58:	89 f1                	mov    %esi,%ecx
  800d5a:	39 c3                	cmp    %eax,%ebx
  800d5c:	73 12                	jae    800d70 <__umoddi3+0x50>
  800d5e:	89 f0                	mov    %esi,%eax
  800d60:	83 c4 1c             	add    $0x1c,%esp
  800d63:	5b                   	pop    %ebx
  800d64:	5e                   	pop    %esi
  800d65:	5f                   	pop    %edi
  800d66:	5d                   	pop    %ebp
  800d67:	c3                   	ret
  800d68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d6f:	00 
  800d70:	0f bd e8             	bsr    %eax,%ebp
  800d73:	83 f5 1f             	xor    $0x1f,%ebp
  800d76:	75 48                	jne    800dc0 <__umoddi3+0xa0>
  800d78:	39 d8                	cmp    %ebx,%eax
  800d7a:	0f 82 d0 00 00 00    	jb     800e50 <__umoddi3+0x130>
  800d80:	39 fe                	cmp    %edi,%esi
  800d82:	0f 83 c8 00 00 00    	jae    800e50 <__umoddi3+0x130>
  800d88:	89 c8                	mov    %ecx,%eax
  800d8a:	83 c4 1c             	add    $0x1c,%esp
  800d8d:	5b                   	pop    %ebx
  800d8e:	5e                   	pop    %esi
  800d8f:	5f                   	pop    %edi
  800d90:	5d                   	pop    %ebp
  800d91:	c3                   	ret
  800d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800d98:	89 f9                	mov    %edi,%ecx
  800d9a:	85 ff                	test   %edi,%edi
  800d9c:	75 0b                	jne    800da9 <__umoddi3+0x89>
  800d9e:	b8 01 00 00 00       	mov    $0x1,%eax
  800da3:	31 d2                	xor    %edx,%edx
  800da5:	f7 f7                	div    %edi
  800da7:	89 c1                	mov    %eax,%ecx
  800da9:	89 d8                	mov    %ebx,%eax
  800dab:	31 d2                	xor    %edx,%edx
  800dad:	f7 f1                	div    %ecx
  800daf:	89 f0                	mov    %esi,%eax
  800db1:	f7 f1                	div    %ecx
  800db3:	89 d0                	mov    %edx,%eax
  800db5:	31 d2                	xor    %edx,%edx
  800db7:	eb 94                	jmp    800d4d <__umoddi3+0x2d>
  800db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800dc0:	89 e9                	mov    %ebp,%ecx
  800dc2:	ba 20 00 00 00       	mov    $0x20,%edx
  800dc7:	29 ea                	sub    %ebp,%edx
  800dc9:	d3 e0                	shl    %cl,%eax
  800dcb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800dcf:	89 d1                	mov    %edx,%ecx
  800dd1:	89 f8                	mov    %edi,%eax
  800dd3:	d3 e8                	shr    %cl,%eax
  800dd5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800dd9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800ddd:	89 c1                	mov    %eax,%ecx
  800ddf:	8b 44 24 08          	mov    0x8(%esp),%eax
  800de3:	09 c1                	or     %eax,%ecx
  800de5:	89 d8                	mov    %ebx,%eax
  800de7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800deb:	89 e9                	mov    %ebp,%ecx
  800ded:	d3 e7                	shl    %cl,%edi
  800def:	89 d1                	mov    %edx,%ecx
  800df1:	d3 e8                	shr    %cl,%eax
  800df3:	89 e9                	mov    %ebp,%ecx
  800df5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800df9:	d3 e3                	shl    %cl,%ebx
  800dfb:	89 c7                	mov    %eax,%edi
  800dfd:	89 d1                	mov    %edx,%ecx
  800dff:	89 f0                	mov    %esi,%eax
  800e01:	d3 e8                	shr    %cl,%eax
  800e03:	89 fa                	mov    %edi,%edx
  800e05:	89 e9                	mov    %ebp,%ecx
  800e07:	09 d8                	or     %ebx,%eax
  800e09:	d3 e6                	shl    %cl,%esi
  800e0b:	f7 74 24 08          	divl   0x8(%esp)
  800e0f:	89 d3                	mov    %edx,%ebx
  800e11:	f7 64 24 0c          	mull   0xc(%esp)
  800e15:	89 c7                	mov    %eax,%edi
  800e17:	89 d1                	mov    %edx,%ecx
  800e19:	39 d3                	cmp    %edx,%ebx
  800e1b:	72 06                	jb     800e23 <__umoddi3+0x103>
  800e1d:	75 10                	jne    800e2f <__umoddi3+0x10f>
  800e1f:	39 c6                	cmp    %eax,%esi
  800e21:	73 0c                	jae    800e2f <__umoddi3+0x10f>
  800e23:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e27:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e2b:	89 d1                	mov    %edx,%ecx
  800e2d:	89 c7                	mov    %eax,%edi
  800e2f:	89 f2                	mov    %esi,%edx
  800e31:	29 fa                	sub    %edi,%edx
  800e33:	19 cb                	sbb    %ecx,%ebx
  800e35:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800e3a:	89 d8                	mov    %ebx,%eax
  800e3c:	d3 e0                	shl    %cl,%eax
  800e3e:	89 e9                	mov    %ebp,%ecx
  800e40:	d3 ea                	shr    %cl,%edx
  800e42:	d3 eb                	shr    %cl,%ebx
  800e44:	09 d0                	or     %edx,%eax
  800e46:	89 da                	mov    %ebx,%edx
  800e48:	83 c4 1c             	add    $0x1c,%esp
  800e4b:	5b                   	pop    %ebx
  800e4c:	5e                   	pop    %esi
  800e4d:	5f                   	pop    %edi
  800e4e:	5d                   	pop    %ebp
  800e4f:	c3                   	ret
  800e50:	89 da                	mov    %ebx,%edx
  800e52:	89 f1                	mov    %esi,%ecx
  800e54:	29 f9                	sub    %edi,%ecx
  800e56:	19 c2                	sbb    %eax,%edx
  800e58:	89 c8                	mov    %ecx,%eax
  800e5a:	e9 2b ff ff ff       	jmp    800d8a <__umoddi3+0x6a>
