
obj/user/spin0:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 6d 00 00 00       	call   80009e <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	57                   	push   %edi
  800037:	56                   	push   %esi
  800038:	53                   	push   %ebx
  800039:	83 ec 0c             	sub    $0xc,%esp
  80003c:	e8 7f 0a 00 00       	call   800ac0 <sys_getenvid>
  800041:	89 c7                	mov    %eax,%edi
  800043:	89 c6                	mov    %eax,%esi
  800045:	83 e6 01             	and    $0x1,%esi
  800048:	b8 00 00 00 00       	mov    $0x0,%eax
  80004d:	eb 27                	jmp    800076 <umain+0x43>
  80004f:	b8 01 80 00 00       	mov    $0x8001,%eax
  800054:	83 e8 01             	sub    $0x1,%eax
  800057:	75 fb                	jne    800054 <umain+0x21>
  800059:	85 f6                	test   %esi,%esi
  80005b:	74 2d                	je     80008a <umain+0x57>
  80005d:	83 ec 04             	sub    $0x4,%esp
  800060:	53                   	push   %ebx
  800061:	57                   	push   %edi
  800062:	68 c0 0e 80 00       	push   $0x800ec0
  800067:	e8 26 01 00 00       	call   800192 <cprintf>
  80006c:	e8 73 0a 00 00       	call   800ae4 <sys_yield>
  800071:	83 c4 10             	add    $0x10,%esp
  800074:	89 d8                	mov    %ebx,%eax
  800076:	8d 58 01             	lea    0x1(%eax),%ebx
  800079:	83 f8 04             	cmp    $0x4,%eax
  80007c:	76 d1                	jbe    80004f <umain+0x1c>
  80007e:	85 f6                	test   %esi,%esi
  800080:	74 cd                	je     80004f <umain+0x1c>
  800082:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800085:	5b                   	pop    %ebx
  800086:	5e                   	pop    %esi
  800087:	5f                   	pop    %edi
  800088:	5d                   	pop    %ebp
  800089:	c3                   	ret
  80008a:	83 ec 04             	sub    $0x4,%esp
  80008d:	53                   	push   %ebx
  80008e:	57                   	push   %edi
  80008f:	68 e8 0e 80 00       	push   $0x800ee8
  800094:	e8 f9 00 00 00       	call   800192 <cprintf>
  800099:	83 c4 10             	add    $0x10,%esp
  80009c:	eb d6                	jmp    800074 <umain+0x41>

0080009e <libmain>:
  80009e:	55                   	push   %ebp
  80009f:	89 e5                	mov    %esp,%ebp
  8000a1:	56                   	push   %esi
  8000a2:	53                   	push   %ebx
  8000a3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000a6:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000a9:	e8 12 0a 00 00       	call   800ac0 <sys_getenvid>
  8000ae:	85 c0                	test   %eax,%eax
  8000b0:	78 15                	js     8000c7 <libmain+0x29>
  8000b2:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000b7:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8000bd:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8000c2:	a3 04 20 80 00       	mov    %eax,0x802004
  8000c7:	85 db                	test   %ebx,%ebx
  8000c9:	7e 07                	jle    8000d2 <libmain+0x34>
  8000cb:	8b 06                	mov    (%esi),%eax
  8000cd:	a3 00 20 80 00       	mov    %eax,0x802000
  8000d2:	83 ec 08             	sub    $0x8,%esp
  8000d5:	56                   	push   %esi
  8000d6:	53                   	push   %ebx
  8000d7:	e8 57 ff ff ff       	call   800033 <umain>
  8000dc:	e8 0a 00 00 00       	call   8000eb <exit>
  8000e1:	83 c4 10             	add    $0x10,%esp
  8000e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8000e7:	5b                   	pop    %ebx
  8000e8:	5e                   	pop    %esi
  8000e9:	5d                   	pop    %ebp
  8000ea:	c3                   	ret

008000eb <exit>:
  8000eb:	55                   	push   %ebp
  8000ec:	89 e5                	mov    %esp,%ebp
  8000ee:	83 ec 14             	sub    $0x14,%esp
  8000f1:	6a 00                	push   $0x0
  8000f3:	e8 a6 09 00 00       	call   800a9e <sys_env_destroy>
  8000f8:	83 c4 10             	add    $0x10,%esp
  8000fb:	c9                   	leave
  8000fc:	c3                   	ret

008000fd <putch>:
  8000fd:	55                   	push   %ebp
  8000fe:	89 e5                	mov    %esp,%ebp
  800100:	53                   	push   %ebx
  800101:	83 ec 04             	sub    $0x4,%esp
  800104:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800107:	8b 13                	mov    (%ebx),%edx
  800109:	8d 42 01             	lea    0x1(%edx),%eax
  80010c:	89 03                	mov    %eax,(%ebx)
  80010e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800111:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800115:	3d ff 00 00 00       	cmp    $0xff,%eax
  80011a:	74 09                	je     800125 <putch+0x28>
  80011c:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800120:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800123:	c9                   	leave
  800124:	c3                   	ret
  800125:	83 ec 08             	sub    $0x8,%esp
  800128:	68 ff 00 00 00       	push   $0xff
  80012d:	8d 43 08             	lea    0x8(%ebx),%eax
  800130:	50                   	push   %eax
  800131:	e8 1e 09 00 00       	call   800a54 <sys_cputs>
  800136:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  80013c:	83 c4 10             	add    $0x10,%esp
  80013f:	eb db                	jmp    80011c <putch+0x1f>

00800141 <vcprintf>:
  800141:	55                   	push   %ebp
  800142:	89 e5                	mov    %esp,%ebp
  800144:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80014a:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800151:	00 00 00 
  800154:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  80015b:	00 00 00 
  80015e:	ff 75 0c             	push   0xc(%ebp)
  800161:	ff 75 08             	push   0x8(%ebp)
  800164:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80016a:	50                   	push   %eax
  80016b:	68 fd 00 80 00       	push   $0x8000fd
  800170:	e8 74 01 00 00       	call   8002e9 <vprintfmt>
  800175:	83 c4 08             	add    $0x8,%esp
  800178:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  80017e:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800184:	50                   	push   %eax
  800185:	e8 ca 08 00 00       	call   800a54 <sys_cputs>
  80018a:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800190:	c9                   	leave
  800191:	c3                   	ret

00800192 <cprintf>:
  800192:	55                   	push   %ebp
  800193:	89 e5                	mov    %esp,%ebp
  800195:	83 ec 10             	sub    $0x10,%esp
  800198:	8d 45 0c             	lea    0xc(%ebp),%eax
  80019b:	50                   	push   %eax
  80019c:	ff 75 08             	push   0x8(%ebp)
  80019f:	e8 9d ff ff ff       	call   800141 <vcprintf>
  8001a4:	c9                   	leave
  8001a5:	c3                   	ret

008001a6 <printnum>:
  8001a6:	55                   	push   %ebp
  8001a7:	89 e5                	mov    %esp,%ebp
  8001a9:	57                   	push   %edi
  8001aa:	56                   	push   %esi
  8001ab:	53                   	push   %ebx
  8001ac:	83 ec 1c             	sub    $0x1c,%esp
  8001af:	89 c7                	mov    %eax,%edi
  8001b1:	89 d6                	mov    %edx,%esi
  8001b3:	8b 45 08             	mov    0x8(%ebp),%eax
  8001b6:	8b 55 0c             	mov    0xc(%ebp),%edx
  8001b9:	89 d1                	mov    %edx,%ecx
  8001bb:	89 c2                	mov    %eax,%edx
  8001bd:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8001c0:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8001c3:	8b 45 10             	mov    0x10(%ebp),%eax
  8001c6:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8001c9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8001cc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8001d3:	39 c2                	cmp    %eax,%edx
  8001d5:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8001d8:	72 3e                	jb     800218 <printnum+0x72>
  8001da:	83 ec 0c             	sub    $0xc,%esp
  8001dd:	ff 75 18             	push   0x18(%ebp)
  8001e0:	83 eb 01             	sub    $0x1,%ebx
  8001e3:	53                   	push   %ebx
  8001e4:	50                   	push   %eax
  8001e5:	83 ec 08             	sub    $0x8,%esp
  8001e8:	ff 75 e4             	push   -0x1c(%ebp)
  8001eb:	ff 75 e0             	push   -0x20(%ebp)
  8001ee:	ff 75 dc             	push   -0x24(%ebp)
  8001f1:	ff 75 d8             	push   -0x28(%ebp)
  8001f4:	e8 57 0a 00 00       	call   800c50 <__udivdi3>
  8001f9:	83 c4 18             	add    $0x18,%esp
  8001fc:	52                   	push   %edx
  8001fd:	50                   	push   %eax
  8001fe:	89 f2                	mov    %esi,%edx
  800200:	89 f8                	mov    %edi,%eax
  800202:	e8 9f ff ff ff       	call   8001a6 <printnum>
  800207:	83 c4 20             	add    $0x20,%esp
  80020a:	eb 13                	jmp    80021f <printnum+0x79>
  80020c:	83 ec 08             	sub    $0x8,%esp
  80020f:	56                   	push   %esi
  800210:	ff 75 18             	push   0x18(%ebp)
  800213:	ff d7                	call   *%edi
  800215:	83 c4 10             	add    $0x10,%esp
  800218:	83 eb 01             	sub    $0x1,%ebx
  80021b:	85 db                	test   %ebx,%ebx
  80021d:	7f ed                	jg     80020c <printnum+0x66>
  80021f:	83 ec 08             	sub    $0x8,%esp
  800222:	56                   	push   %esi
  800223:	83 ec 04             	sub    $0x4,%esp
  800226:	ff 75 e4             	push   -0x1c(%ebp)
  800229:	ff 75 e0             	push   -0x20(%ebp)
  80022c:	ff 75 dc             	push   -0x24(%ebp)
  80022f:	ff 75 d8             	push   -0x28(%ebp)
  800232:	e8 39 0b 00 00       	call   800d70 <__umoddi3>
  800237:	83 c4 14             	add    $0x14,%esp
  80023a:	0f be 80 3d 0f 80 00 	movsbl 0x800f3d(%eax),%eax
  800241:	50                   	push   %eax
  800242:	ff d7                	call   *%edi
  800244:	83 c4 10             	add    $0x10,%esp
  800247:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80024a:	5b                   	pop    %ebx
  80024b:	5e                   	pop    %esi
  80024c:	5f                   	pop    %edi
  80024d:	5d                   	pop    %ebp
  80024e:	c3                   	ret

0080024f <getuint>:
  80024f:	83 fa 01             	cmp    $0x1,%edx
  800252:	7f 13                	jg     800267 <getuint+0x18>
  800254:	85 d2                	test   %edx,%edx
  800256:	74 1c                	je     800274 <getuint+0x25>
  800258:	8b 10                	mov    (%eax),%edx
  80025a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80025d:	89 08                	mov    %ecx,(%eax)
  80025f:	8b 02                	mov    (%edx),%eax
  800261:	ba 00 00 00 00       	mov    $0x0,%edx
  800266:	c3                   	ret
  800267:	8b 10                	mov    (%eax),%edx
  800269:	8d 4a 08             	lea    0x8(%edx),%ecx
  80026c:	89 08                	mov    %ecx,(%eax)
  80026e:	8b 02                	mov    (%edx),%eax
  800270:	8b 52 04             	mov    0x4(%edx),%edx
  800273:	c3                   	ret
  800274:	8b 10                	mov    (%eax),%edx
  800276:	8d 4a 04             	lea    0x4(%edx),%ecx
  800279:	89 08                	mov    %ecx,(%eax)
  80027b:	8b 02                	mov    (%edx),%eax
  80027d:	ba 00 00 00 00       	mov    $0x0,%edx
  800282:	c3                   	ret

00800283 <getint>:
  800283:	83 fa 01             	cmp    $0x1,%edx
  800286:	7f 0f                	jg     800297 <getint+0x14>
  800288:	85 d2                	test   %edx,%edx
  80028a:	74 18                	je     8002a4 <getint+0x21>
  80028c:	8b 10                	mov    (%eax),%edx
  80028e:	8d 4a 04             	lea    0x4(%edx),%ecx
  800291:	89 08                	mov    %ecx,(%eax)
  800293:	8b 02                	mov    (%edx),%eax
  800295:	99                   	cltd
  800296:	c3                   	ret
  800297:	8b 10                	mov    (%eax),%edx
  800299:	8d 4a 08             	lea    0x8(%edx),%ecx
  80029c:	89 08                	mov    %ecx,(%eax)
  80029e:	8b 02                	mov    (%edx),%eax
  8002a0:	8b 52 04             	mov    0x4(%edx),%edx
  8002a3:	c3                   	ret
  8002a4:	8b 10                	mov    (%eax),%edx
  8002a6:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002a9:	89 08                	mov    %ecx,(%eax)
  8002ab:	8b 02                	mov    (%edx),%eax
  8002ad:	99                   	cltd
  8002ae:	c3                   	ret

008002af <sprintputch>:
  8002af:	55                   	push   %ebp
  8002b0:	89 e5                	mov    %esp,%ebp
  8002b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  8002b5:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8002b9:	8b 10                	mov    (%eax),%edx
  8002bb:	3b 50 04             	cmp    0x4(%eax),%edx
  8002be:	73 0a                	jae    8002ca <sprintputch+0x1b>
  8002c0:	8d 4a 01             	lea    0x1(%edx),%ecx
  8002c3:	89 08                	mov    %ecx,(%eax)
  8002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  8002c8:	88 02                	mov    %al,(%edx)
  8002ca:	5d                   	pop    %ebp
  8002cb:	c3                   	ret

008002cc <printfmt>:
  8002cc:	55                   	push   %ebp
  8002cd:	89 e5                	mov    %esp,%ebp
  8002cf:	83 ec 08             	sub    $0x8,%esp
  8002d2:	8d 45 14             	lea    0x14(%ebp),%eax
  8002d5:	50                   	push   %eax
  8002d6:	ff 75 10             	push   0x10(%ebp)
  8002d9:	ff 75 0c             	push   0xc(%ebp)
  8002dc:	ff 75 08             	push   0x8(%ebp)
  8002df:	e8 05 00 00 00       	call   8002e9 <vprintfmt>
  8002e4:	83 c4 10             	add    $0x10,%esp
  8002e7:	c9                   	leave
  8002e8:	c3                   	ret

008002e9 <vprintfmt>:
  8002e9:	55                   	push   %ebp
  8002ea:	89 e5                	mov    %esp,%ebp
  8002ec:	57                   	push   %edi
  8002ed:	56                   	push   %esi
  8002ee:	53                   	push   %ebx
  8002ef:	83 ec 2c             	sub    $0x2c,%esp
  8002f2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8002f5:	8b 75 0c             	mov    0xc(%ebp),%esi
  8002f8:	8b 7d 10             	mov    0x10(%ebp),%edi
  8002fb:	eb 0a                	jmp    800307 <vprintfmt+0x1e>
  8002fd:	83 ec 08             	sub    $0x8,%esp
  800300:	56                   	push   %esi
  800301:	50                   	push   %eax
  800302:	ff d3                	call   *%ebx
  800304:	83 c4 10             	add    $0x10,%esp
  800307:	83 c7 01             	add    $0x1,%edi
  80030a:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  80030e:	83 f8 25             	cmp    $0x25,%eax
  800311:	74 0c                	je     80031f <vprintfmt+0x36>
  800313:	85 c0                	test   %eax,%eax
  800315:	75 e6                	jne    8002fd <vprintfmt+0x14>
  800317:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80031a:	5b                   	pop    %ebx
  80031b:	5e                   	pop    %esi
  80031c:	5f                   	pop    %edi
  80031d:	5d                   	pop    %ebp
  80031e:	c3                   	ret
  80031f:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800323:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80032a:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800331:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800338:	b9 00 00 00 00       	mov    $0x0,%ecx
  80033d:	8d 47 01             	lea    0x1(%edi),%eax
  800340:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800343:	0f b6 17             	movzbl (%edi),%edx
  800346:	8d 42 dd             	lea    -0x23(%edx),%eax
  800349:	3c 55                	cmp    $0x55,%al
  80034b:	0f 87 c3 02 00 00    	ja     800614 <vprintfmt+0x32b>
  800351:	0f b6 c0             	movzbl %al,%eax
  800354:	ff 24 85 40 10 80 00 	jmp    *0x801040(,%eax,4)
  80035b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80035e:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800362:	eb d9                	jmp    80033d <vprintfmt+0x54>
  800364:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800367:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  80036b:	eb d0                	jmp    80033d <vprintfmt+0x54>
  80036d:	0f b6 d2             	movzbl %dl,%edx
  800370:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800373:	b8 00 00 00 00       	mov    $0x0,%eax
  800378:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80037b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  80037e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800382:	0f be 17             	movsbl (%edi),%edx
  800385:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800388:	83 f9 09             	cmp    $0x9,%ecx
  80038b:	77 52                	ja     8003df <vprintfmt+0xf6>
  80038d:	83 c7 01             	add    $0x1,%edi
  800390:	eb e9                	jmp    80037b <vprintfmt+0x92>
  800392:	8b 45 14             	mov    0x14(%ebp),%eax
  800395:	8d 50 04             	lea    0x4(%eax),%edx
  800398:	89 55 14             	mov    %edx,0x14(%ebp)
  80039b:	8b 00                	mov    (%eax),%eax
  80039d:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003a3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8003a7:	79 94                	jns    80033d <vprintfmt+0x54>
  8003a9:	8b 45 d0             	mov    -0x30(%ebp),%eax
  8003ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003af:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003b6:	eb 85                	jmp    80033d <vprintfmt+0x54>
  8003b8:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8003bb:	85 d2                	test   %edx,%edx
  8003bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8003c2:	0f 49 c2             	cmovns %edx,%eax
  8003c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003c8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003cb:	e9 6d ff ff ff       	jmp    80033d <vprintfmt+0x54>
  8003d0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003d3:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8003da:	e9 5e ff ff ff       	jmp    80033d <vprintfmt+0x54>
  8003df:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8003e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003e5:	eb bc                	jmp    8003a3 <vprintfmt+0xba>
  8003e7:	83 c1 01             	add    $0x1,%ecx
  8003ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003ed:	e9 4b ff ff ff       	jmp    80033d <vprintfmt+0x54>
  8003f2:	8b 45 14             	mov    0x14(%ebp),%eax
  8003f5:	8d 50 04             	lea    0x4(%eax),%edx
  8003f8:	89 55 14             	mov    %edx,0x14(%ebp)
  8003fb:	83 ec 08             	sub    $0x8,%esp
  8003fe:	56                   	push   %esi
  8003ff:	ff 30                	push   (%eax)
  800401:	ff d3                	call   *%ebx
  800403:	83 c4 10             	add    $0x10,%esp
  800406:	e9 a0 01 00 00       	jmp    8005ab <vprintfmt+0x2c2>
  80040b:	8b 45 14             	mov    0x14(%ebp),%eax
  80040e:	8d 50 04             	lea    0x4(%eax),%edx
  800411:	89 55 14             	mov    %edx,0x14(%ebp)
  800414:	8b 10                	mov    (%eax),%edx
  800416:	89 d0                	mov    %edx,%eax
  800418:	f7 d8                	neg    %eax
  80041a:	0f 48 c2             	cmovs  %edx,%eax
  80041d:	83 f8 08             	cmp    $0x8,%eax
  800420:	7f 20                	jg     800442 <vprintfmt+0x159>
  800422:	8b 14 85 a0 11 80 00 	mov    0x8011a0(,%eax,4),%edx
  800429:	85 d2                	test   %edx,%edx
  80042b:	74 15                	je     800442 <vprintfmt+0x159>
  80042d:	52                   	push   %edx
  80042e:	68 5e 0f 80 00       	push   $0x800f5e
  800433:	56                   	push   %esi
  800434:	53                   	push   %ebx
  800435:	e8 92 fe ff ff       	call   8002cc <printfmt>
  80043a:	83 c4 10             	add    $0x10,%esp
  80043d:	e9 69 01 00 00       	jmp    8005ab <vprintfmt+0x2c2>
  800442:	50                   	push   %eax
  800443:	68 55 0f 80 00       	push   $0x800f55
  800448:	56                   	push   %esi
  800449:	53                   	push   %ebx
  80044a:	e8 7d fe ff ff       	call   8002cc <printfmt>
  80044f:	83 c4 10             	add    $0x10,%esp
  800452:	e9 54 01 00 00       	jmp    8005ab <vprintfmt+0x2c2>
  800457:	8b 45 14             	mov    0x14(%ebp),%eax
  80045a:	8d 50 04             	lea    0x4(%eax),%edx
  80045d:	89 55 14             	mov    %edx,0x14(%ebp)
  800460:	8b 08                	mov    (%eax),%ecx
  800462:	85 c9                	test   %ecx,%ecx
  800464:	b8 4e 0f 80 00       	mov    $0x800f4e,%eax
  800469:	0f 45 c1             	cmovne %ecx,%eax
  80046c:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80046f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800473:	7e 06                	jle    80047b <vprintfmt+0x192>
  800475:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800479:	75 0b                	jne    800486 <vprintfmt+0x19d>
  80047b:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  80047e:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800481:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800484:	eb 5c                	jmp    8004e2 <vprintfmt+0x1f9>
  800486:	83 ec 08             	sub    $0x8,%esp
  800489:	ff 75 d0             	push   -0x30(%ebp)
  80048c:	ff 75 cc             	push   -0x34(%ebp)
  80048f:	e8 20 02 00 00       	call   8006b4 <strnlen>
  800494:	89 c2                	mov    %eax,%edx
  800496:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800499:	29 d0                	sub    %edx,%eax
  80049b:	83 c4 10             	add    $0x10,%esp
  80049e:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8004a2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004a5:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004a8:	89 c3                	mov    %eax,%ebx
  8004aa:	eb 0e                	jmp    8004ba <vprintfmt+0x1d1>
  8004ac:	83 ec 08             	sub    $0x8,%esp
  8004af:	56                   	push   %esi
  8004b0:	57                   	push   %edi
  8004b1:	ff 55 08             	call   *0x8(%ebp)
  8004b4:	83 eb 01             	sub    $0x1,%ebx
  8004b7:	83 c4 10             	add    $0x10,%esp
  8004ba:	85 db                	test   %ebx,%ebx
  8004bc:	7f ee                	jg     8004ac <vprintfmt+0x1c3>
  8004be:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004c4:	85 c0                	test   %eax,%eax
  8004c6:	ba 00 00 00 00       	mov    $0x0,%edx
  8004cb:	0f 49 d0             	cmovns %eax,%edx
  8004ce:	29 d0                	sub    %edx,%eax
  8004d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004d3:	eb a6                	jmp    80047b <vprintfmt+0x192>
  8004d5:	83 ec 08             	sub    $0x8,%esp
  8004d8:	56                   	push   %esi
  8004d9:	52                   	push   %edx
  8004da:	ff 55 08             	call   *0x8(%ebp)
  8004dd:	83 c4 10             	add    $0x10,%esp
  8004e0:	89 d9                	mov    %ebx,%ecx
  8004e2:	8d 59 01             	lea    0x1(%ecx),%ebx
  8004e5:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8004e9:	0f be d0             	movsbl %al,%edx
  8004ec:	85 d2                	test   %edx,%edx
  8004ee:	74 28                	je     800518 <vprintfmt+0x22f>
  8004f0:	85 ff                	test   %edi,%edi
  8004f2:	78 05                	js     8004f9 <vprintfmt+0x210>
  8004f4:	83 ef 01             	sub    $0x1,%edi
  8004f7:	78 2e                	js     800527 <vprintfmt+0x23e>
  8004f9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8004fd:	74 d6                	je     8004d5 <vprintfmt+0x1ec>
  8004ff:	0f be c0             	movsbl %al,%eax
  800502:	83 e8 20             	sub    $0x20,%eax
  800505:	83 f8 5e             	cmp    $0x5e,%eax
  800508:	76 cb                	jbe    8004d5 <vprintfmt+0x1ec>
  80050a:	83 ec 08             	sub    $0x8,%esp
  80050d:	56                   	push   %esi
  80050e:	6a 3f                	push   $0x3f
  800510:	ff 55 08             	call   *0x8(%ebp)
  800513:	83 c4 10             	add    $0x10,%esp
  800516:	eb c8                	jmp    8004e0 <vprintfmt+0x1f7>
  800518:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80051b:	8b 7d cc             	mov    -0x34(%ebp),%edi
  80051e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800521:	01 c7                	add    %eax,%edi
  800523:	29 cf                	sub    %ecx,%edi
  800525:	eb 13                	jmp    80053a <vprintfmt+0x251>
  800527:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80052a:	eb ef                	jmp    80051b <vprintfmt+0x232>
  80052c:	83 ec 08             	sub    $0x8,%esp
  80052f:	56                   	push   %esi
  800530:	6a 20                	push   $0x20
  800532:	ff d3                	call   *%ebx
  800534:	83 ef 01             	sub    $0x1,%edi
  800537:	83 c4 10             	add    $0x10,%esp
  80053a:	85 ff                	test   %edi,%edi
  80053c:	7f ee                	jg     80052c <vprintfmt+0x243>
  80053e:	eb 6b                	jmp    8005ab <vprintfmt+0x2c2>
  800540:	89 ca                	mov    %ecx,%edx
  800542:	8d 45 14             	lea    0x14(%ebp),%eax
  800545:	e8 39 fd ff ff       	call   800283 <getint>
  80054a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80054d:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800550:	85 d2                	test   %edx,%edx
  800552:	78 0b                	js     80055f <vprintfmt+0x276>
  800554:	89 d1                	mov    %edx,%ecx
  800556:	89 c2                	mov    %eax,%edx
  800558:	bf 0a 00 00 00       	mov    $0xa,%edi
  80055d:	eb 32                	jmp    800591 <vprintfmt+0x2a8>
  80055f:	83 ec 08             	sub    $0x8,%esp
  800562:	56                   	push   %esi
  800563:	6a 2d                	push   $0x2d
  800565:	ff d3                	call   *%ebx
  800567:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80056a:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  80056d:	f7 da                	neg    %edx
  80056f:	83 d1 00             	adc    $0x0,%ecx
  800572:	f7 d9                	neg    %ecx
  800574:	83 c4 10             	add    $0x10,%esp
  800577:	bf 0a 00 00 00       	mov    $0xa,%edi
  80057c:	eb 13                	jmp    800591 <vprintfmt+0x2a8>
  80057e:	89 ca                	mov    %ecx,%edx
  800580:	8d 45 14             	lea    0x14(%ebp),%eax
  800583:	e8 c7 fc ff ff       	call   80024f <getuint>
  800588:	89 d1                	mov    %edx,%ecx
  80058a:	89 c2                	mov    %eax,%edx
  80058c:	bf 0a 00 00 00       	mov    $0xa,%edi
  800591:	83 ec 0c             	sub    $0xc,%esp
  800594:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800598:	50                   	push   %eax
  800599:	ff 75 e0             	push   -0x20(%ebp)
  80059c:	57                   	push   %edi
  80059d:	51                   	push   %ecx
  80059e:	52                   	push   %edx
  80059f:	89 f2                	mov    %esi,%edx
  8005a1:	89 d8                	mov    %ebx,%eax
  8005a3:	e8 fe fb ff ff       	call   8001a6 <printnum>
  8005a8:	83 c4 20             	add    $0x20,%esp
  8005ab:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005ae:	e9 54 fd ff ff       	jmp    800307 <vprintfmt+0x1e>
  8005b3:	89 ca                	mov    %ecx,%edx
  8005b5:	8d 45 14             	lea    0x14(%ebp),%eax
  8005b8:	e8 92 fc ff ff       	call   80024f <getuint>
  8005bd:	89 d1                	mov    %edx,%ecx
  8005bf:	89 c2                	mov    %eax,%edx
  8005c1:	bf 08 00 00 00       	mov    $0x8,%edi
  8005c6:	eb c9                	jmp    800591 <vprintfmt+0x2a8>
  8005c8:	83 ec 08             	sub    $0x8,%esp
  8005cb:	56                   	push   %esi
  8005cc:	6a 30                	push   $0x30
  8005ce:	ff d3                	call   *%ebx
  8005d0:	83 c4 08             	add    $0x8,%esp
  8005d3:	56                   	push   %esi
  8005d4:	6a 78                	push   $0x78
  8005d6:	ff d3                	call   *%ebx
  8005d8:	8b 45 14             	mov    0x14(%ebp),%eax
  8005db:	8d 50 04             	lea    0x4(%eax),%edx
  8005de:	89 55 14             	mov    %edx,0x14(%ebp)
  8005e1:	8b 10                	mov    (%eax),%edx
  8005e3:	b9 00 00 00 00       	mov    $0x0,%ecx
  8005e8:	83 c4 10             	add    $0x10,%esp
  8005eb:	bf 10 00 00 00       	mov    $0x10,%edi
  8005f0:	eb 9f                	jmp    800591 <vprintfmt+0x2a8>
  8005f2:	89 ca                	mov    %ecx,%edx
  8005f4:	8d 45 14             	lea    0x14(%ebp),%eax
  8005f7:	e8 53 fc ff ff       	call   80024f <getuint>
  8005fc:	89 d1                	mov    %edx,%ecx
  8005fe:	89 c2                	mov    %eax,%edx
  800600:	bf 10 00 00 00       	mov    $0x10,%edi
  800605:	eb 8a                	jmp    800591 <vprintfmt+0x2a8>
  800607:	83 ec 08             	sub    $0x8,%esp
  80060a:	56                   	push   %esi
  80060b:	6a 25                	push   $0x25
  80060d:	ff d3                	call   *%ebx
  80060f:	83 c4 10             	add    $0x10,%esp
  800612:	eb 97                	jmp    8005ab <vprintfmt+0x2c2>
  800614:	83 ec 08             	sub    $0x8,%esp
  800617:	56                   	push   %esi
  800618:	6a 25                	push   $0x25
  80061a:	ff d3                	call   *%ebx
  80061c:	83 c4 10             	add    $0x10,%esp
  80061f:	89 f8                	mov    %edi,%eax
  800621:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800625:	74 05                	je     80062c <vprintfmt+0x343>
  800627:	83 e8 01             	sub    $0x1,%eax
  80062a:	eb f5                	jmp    800621 <vprintfmt+0x338>
  80062c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80062f:	e9 77 ff ff ff       	jmp    8005ab <vprintfmt+0x2c2>

00800634 <vsnprintf>:
  800634:	55                   	push   %ebp
  800635:	89 e5                	mov    %esp,%ebp
  800637:	83 ec 18             	sub    $0x18,%esp
  80063a:	8b 45 08             	mov    0x8(%ebp),%eax
  80063d:	8b 55 0c             	mov    0xc(%ebp),%edx
  800640:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800643:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800647:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80064a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800651:	85 c0                	test   %eax,%eax
  800653:	74 26                	je     80067b <vsnprintf+0x47>
  800655:	85 d2                	test   %edx,%edx
  800657:	7e 22                	jle    80067b <vsnprintf+0x47>
  800659:	ff 75 14             	push   0x14(%ebp)
  80065c:	ff 75 10             	push   0x10(%ebp)
  80065f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800662:	50                   	push   %eax
  800663:	68 af 02 80 00       	push   $0x8002af
  800668:	e8 7c fc ff ff       	call   8002e9 <vprintfmt>
  80066d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800670:	c6 00 00             	movb   $0x0,(%eax)
  800673:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800676:	83 c4 10             	add    $0x10,%esp
  800679:	c9                   	leave
  80067a:	c3                   	ret
  80067b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800680:	eb f7                	jmp    800679 <vsnprintf+0x45>

00800682 <snprintf>:
  800682:	55                   	push   %ebp
  800683:	89 e5                	mov    %esp,%ebp
  800685:	83 ec 08             	sub    $0x8,%esp
  800688:	8d 45 14             	lea    0x14(%ebp),%eax
  80068b:	50                   	push   %eax
  80068c:	ff 75 10             	push   0x10(%ebp)
  80068f:	ff 75 0c             	push   0xc(%ebp)
  800692:	ff 75 08             	push   0x8(%ebp)
  800695:	e8 9a ff ff ff       	call   800634 <vsnprintf>
  80069a:	c9                   	leave
  80069b:	c3                   	ret

0080069c <strlen>:
  80069c:	55                   	push   %ebp
  80069d:	89 e5                	mov    %esp,%ebp
  80069f:	8b 55 08             	mov    0x8(%ebp),%edx
  8006a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8006a7:	eb 03                	jmp    8006ac <strlen+0x10>
  8006a9:	83 c0 01             	add    $0x1,%eax
  8006ac:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8006b0:	75 f7                	jne    8006a9 <strlen+0xd>
  8006b2:	5d                   	pop    %ebp
  8006b3:	c3                   	ret

008006b4 <strnlen>:
  8006b4:	55                   	push   %ebp
  8006b5:	89 e5                	mov    %esp,%ebp
  8006b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006ba:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c2:	eb 03                	jmp    8006c7 <strnlen+0x13>
  8006c4:	83 c0 01             	add    $0x1,%eax
  8006c7:	39 d0                	cmp    %edx,%eax
  8006c9:	74 08                	je     8006d3 <strnlen+0x1f>
  8006cb:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8006cf:	75 f3                	jne    8006c4 <strnlen+0x10>
  8006d1:	89 c2                	mov    %eax,%edx
  8006d3:	89 d0                	mov    %edx,%eax
  8006d5:	5d                   	pop    %ebp
  8006d6:	c3                   	ret

008006d7 <strcpy>:
  8006d7:	55                   	push   %ebp
  8006d8:	89 e5                	mov    %esp,%ebp
  8006da:	53                   	push   %ebx
  8006db:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006de:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8006e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8006e6:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8006ea:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8006ed:	83 c0 01             	add    $0x1,%eax
  8006f0:	84 d2                	test   %dl,%dl
  8006f2:	75 f2                	jne    8006e6 <strcpy+0xf>
  8006f4:	89 c8                	mov    %ecx,%eax
  8006f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006f9:	c9                   	leave
  8006fa:	c3                   	ret

008006fb <strcat>:
  8006fb:	55                   	push   %ebp
  8006fc:	89 e5                	mov    %esp,%ebp
  8006fe:	53                   	push   %ebx
  8006ff:	83 ec 10             	sub    $0x10,%esp
  800702:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800705:	53                   	push   %ebx
  800706:	e8 91 ff ff ff       	call   80069c <strlen>
  80070b:	83 c4 08             	add    $0x8,%esp
  80070e:	ff 75 0c             	push   0xc(%ebp)
  800711:	01 d8                	add    %ebx,%eax
  800713:	50                   	push   %eax
  800714:	e8 be ff ff ff       	call   8006d7 <strcpy>
  800719:	89 d8                	mov    %ebx,%eax
  80071b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80071e:	c9                   	leave
  80071f:	c3                   	ret

00800720 <strncpy>:
  800720:	55                   	push   %ebp
  800721:	89 e5                	mov    %esp,%ebp
  800723:	56                   	push   %esi
  800724:	53                   	push   %ebx
  800725:	8b 75 08             	mov    0x8(%ebp),%esi
  800728:	8b 55 0c             	mov    0xc(%ebp),%edx
  80072b:	89 f3                	mov    %esi,%ebx
  80072d:	03 5d 10             	add    0x10(%ebp),%ebx
  800730:	89 f0                	mov    %esi,%eax
  800732:	eb 0f                	jmp    800743 <strncpy+0x23>
  800734:	83 c0 01             	add    $0x1,%eax
  800737:	0f b6 0a             	movzbl (%edx),%ecx
  80073a:	88 48 ff             	mov    %cl,-0x1(%eax)
  80073d:	80 f9 01             	cmp    $0x1,%cl
  800740:	83 da ff             	sbb    $0xffffffff,%edx
  800743:	39 d8                	cmp    %ebx,%eax
  800745:	75 ed                	jne    800734 <strncpy+0x14>
  800747:	89 f0                	mov    %esi,%eax
  800749:	5b                   	pop    %ebx
  80074a:	5e                   	pop    %esi
  80074b:	5d                   	pop    %ebp
  80074c:	c3                   	ret

0080074d <strlcpy>:
  80074d:	55                   	push   %ebp
  80074e:	89 e5                	mov    %esp,%ebp
  800750:	56                   	push   %esi
  800751:	53                   	push   %ebx
  800752:	8b 75 08             	mov    0x8(%ebp),%esi
  800755:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800758:	8b 55 10             	mov    0x10(%ebp),%edx
  80075b:	89 f0                	mov    %esi,%eax
  80075d:	85 d2                	test   %edx,%edx
  80075f:	74 21                	je     800782 <strlcpy+0x35>
  800761:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800765:	89 f2                	mov    %esi,%edx
  800767:	eb 09                	jmp    800772 <strlcpy+0x25>
  800769:	83 c1 01             	add    $0x1,%ecx
  80076c:	83 c2 01             	add    $0x1,%edx
  80076f:	88 5a ff             	mov    %bl,-0x1(%edx)
  800772:	39 c2                	cmp    %eax,%edx
  800774:	74 09                	je     80077f <strlcpy+0x32>
  800776:	0f b6 19             	movzbl (%ecx),%ebx
  800779:	84 db                	test   %bl,%bl
  80077b:	75 ec                	jne    800769 <strlcpy+0x1c>
  80077d:	89 d0                	mov    %edx,%eax
  80077f:	c6 00 00             	movb   $0x0,(%eax)
  800782:	29 f0                	sub    %esi,%eax
  800784:	5b                   	pop    %ebx
  800785:	5e                   	pop    %esi
  800786:	5d                   	pop    %ebp
  800787:	c3                   	ret

00800788 <strcmp>:
  800788:	55                   	push   %ebp
  800789:	89 e5                	mov    %esp,%ebp
  80078b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80078e:	8b 55 0c             	mov    0xc(%ebp),%edx
  800791:	eb 06                	jmp    800799 <strcmp+0x11>
  800793:	83 c1 01             	add    $0x1,%ecx
  800796:	83 c2 01             	add    $0x1,%edx
  800799:	0f b6 01             	movzbl (%ecx),%eax
  80079c:	84 c0                	test   %al,%al
  80079e:	74 04                	je     8007a4 <strcmp+0x1c>
  8007a0:	3a 02                	cmp    (%edx),%al
  8007a2:	74 ef                	je     800793 <strcmp+0xb>
  8007a4:	0f b6 c0             	movzbl %al,%eax
  8007a7:	0f b6 12             	movzbl (%edx),%edx
  8007aa:	29 d0                	sub    %edx,%eax
  8007ac:	5d                   	pop    %ebp
  8007ad:	c3                   	ret

008007ae <strncmp>:
  8007ae:	55                   	push   %ebp
  8007af:	89 e5                	mov    %esp,%ebp
  8007b1:	53                   	push   %ebx
  8007b2:	8b 45 08             	mov    0x8(%ebp),%eax
  8007b5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007b8:	8b 55 10             	mov    0x10(%ebp),%edx
  8007bb:	eb 09                	jmp    8007c6 <strncmp+0x18>
  8007bd:	83 ea 01             	sub    $0x1,%edx
  8007c0:	83 c0 01             	add    $0x1,%eax
  8007c3:	83 c1 01             	add    $0x1,%ecx
  8007c6:	85 d2                	test   %edx,%edx
  8007c8:	74 18                	je     8007e2 <strncmp+0x34>
  8007ca:	0f b6 18             	movzbl (%eax),%ebx
  8007cd:	84 db                	test   %bl,%bl
  8007cf:	74 04                	je     8007d5 <strncmp+0x27>
  8007d1:	3a 19                	cmp    (%ecx),%bl
  8007d3:	74 e8                	je     8007bd <strncmp+0xf>
  8007d5:	0f b6 00             	movzbl (%eax),%eax
  8007d8:	0f b6 11             	movzbl (%ecx),%edx
  8007db:	29 d0                	sub    %edx,%eax
  8007dd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007e0:	c9                   	leave
  8007e1:	c3                   	ret
  8007e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8007e7:	eb f4                	jmp    8007dd <strncmp+0x2f>

008007e9 <strchr>:
  8007e9:	55                   	push   %ebp
  8007ea:	89 e5                	mov    %esp,%ebp
  8007ec:	8b 45 08             	mov    0x8(%ebp),%eax
  8007ef:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007f3:	eb 03                	jmp    8007f8 <strchr+0xf>
  8007f5:	83 c0 01             	add    $0x1,%eax
  8007f8:	0f b6 10             	movzbl (%eax),%edx
  8007fb:	84 d2                	test   %dl,%dl
  8007fd:	74 06                	je     800805 <strchr+0x1c>
  8007ff:	38 ca                	cmp    %cl,%dl
  800801:	75 f2                	jne    8007f5 <strchr+0xc>
  800803:	eb 05                	jmp    80080a <strchr+0x21>
  800805:	b8 00 00 00 00       	mov    $0x0,%eax
  80080a:	5d                   	pop    %ebp
  80080b:	c3                   	ret

0080080c <strfind>:
  80080c:	55                   	push   %ebp
  80080d:	89 e5                	mov    %esp,%ebp
  80080f:	8b 45 08             	mov    0x8(%ebp),%eax
  800812:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800816:	0f b6 10             	movzbl (%eax),%edx
  800819:	38 ca                	cmp    %cl,%dl
  80081b:	74 09                	je     800826 <strfind+0x1a>
  80081d:	84 d2                	test   %dl,%dl
  80081f:	74 05                	je     800826 <strfind+0x1a>
  800821:	83 c0 01             	add    $0x1,%eax
  800824:	eb f0                	jmp    800816 <strfind+0xa>
  800826:	5d                   	pop    %ebp
  800827:	c3                   	ret

00800828 <memset>:
  800828:	55                   	push   %ebp
  800829:	89 e5                	mov    %esp,%ebp
  80082b:	57                   	push   %edi
  80082c:	8b 55 08             	mov    0x8(%ebp),%edx
  80082f:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800832:	85 c9                	test   %ecx,%ecx
  800834:	74 24                	je     80085a <memset+0x32>
  800836:	89 d0                	mov    %edx,%eax
  800838:	09 c8                	or     %ecx,%eax
  80083a:	a8 03                	test   $0x3,%al
  80083c:	75 14                	jne    800852 <memset+0x2a>
  80083e:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800842:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800848:	c1 e9 02             	shr    $0x2,%ecx
  80084b:	89 d7                	mov    %edx,%edi
  80084d:	fc                   	cld
  80084e:	f3 ab                	rep stos %eax,%es:(%edi)
  800850:	eb 08                	jmp    80085a <memset+0x32>
  800852:	89 d7                	mov    %edx,%edi
  800854:	8b 45 0c             	mov    0xc(%ebp),%eax
  800857:	fc                   	cld
  800858:	f3 aa                	rep stos %al,%es:(%edi)
  80085a:	89 d0                	mov    %edx,%eax
  80085c:	8b 7d fc             	mov    -0x4(%ebp),%edi
  80085f:	c9                   	leave
  800860:	c3                   	ret

00800861 <memmove>:
  800861:	55                   	push   %ebp
  800862:	89 e5                	mov    %esp,%ebp
  800864:	57                   	push   %edi
  800865:	56                   	push   %esi
  800866:	8b 45 08             	mov    0x8(%ebp),%eax
  800869:	8b 75 0c             	mov    0xc(%ebp),%esi
  80086c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  80086f:	39 c6                	cmp    %eax,%esi
  800871:	73 32                	jae    8008a5 <memmove+0x44>
  800873:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800876:	39 d0                	cmp    %edx,%eax
  800878:	73 2b                	jae    8008a5 <memmove+0x44>
  80087a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  80087d:	89 fe                	mov    %edi,%esi
  80087f:	09 ce                	or     %ecx,%esi
  800881:	09 d6                	or     %edx,%esi
  800883:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800889:	75 0e                	jne    800899 <memmove+0x38>
  80088b:	83 ef 04             	sub    $0x4,%edi
  80088e:	8d 72 fc             	lea    -0x4(%edx),%esi
  800891:	c1 e9 02             	shr    $0x2,%ecx
  800894:	fd                   	std
  800895:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800897:	eb 09                	jmp    8008a2 <memmove+0x41>
  800899:	83 ef 01             	sub    $0x1,%edi
  80089c:	8d 72 ff             	lea    -0x1(%edx),%esi
  80089f:	fd                   	std
  8008a0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008a2:	fc                   	cld
  8008a3:	eb 1a                	jmp    8008bf <memmove+0x5e>
  8008a5:	89 c2                	mov    %eax,%edx
  8008a7:	09 ca                	or     %ecx,%edx
  8008a9:	09 f2                	or     %esi,%edx
  8008ab:	f6 c2 03             	test   $0x3,%dl
  8008ae:	75 0a                	jne    8008ba <memmove+0x59>
  8008b0:	c1 e9 02             	shr    $0x2,%ecx
  8008b3:	89 c7                	mov    %eax,%edi
  8008b5:	fc                   	cld
  8008b6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008b8:	eb 05                	jmp    8008bf <memmove+0x5e>
  8008ba:	89 c7                	mov    %eax,%edi
  8008bc:	fc                   	cld
  8008bd:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008bf:	5e                   	pop    %esi
  8008c0:	5f                   	pop    %edi
  8008c1:	5d                   	pop    %ebp
  8008c2:	c3                   	ret

008008c3 <memcpy>:
  8008c3:	55                   	push   %ebp
  8008c4:	89 e5                	mov    %esp,%ebp
  8008c6:	83 ec 0c             	sub    $0xc,%esp
  8008c9:	ff 75 10             	push   0x10(%ebp)
  8008cc:	ff 75 0c             	push   0xc(%ebp)
  8008cf:	ff 75 08             	push   0x8(%ebp)
  8008d2:	e8 8a ff ff ff       	call   800861 <memmove>
  8008d7:	c9                   	leave
  8008d8:	c3                   	ret

008008d9 <memcmp>:
  8008d9:	55                   	push   %ebp
  8008da:	89 e5                	mov    %esp,%ebp
  8008dc:	56                   	push   %esi
  8008dd:	53                   	push   %ebx
  8008de:	8b 45 08             	mov    0x8(%ebp),%eax
  8008e1:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008e4:	89 c6                	mov    %eax,%esi
  8008e6:	03 75 10             	add    0x10(%ebp),%esi
  8008e9:	eb 06                	jmp    8008f1 <memcmp+0x18>
  8008eb:	83 c0 01             	add    $0x1,%eax
  8008ee:	83 c2 01             	add    $0x1,%edx
  8008f1:	39 f0                	cmp    %esi,%eax
  8008f3:	74 14                	je     800909 <memcmp+0x30>
  8008f5:	0f b6 08             	movzbl (%eax),%ecx
  8008f8:	0f b6 1a             	movzbl (%edx),%ebx
  8008fb:	38 d9                	cmp    %bl,%cl
  8008fd:	74 ec                	je     8008eb <memcmp+0x12>
  8008ff:	0f b6 c1             	movzbl %cl,%eax
  800902:	0f b6 db             	movzbl %bl,%ebx
  800905:	29 d8                	sub    %ebx,%eax
  800907:	eb 05                	jmp    80090e <memcmp+0x35>
  800909:	b8 00 00 00 00       	mov    $0x0,%eax
  80090e:	5b                   	pop    %ebx
  80090f:	5e                   	pop    %esi
  800910:	5d                   	pop    %ebp
  800911:	c3                   	ret

00800912 <memfind>:
  800912:	55                   	push   %ebp
  800913:	89 e5                	mov    %esp,%ebp
  800915:	8b 45 08             	mov    0x8(%ebp),%eax
  800918:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80091b:	89 c2                	mov    %eax,%edx
  80091d:	03 55 10             	add    0x10(%ebp),%edx
  800920:	eb 03                	jmp    800925 <memfind+0x13>
  800922:	83 c0 01             	add    $0x1,%eax
  800925:	39 d0                	cmp    %edx,%eax
  800927:	73 04                	jae    80092d <memfind+0x1b>
  800929:	38 08                	cmp    %cl,(%eax)
  80092b:	75 f5                	jne    800922 <memfind+0x10>
  80092d:	5d                   	pop    %ebp
  80092e:	c3                   	ret

0080092f <strtol>:
  80092f:	55                   	push   %ebp
  800930:	89 e5                	mov    %esp,%ebp
  800932:	57                   	push   %edi
  800933:	56                   	push   %esi
  800934:	53                   	push   %ebx
  800935:	8b 55 08             	mov    0x8(%ebp),%edx
  800938:	8b 5d 10             	mov    0x10(%ebp),%ebx
  80093b:	eb 03                	jmp    800940 <strtol+0x11>
  80093d:	83 c2 01             	add    $0x1,%edx
  800940:	0f b6 02             	movzbl (%edx),%eax
  800943:	3c 20                	cmp    $0x20,%al
  800945:	74 f6                	je     80093d <strtol+0xe>
  800947:	3c 09                	cmp    $0x9,%al
  800949:	74 f2                	je     80093d <strtol+0xe>
  80094b:	3c 2b                	cmp    $0x2b,%al
  80094d:	74 2a                	je     800979 <strtol+0x4a>
  80094f:	bf 00 00 00 00       	mov    $0x0,%edi
  800954:	3c 2d                	cmp    $0x2d,%al
  800956:	74 2b                	je     800983 <strtol+0x54>
  800958:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  80095e:	75 0f                	jne    80096f <strtol+0x40>
  800960:	80 3a 30             	cmpb   $0x30,(%edx)
  800963:	74 28                	je     80098d <strtol+0x5e>
  800965:	85 db                	test   %ebx,%ebx
  800967:	b8 0a 00 00 00       	mov    $0xa,%eax
  80096c:	0f 44 d8             	cmove  %eax,%ebx
  80096f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800974:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800977:	eb 46                	jmp    8009bf <strtol+0x90>
  800979:	83 c2 01             	add    $0x1,%edx
  80097c:	bf 00 00 00 00       	mov    $0x0,%edi
  800981:	eb d5                	jmp    800958 <strtol+0x29>
  800983:	83 c2 01             	add    $0x1,%edx
  800986:	bf 01 00 00 00       	mov    $0x1,%edi
  80098b:	eb cb                	jmp    800958 <strtol+0x29>
  80098d:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800991:	74 0e                	je     8009a1 <strtol+0x72>
  800993:	85 db                	test   %ebx,%ebx
  800995:	75 d8                	jne    80096f <strtol+0x40>
  800997:	83 c2 01             	add    $0x1,%edx
  80099a:	bb 08 00 00 00       	mov    $0x8,%ebx
  80099f:	eb ce                	jmp    80096f <strtol+0x40>
  8009a1:	83 c2 02             	add    $0x2,%edx
  8009a4:	bb 10 00 00 00       	mov    $0x10,%ebx
  8009a9:	eb c4                	jmp    80096f <strtol+0x40>
  8009ab:	0f be c0             	movsbl %al,%eax
  8009ae:	83 e8 30             	sub    $0x30,%eax
  8009b1:	3b 45 10             	cmp    0x10(%ebp),%eax
  8009b4:	7d 3a                	jge    8009f0 <strtol+0xc1>
  8009b6:	83 c2 01             	add    $0x1,%edx
  8009b9:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  8009bd:	01 c1                	add    %eax,%ecx
  8009bf:	0f b6 02             	movzbl (%edx),%eax
  8009c2:	8d 70 d0             	lea    -0x30(%eax),%esi
  8009c5:	89 f3                	mov    %esi,%ebx
  8009c7:	80 fb 09             	cmp    $0x9,%bl
  8009ca:	76 df                	jbe    8009ab <strtol+0x7c>
  8009cc:	8d 70 9f             	lea    -0x61(%eax),%esi
  8009cf:	89 f3                	mov    %esi,%ebx
  8009d1:	80 fb 19             	cmp    $0x19,%bl
  8009d4:	77 08                	ja     8009de <strtol+0xaf>
  8009d6:	0f be c0             	movsbl %al,%eax
  8009d9:	83 e8 57             	sub    $0x57,%eax
  8009dc:	eb d3                	jmp    8009b1 <strtol+0x82>
  8009de:	8d 70 bf             	lea    -0x41(%eax),%esi
  8009e1:	89 f3                	mov    %esi,%ebx
  8009e3:	80 fb 19             	cmp    $0x19,%bl
  8009e6:	77 08                	ja     8009f0 <strtol+0xc1>
  8009e8:	0f be c0             	movsbl %al,%eax
  8009eb:	83 e8 37             	sub    $0x37,%eax
  8009ee:	eb c1                	jmp    8009b1 <strtol+0x82>
  8009f0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  8009f4:	74 05                	je     8009fb <strtol+0xcc>
  8009f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  8009f9:	89 10                	mov    %edx,(%eax)
  8009fb:	89 c8                	mov    %ecx,%eax
  8009fd:	f7 d8                	neg    %eax
  8009ff:	85 ff                	test   %edi,%edi
  800a01:	0f 45 c8             	cmovne %eax,%ecx
  800a04:	89 c8                	mov    %ecx,%eax
  800a06:	5b                   	pop    %ebx
  800a07:	5e                   	pop    %esi
  800a08:	5f                   	pop    %edi
  800a09:	5d                   	pop    %ebp
  800a0a:	c3                   	ret

00800a0b <syscall>:
  800a0b:	55                   	push   %ebp
  800a0c:	89 e5                	mov    %esp,%ebp
  800a0e:	57                   	push   %edi
  800a0f:	56                   	push   %esi
  800a10:	53                   	push   %ebx
  800a11:	83 ec 1c             	sub    $0x1c,%esp
  800a14:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a17:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a1a:	89 ca                	mov    %ecx,%edx
  800a1c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a1f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a22:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a25:	8b 75 14             	mov    0x14(%ebp),%esi
  800a28:	cd 30                	int    $0x30
  800a2a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800a2e:	74 04                	je     800a34 <syscall+0x29>
  800a30:	85 c0                	test   %eax,%eax
  800a32:	7f 08                	jg     800a3c <syscall+0x31>
  800a34:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800a37:	5b                   	pop    %ebx
  800a38:	5e                   	pop    %esi
  800a39:	5f                   	pop    %edi
  800a3a:	5d                   	pop    %ebp
  800a3b:	c3                   	ret
  800a3c:	83 ec 0c             	sub    $0xc,%esp
  800a3f:	50                   	push   %eax
  800a40:	ff 75 e0             	push   -0x20(%ebp)
  800a43:	68 f4 0f 80 00       	push   $0x800ff4
  800a48:	6a 1e                	push   $0x1e
  800a4a:	68 11 10 80 00       	push   $0x801011
  800a4f:	e8 b1 01 00 00       	call   800c05 <_panic>

00800a54 <sys_cputs>:
  800a54:	55                   	push   %ebp
  800a55:	89 e5                	mov    %esp,%ebp
  800a57:	83 ec 08             	sub    $0x8,%esp
  800a5a:	6a 00                	push   $0x0
  800a5c:	6a 00                	push   $0x0
  800a5e:	6a 00                	push   $0x0
  800a60:	ff 75 0c             	push   0xc(%ebp)
  800a63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a66:	ba 00 00 00 00       	mov    $0x0,%edx
  800a6b:	b8 00 00 00 00       	mov    $0x0,%eax
  800a70:	e8 96 ff ff ff       	call   800a0b <syscall>
  800a75:	83 c4 10             	add    $0x10,%esp
  800a78:	c9                   	leave
  800a79:	c3                   	ret

00800a7a <sys_cgetc>:
  800a7a:	55                   	push   %ebp
  800a7b:	89 e5                	mov    %esp,%ebp
  800a7d:	83 ec 08             	sub    $0x8,%esp
  800a80:	6a 00                	push   $0x0
  800a82:	6a 00                	push   $0x0
  800a84:	6a 00                	push   $0x0
  800a86:	6a 00                	push   $0x0
  800a88:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a8d:	ba 00 00 00 00       	mov    $0x0,%edx
  800a92:	b8 01 00 00 00       	mov    $0x1,%eax
  800a97:	e8 6f ff ff ff       	call   800a0b <syscall>
  800a9c:	c9                   	leave
  800a9d:	c3                   	ret

00800a9e <sys_env_destroy>:
  800a9e:	55                   	push   %ebp
  800a9f:	89 e5                	mov    %esp,%ebp
  800aa1:	83 ec 08             	sub    $0x8,%esp
  800aa4:	6a 00                	push   $0x0
  800aa6:	6a 00                	push   $0x0
  800aa8:	6a 00                	push   $0x0
  800aaa:	6a 00                	push   $0x0
  800aac:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800aaf:	ba 01 00 00 00       	mov    $0x1,%edx
  800ab4:	b8 03 00 00 00       	mov    $0x3,%eax
  800ab9:	e8 4d ff ff ff       	call   800a0b <syscall>
  800abe:	c9                   	leave
  800abf:	c3                   	ret

00800ac0 <sys_getenvid>:
  800ac0:	55                   	push   %ebp
  800ac1:	89 e5                	mov    %esp,%ebp
  800ac3:	83 ec 08             	sub    $0x8,%esp
  800ac6:	6a 00                	push   $0x0
  800ac8:	6a 00                	push   $0x0
  800aca:	6a 00                	push   $0x0
  800acc:	6a 00                	push   $0x0
  800ace:	b9 00 00 00 00       	mov    $0x0,%ecx
  800ad3:	ba 00 00 00 00       	mov    $0x0,%edx
  800ad8:	b8 02 00 00 00       	mov    $0x2,%eax
  800add:	e8 29 ff ff ff       	call   800a0b <syscall>
  800ae2:	c9                   	leave
  800ae3:	c3                   	ret

00800ae4 <sys_yield>:
  800ae4:	55                   	push   %ebp
  800ae5:	89 e5                	mov    %esp,%ebp
  800ae7:	83 ec 08             	sub    $0x8,%esp
  800aea:	6a 00                	push   $0x0
  800aec:	6a 00                	push   $0x0
  800aee:	6a 00                	push   $0x0
  800af0:	6a 00                	push   $0x0
  800af2:	b9 00 00 00 00       	mov    $0x0,%ecx
  800af7:	ba 00 00 00 00       	mov    $0x0,%edx
  800afc:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b01:	e8 05 ff ff ff       	call   800a0b <syscall>
  800b06:	83 c4 10             	add    $0x10,%esp
  800b09:	c9                   	leave
  800b0a:	c3                   	ret

00800b0b <sys_page_alloc>:
  800b0b:	55                   	push   %ebp
  800b0c:	89 e5                	mov    %esp,%ebp
  800b0e:	83 ec 08             	sub    $0x8,%esp
  800b11:	6a 00                	push   $0x0
  800b13:	6a 00                	push   $0x0
  800b15:	ff 75 10             	push   0x10(%ebp)
  800b18:	ff 75 0c             	push   0xc(%ebp)
  800b1b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b1e:	ba 01 00 00 00       	mov    $0x1,%edx
  800b23:	b8 04 00 00 00       	mov    $0x4,%eax
  800b28:	e8 de fe ff ff       	call   800a0b <syscall>
  800b2d:	c9                   	leave
  800b2e:	c3                   	ret

00800b2f <sys_page_map>:
  800b2f:	55                   	push   %ebp
  800b30:	89 e5                	mov    %esp,%ebp
  800b32:	83 ec 08             	sub    $0x8,%esp
  800b35:	ff 75 18             	push   0x18(%ebp)
  800b38:	ff 75 14             	push   0x14(%ebp)
  800b3b:	ff 75 10             	push   0x10(%ebp)
  800b3e:	ff 75 0c             	push   0xc(%ebp)
  800b41:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b44:	ba 01 00 00 00       	mov    $0x1,%edx
  800b49:	b8 05 00 00 00       	mov    $0x5,%eax
  800b4e:	e8 b8 fe ff ff       	call   800a0b <syscall>
  800b53:	c9                   	leave
  800b54:	c3                   	ret

00800b55 <sys_page_unmap>:
  800b55:	55                   	push   %ebp
  800b56:	89 e5                	mov    %esp,%ebp
  800b58:	83 ec 08             	sub    $0x8,%esp
  800b5b:	6a 00                	push   $0x0
  800b5d:	6a 00                	push   $0x0
  800b5f:	6a 00                	push   $0x0
  800b61:	ff 75 0c             	push   0xc(%ebp)
  800b64:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b67:	ba 01 00 00 00       	mov    $0x1,%edx
  800b6c:	b8 06 00 00 00       	mov    $0x6,%eax
  800b71:	e8 95 fe ff ff       	call   800a0b <syscall>
  800b76:	c9                   	leave
  800b77:	c3                   	ret

00800b78 <sys_env_set_status>:
  800b78:	55                   	push   %ebp
  800b79:	89 e5                	mov    %esp,%ebp
  800b7b:	83 ec 08             	sub    $0x8,%esp
  800b7e:	6a 00                	push   $0x0
  800b80:	6a 00                	push   $0x0
  800b82:	6a 00                	push   $0x0
  800b84:	ff 75 0c             	push   0xc(%ebp)
  800b87:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b8a:	ba 01 00 00 00       	mov    $0x1,%edx
  800b8f:	b8 08 00 00 00       	mov    $0x8,%eax
  800b94:	e8 72 fe ff ff       	call   800a0b <syscall>
  800b99:	c9                   	leave
  800b9a:	c3                   	ret

00800b9b <sys_env_set_pgfault_upcall>:
  800b9b:	55                   	push   %ebp
  800b9c:	89 e5                	mov    %esp,%ebp
  800b9e:	83 ec 08             	sub    $0x8,%esp
  800ba1:	6a 00                	push   $0x0
  800ba3:	6a 00                	push   $0x0
  800ba5:	6a 00                	push   $0x0
  800ba7:	ff 75 0c             	push   0xc(%ebp)
  800baa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bad:	ba 01 00 00 00       	mov    $0x1,%edx
  800bb2:	b8 09 00 00 00       	mov    $0x9,%eax
  800bb7:	e8 4f fe ff ff       	call   800a0b <syscall>
  800bbc:	c9                   	leave
  800bbd:	c3                   	ret

00800bbe <sys_ipc_try_send>:
  800bbe:	55                   	push   %ebp
  800bbf:	89 e5                	mov    %esp,%ebp
  800bc1:	83 ec 08             	sub    $0x8,%esp
  800bc4:	6a 00                	push   $0x0
  800bc6:	ff 75 14             	push   0x14(%ebp)
  800bc9:	ff 75 10             	push   0x10(%ebp)
  800bcc:	ff 75 0c             	push   0xc(%ebp)
  800bcf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bd2:	ba 00 00 00 00       	mov    $0x0,%edx
  800bd7:	b8 0c 00 00 00       	mov    $0xc,%eax
  800bdc:	e8 2a fe ff ff       	call   800a0b <syscall>
  800be1:	c9                   	leave
  800be2:	c3                   	ret

00800be3 <sys_ipc_recv>:
  800be3:	55                   	push   %ebp
  800be4:	89 e5                	mov    %esp,%ebp
  800be6:	83 ec 08             	sub    $0x8,%esp
  800be9:	6a 00                	push   $0x0
  800beb:	6a 00                	push   $0x0
  800bed:	6a 00                	push   $0x0
  800bef:	6a 00                	push   $0x0
  800bf1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bf4:	ba 01 00 00 00       	mov    $0x1,%edx
  800bf9:	b8 0d 00 00 00       	mov    $0xd,%eax
  800bfe:	e8 08 fe ff ff       	call   800a0b <syscall>
  800c03:	c9                   	leave
  800c04:	c3                   	ret

00800c05 <_panic>:
  800c05:	55                   	push   %ebp
  800c06:	89 e5                	mov    %esp,%ebp
  800c08:	56                   	push   %esi
  800c09:	53                   	push   %ebx
  800c0a:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800c0d:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800c13:	e8 a8 fe ff ff       	call   800ac0 <sys_getenvid>
  800c18:	83 ec 0c             	sub    $0xc,%esp
  800c1b:	ff 75 0c             	push   0xc(%ebp)
  800c1e:	ff 75 08             	push   0x8(%ebp)
  800c21:	56                   	push   %esi
  800c22:	50                   	push   %eax
  800c23:	68 10 0f 80 00       	push   $0x800f10
  800c28:	e8 65 f5 ff ff       	call   800192 <cprintf>
  800c2d:	83 c4 18             	add    $0x18,%esp
  800c30:	53                   	push   %ebx
  800c31:	ff 75 10             	push   0x10(%ebp)
  800c34:	e8 08 f5 ff ff       	call   800141 <vcprintf>
  800c39:	c7 04 24 1f 10 80 00 	movl   $0x80101f,(%esp)
  800c40:	e8 4d f5 ff ff       	call   800192 <cprintf>
  800c45:	83 c4 10             	add    $0x10,%esp
  800c48:	cc                   	int3
  800c49:	eb fd                	jmp    800c48 <_panic+0x43>
  800c4b:	66 90                	xchg   %ax,%ax
  800c4d:	66 90                	xchg   %ax,%ax
  800c4f:	90                   	nop

00800c50 <__udivdi3>:
  800c50:	f3 0f 1e fb          	endbr32
  800c54:	55                   	push   %ebp
  800c55:	57                   	push   %edi
  800c56:	56                   	push   %esi
  800c57:	53                   	push   %ebx
  800c58:	83 ec 1c             	sub    $0x1c,%esp
  800c5b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800c5f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c63:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c67:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c6b:	85 c0                	test   %eax,%eax
  800c6d:	75 19                	jne    800c88 <__udivdi3+0x38>
  800c6f:	39 de                	cmp    %ebx,%esi
  800c71:	73 4d                	jae    800cc0 <__udivdi3+0x70>
  800c73:	31 ff                	xor    %edi,%edi
  800c75:	89 e8                	mov    %ebp,%eax
  800c77:	89 f2                	mov    %esi,%edx
  800c79:	f7 f3                	div    %ebx
  800c7b:	89 fa                	mov    %edi,%edx
  800c7d:	83 c4 1c             	add    $0x1c,%esp
  800c80:	5b                   	pop    %ebx
  800c81:	5e                   	pop    %esi
  800c82:	5f                   	pop    %edi
  800c83:	5d                   	pop    %ebp
  800c84:	c3                   	ret
  800c85:	8d 76 00             	lea    0x0(%esi),%esi
  800c88:	39 c6                	cmp    %eax,%esi
  800c8a:	73 14                	jae    800ca0 <__udivdi3+0x50>
  800c8c:	31 ff                	xor    %edi,%edi
  800c8e:	31 c0                	xor    %eax,%eax
  800c90:	89 fa                	mov    %edi,%edx
  800c92:	83 c4 1c             	add    $0x1c,%esp
  800c95:	5b                   	pop    %ebx
  800c96:	5e                   	pop    %esi
  800c97:	5f                   	pop    %edi
  800c98:	5d                   	pop    %ebp
  800c99:	c3                   	ret
  800c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800ca0:	0f bd f8             	bsr    %eax,%edi
  800ca3:	83 f7 1f             	xor    $0x1f,%edi
  800ca6:	75 48                	jne    800cf0 <__udivdi3+0xa0>
  800ca8:	39 f0                	cmp    %esi,%eax
  800caa:	72 06                	jb     800cb2 <__udivdi3+0x62>
  800cac:	31 c0                	xor    %eax,%eax
  800cae:	39 dd                	cmp    %ebx,%ebp
  800cb0:	72 de                	jb     800c90 <__udivdi3+0x40>
  800cb2:	b8 01 00 00 00       	mov    $0x1,%eax
  800cb7:	eb d7                	jmp    800c90 <__udivdi3+0x40>
  800cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800cc0:	89 d9                	mov    %ebx,%ecx
  800cc2:	85 db                	test   %ebx,%ebx
  800cc4:	75 0b                	jne    800cd1 <__udivdi3+0x81>
  800cc6:	b8 01 00 00 00       	mov    $0x1,%eax
  800ccb:	31 d2                	xor    %edx,%edx
  800ccd:	f7 f3                	div    %ebx
  800ccf:	89 c1                	mov    %eax,%ecx
  800cd1:	31 d2                	xor    %edx,%edx
  800cd3:	89 f0                	mov    %esi,%eax
  800cd5:	f7 f1                	div    %ecx
  800cd7:	89 c6                	mov    %eax,%esi
  800cd9:	89 e8                	mov    %ebp,%eax
  800cdb:	89 f7                	mov    %esi,%edi
  800cdd:	f7 f1                	div    %ecx
  800cdf:	89 fa                	mov    %edi,%edx
  800ce1:	83 c4 1c             	add    $0x1c,%esp
  800ce4:	5b                   	pop    %ebx
  800ce5:	5e                   	pop    %esi
  800ce6:	5f                   	pop    %edi
  800ce7:	5d                   	pop    %ebp
  800ce8:	c3                   	ret
  800ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800cf0:	89 f9                	mov    %edi,%ecx
  800cf2:	ba 20 00 00 00       	mov    $0x20,%edx
  800cf7:	29 fa                	sub    %edi,%edx
  800cf9:	d3 e0                	shl    %cl,%eax
  800cfb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800cff:	89 d1                	mov    %edx,%ecx
  800d01:	89 d8                	mov    %ebx,%eax
  800d03:	d3 e8                	shr    %cl,%eax
  800d05:	89 c1                	mov    %eax,%ecx
  800d07:	8b 44 24 08          	mov    0x8(%esp),%eax
  800d0b:	09 c1                	or     %eax,%ecx
  800d0d:	89 f0                	mov    %esi,%eax
  800d0f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800d13:	89 f9                	mov    %edi,%ecx
  800d15:	d3 e3                	shl    %cl,%ebx
  800d17:	89 d1                	mov    %edx,%ecx
  800d19:	d3 e8                	shr    %cl,%eax
  800d1b:	89 f9                	mov    %edi,%ecx
  800d1d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800d21:	89 eb                	mov    %ebp,%ebx
  800d23:	d3 e6                	shl    %cl,%esi
  800d25:	89 d1                	mov    %edx,%ecx
  800d27:	d3 eb                	shr    %cl,%ebx
  800d29:	09 f3                	or     %esi,%ebx
  800d2b:	89 c6                	mov    %eax,%esi
  800d2d:	89 f2                	mov    %esi,%edx
  800d2f:	89 d8                	mov    %ebx,%eax
  800d31:	f7 74 24 08          	divl   0x8(%esp)
  800d35:	89 d6                	mov    %edx,%esi
  800d37:	89 c3                	mov    %eax,%ebx
  800d39:	f7 64 24 0c          	mull   0xc(%esp)
  800d3d:	39 d6                	cmp    %edx,%esi
  800d3f:	72 1f                	jb     800d60 <__udivdi3+0x110>
  800d41:	89 f9                	mov    %edi,%ecx
  800d43:	d3 e5                	shl    %cl,%ebp
  800d45:	39 c5                	cmp    %eax,%ebp
  800d47:	73 04                	jae    800d4d <__udivdi3+0xfd>
  800d49:	39 d6                	cmp    %edx,%esi
  800d4b:	74 13                	je     800d60 <__udivdi3+0x110>
  800d4d:	89 d8                	mov    %ebx,%eax
  800d4f:	31 ff                	xor    %edi,%edi
  800d51:	e9 3a ff ff ff       	jmp    800c90 <__udivdi3+0x40>
  800d56:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d5d:	00 
  800d5e:	66 90                	xchg   %ax,%ax
  800d60:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d63:	31 ff                	xor    %edi,%edi
  800d65:	e9 26 ff ff ff       	jmp    800c90 <__udivdi3+0x40>
  800d6a:	66 90                	xchg   %ax,%ax
  800d6c:	66 90                	xchg   %ax,%ax
  800d6e:	66 90                	xchg   %ax,%ax

00800d70 <__umoddi3>:
  800d70:	f3 0f 1e fb          	endbr32
  800d74:	55                   	push   %ebp
  800d75:	57                   	push   %edi
  800d76:	56                   	push   %esi
  800d77:	53                   	push   %ebx
  800d78:	83 ec 1c             	sub    $0x1c,%esp
  800d7b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d7f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d83:	8b 74 24 30          	mov    0x30(%esp),%esi
  800d87:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800d8b:	89 da                	mov    %ebx,%edx
  800d8d:	85 c0                	test   %eax,%eax
  800d8f:	75 17                	jne    800da8 <__umoddi3+0x38>
  800d91:	39 fb                	cmp    %edi,%ebx
  800d93:	73 53                	jae    800de8 <__umoddi3+0x78>
  800d95:	89 f0                	mov    %esi,%eax
  800d97:	f7 f7                	div    %edi
  800d99:	89 d0                	mov    %edx,%eax
  800d9b:	31 d2                	xor    %edx,%edx
  800d9d:	83 c4 1c             	add    $0x1c,%esp
  800da0:	5b                   	pop    %ebx
  800da1:	5e                   	pop    %esi
  800da2:	5f                   	pop    %edi
  800da3:	5d                   	pop    %ebp
  800da4:	c3                   	ret
  800da5:	8d 76 00             	lea    0x0(%esi),%esi
  800da8:	89 f1                	mov    %esi,%ecx
  800daa:	39 c3                	cmp    %eax,%ebx
  800dac:	73 12                	jae    800dc0 <__umoddi3+0x50>
  800dae:	89 f0                	mov    %esi,%eax
  800db0:	83 c4 1c             	add    $0x1c,%esp
  800db3:	5b                   	pop    %ebx
  800db4:	5e                   	pop    %esi
  800db5:	5f                   	pop    %edi
  800db6:	5d                   	pop    %ebp
  800db7:	c3                   	ret
  800db8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800dbf:	00 
  800dc0:	0f bd e8             	bsr    %eax,%ebp
  800dc3:	83 f5 1f             	xor    $0x1f,%ebp
  800dc6:	75 48                	jne    800e10 <__umoddi3+0xa0>
  800dc8:	39 d8                	cmp    %ebx,%eax
  800dca:	0f 82 d0 00 00 00    	jb     800ea0 <__umoddi3+0x130>
  800dd0:	39 fe                	cmp    %edi,%esi
  800dd2:	0f 83 c8 00 00 00    	jae    800ea0 <__umoddi3+0x130>
  800dd8:	89 c8                	mov    %ecx,%eax
  800dda:	83 c4 1c             	add    $0x1c,%esp
  800ddd:	5b                   	pop    %ebx
  800dde:	5e                   	pop    %esi
  800ddf:	5f                   	pop    %edi
  800de0:	5d                   	pop    %ebp
  800de1:	c3                   	ret
  800de2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800de8:	89 f9                	mov    %edi,%ecx
  800dea:	85 ff                	test   %edi,%edi
  800dec:	75 0b                	jne    800df9 <__umoddi3+0x89>
  800dee:	b8 01 00 00 00       	mov    $0x1,%eax
  800df3:	31 d2                	xor    %edx,%edx
  800df5:	f7 f7                	div    %edi
  800df7:	89 c1                	mov    %eax,%ecx
  800df9:	89 d8                	mov    %ebx,%eax
  800dfb:	31 d2                	xor    %edx,%edx
  800dfd:	f7 f1                	div    %ecx
  800dff:	89 f0                	mov    %esi,%eax
  800e01:	f7 f1                	div    %ecx
  800e03:	89 d0                	mov    %edx,%eax
  800e05:	31 d2                	xor    %edx,%edx
  800e07:	eb 94                	jmp    800d9d <__umoddi3+0x2d>
  800e09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800e10:	89 e9                	mov    %ebp,%ecx
  800e12:	ba 20 00 00 00       	mov    $0x20,%edx
  800e17:	29 ea                	sub    %ebp,%edx
  800e19:	d3 e0                	shl    %cl,%eax
  800e1b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800e1f:	89 d1                	mov    %edx,%ecx
  800e21:	89 f8                	mov    %edi,%eax
  800e23:	d3 e8                	shr    %cl,%eax
  800e25:	89 54 24 04          	mov    %edx,0x4(%esp)
  800e29:	8b 54 24 04          	mov    0x4(%esp),%edx
  800e2d:	89 c1                	mov    %eax,%ecx
  800e2f:	8b 44 24 08          	mov    0x8(%esp),%eax
  800e33:	09 c1                	or     %eax,%ecx
  800e35:	89 d8                	mov    %ebx,%eax
  800e37:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800e3b:	89 e9                	mov    %ebp,%ecx
  800e3d:	d3 e7                	shl    %cl,%edi
  800e3f:	89 d1                	mov    %edx,%ecx
  800e41:	d3 e8                	shr    %cl,%eax
  800e43:	89 e9                	mov    %ebp,%ecx
  800e45:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800e49:	d3 e3                	shl    %cl,%ebx
  800e4b:	89 c7                	mov    %eax,%edi
  800e4d:	89 d1                	mov    %edx,%ecx
  800e4f:	89 f0                	mov    %esi,%eax
  800e51:	d3 e8                	shr    %cl,%eax
  800e53:	89 fa                	mov    %edi,%edx
  800e55:	89 e9                	mov    %ebp,%ecx
  800e57:	09 d8                	or     %ebx,%eax
  800e59:	d3 e6                	shl    %cl,%esi
  800e5b:	f7 74 24 08          	divl   0x8(%esp)
  800e5f:	89 d3                	mov    %edx,%ebx
  800e61:	f7 64 24 0c          	mull   0xc(%esp)
  800e65:	89 c7                	mov    %eax,%edi
  800e67:	89 d1                	mov    %edx,%ecx
  800e69:	39 d3                	cmp    %edx,%ebx
  800e6b:	72 06                	jb     800e73 <__umoddi3+0x103>
  800e6d:	75 10                	jne    800e7f <__umoddi3+0x10f>
  800e6f:	39 c6                	cmp    %eax,%esi
  800e71:	73 0c                	jae    800e7f <__umoddi3+0x10f>
  800e73:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e77:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e7b:	89 d1                	mov    %edx,%ecx
  800e7d:	89 c7                	mov    %eax,%edi
  800e7f:	89 f2                	mov    %esi,%edx
  800e81:	29 fa                	sub    %edi,%edx
  800e83:	19 cb                	sbb    %ecx,%ebx
  800e85:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800e8a:	89 d8                	mov    %ebx,%eax
  800e8c:	d3 e0                	shl    %cl,%eax
  800e8e:	89 e9                	mov    %ebp,%ecx
  800e90:	d3 ea                	shr    %cl,%edx
  800e92:	d3 eb                	shr    %cl,%ebx
  800e94:	09 d0                	or     %edx,%eax
  800e96:	89 da                	mov    %ebx,%edx
  800e98:	83 c4 1c             	add    $0x1c,%esp
  800e9b:	5b                   	pop    %ebx
  800e9c:	5e                   	pop    %esi
  800e9d:	5f                   	pop    %edi
  800e9e:	5d                   	pop    %ebp
  800e9f:	c3                   	ret
  800ea0:	89 da                	mov    %ebx,%edx
  800ea2:	89 f1                	mov    %esi,%ecx
  800ea4:	29 f9                	sub    %edi,%ecx
  800ea6:	19 c2                	sbb    %eax,%edx
  800ea8:	89 c8                	mov    %ecx,%eax
  800eaa:	e9 2b ff ff ff       	jmp    800dda <__umoddi3+0x6a>
