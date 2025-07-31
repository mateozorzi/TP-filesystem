
obj/user/divzero:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 23 00 00 00       	call   800054 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 10             	sub    $0x10,%esp
  800039:	c7 05 04 20 80 00 00 	movl   $0x0,0x802004
  800040:	00 00 00 
  800043:	6a 00                	push   $0x0
  800045:	68 80 0e 80 00       	push   $0x800e80
  80004a:	e8 f9 00 00 00       	call   800148 <cprintf>
  80004f:	83 c4 10             	add    $0x10,%esp
  800052:	c9                   	leave
  800053:	c3                   	ret

00800054 <libmain>:
  800054:	55                   	push   %ebp
  800055:	89 e5                	mov    %esp,%ebp
  800057:	56                   	push   %esi
  800058:	53                   	push   %ebx
  800059:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80005c:	8b 75 0c             	mov    0xc(%ebp),%esi
  80005f:	e8 12 0a 00 00       	call   800a76 <sys_getenvid>
  800064:	85 c0                	test   %eax,%eax
  800066:	78 15                	js     80007d <libmain+0x29>
  800068:	25 ff 03 00 00       	and    $0x3ff,%eax
  80006d:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800073:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800078:	a3 08 20 80 00       	mov    %eax,0x802008
  80007d:	85 db                	test   %ebx,%ebx
  80007f:	7e 07                	jle    800088 <libmain+0x34>
  800081:	8b 06                	mov    (%esi),%eax
  800083:	a3 00 20 80 00       	mov    %eax,0x802000
  800088:	83 ec 08             	sub    $0x8,%esp
  80008b:	56                   	push   %esi
  80008c:	53                   	push   %ebx
  80008d:	e8 a1 ff ff ff       	call   800033 <umain>
  800092:	e8 0a 00 00 00       	call   8000a1 <exit>
  800097:	83 c4 10             	add    $0x10,%esp
  80009a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80009d:	5b                   	pop    %ebx
  80009e:	5e                   	pop    %esi
  80009f:	5d                   	pop    %ebp
  8000a0:	c3                   	ret

008000a1 <exit>:
  8000a1:	55                   	push   %ebp
  8000a2:	89 e5                	mov    %esp,%ebp
  8000a4:	83 ec 14             	sub    $0x14,%esp
  8000a7:	6a 00                	push   $0x0
  8000a9:	e8 a6 09 00 00       	call   800a54 <sys_env_destroy>
  8000ae:	83 c4 10             	add    $0x10,%esp
  8000b1:	c9                   	leave
  8000b2:	c3                   	ret

008000b3 <putch>:
  8000b3:	55                   	push   %ebp
  8000b4:	89 e5                	mov    %esp,%ebp
  8000b6:	53                   	push   %ebx
  8000b7:	83 ec 04             	sub    $0x4,%esp
  8000ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000bd:	8b 13                	mov    (%ebx),%edx
  8000bf:	8d 42 01             	lea    0x1(%edx),%eax
  8000c2:	89 03                	mov    %eax,(%ebx)
  8000c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000c7:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8000cb:	3d ff 00 00 00       	cmp    $0xff,%eax
  8000d0:	74 09                	je     8000db <putch+0x28>
  8000d2:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8000d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8000d9:	c9                   	leave
  8000da:	c3                   	ret
  8000db:	83 ec 08             	sub    $0x8,%esp
  8000de:	68 ff 00 00 00       	push   $0xff
  8000e3:	8d 43 08             	lea    0x8(%ebx),%eax
  8000e6:	50                   	push   %eax
  8000e7:	e8 1e 09 00 00       	call   800a0a <sys_cputs>
  8000ec:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8000f2:	83 c4 10             	add    $0x10,%esp
  8000f5:	eb db                	jmp    8000d2 <putch+0x1f>

008000f7 <vcprintf>:
  8000f7:	55                   	push   %ebp
  8000f8:	89 e5                	mov    %esp,%ebp
  8000fa:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800100:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800107:	00 00 00 
  80010a:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800111:	00 00 00 
  800114:	ff 75 0c             	push   0xc(%ebp)
  800117:	ff 75 08             	push   0x8(%ebp)
  80011a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800120:	50                   	push   %eax
  800121:	68 b3 00 80 00       	push   $0x8000b3
  800126:	e8 74 01 00 00       	call   80029f <vprintfmt>
  80012b:	83 c4 08             	add    $0x8,%esp
  80012e:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800134:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  80013a:	50                   	push   %eax
  80013b:	e8 ca 08 00 00       	call   800a0a <sys_cputs>
  800140:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800146:	c9                   	leave
  800147:	c3                   	ret

00800148 <cprintf>:
  800148:	55                   	push   %ebp
  800149:	89 e5                	mov    %esp,%ebp
  80014b:	83 ec 10             	sub    $0x10,%esp
  80014e:	8d 45 0c             	lea    0xc(%ebp),%eax
  800151:	50                   	push   %eax
  800152:	ff 75 08             	push   0x8(%ebp)
  800155:	e8 9d ff ff ff       	call   8000f7 <vcprintf>
  80015a:	c9                   	leave
  80015b:	c3                   	ret

0080015c <printnum>:
  80015c:	55                   	push   %ebp
  80015d:	89 e5                	mov    %esp,%ebp
  80015f:	57                   	push   %edi
  800160:	56                   	push   %esi
  800161:	53                   	push   %ebx
  800162:	83 ec 1c             	sub    $0x1c,%esp
  800165:	89 c7                	mov    %eax,%edi
  800167:	89 d6                	mov    %edx,%esi
  800169:	8b 45 08             	mov    0x8(%ebp),%eax
  80016c:	8b 55 0c             	mov    0xc(%ebp),%edx
  80016f:	89 d1                	mov    %edx,%ecx
  800171:	89 c2                	mov    %eax,%edx
  800173:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800176:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800179:	8b 45 10             	mov    0x10(%ebp),%eax
  80017c:	8b 5d 14             	mov    0x14(%ebp),%ebx
  80017f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800182:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800189:	39 c2                	cmp    %eax,%edx
  80018b:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  80018e:	72 3e                	jb     8001ce <printnum+0x72>
  800190:	83 ec 0c             	sub    $0xc,%esp
  800193:	ff 75 18             	push   0x18(%ebp)
  800196:	83 eb 01             	sub    $0x1,%ebx
  800199:	53                   	push   %ebx
  80019a:	50                   	push   %eax
  80019b:	83 ec 08             	sub    $0x8,%esp
  80019e:	ff 75 e4             	push   -0x1c(%ebp)
  8001a1:	ff 75 e0             	push   -0x20(%ebp)
  8001a4:	ff 75 dc             	push   -0x24(%ebp)
  8001a7:	ff 75 d8             	push   -0x28(%ebp)
  8001aa:	e8 61 0a 00 00       	call   800c10 <__udivdi3>
  8001af:	83 c4 18             	add    $0x18,%esp
  8001b2:	52                   	push   %edx
  8001b3:	50                   	push   %eax
  8001b4:	89 f2                	mov    %esi,%edx
  8001b6:	89 f8                	mov    %edi,%eax
  8001b8:	e8 9f ff ff ff       	call   80015c <printnum>
  8001bd:	83 c4 20             	add    $0x20,%esp
  8001c0:	eb 13                	jmp    8001d5 <printnum+0x79>
  8001c2:	83 ec 08             	sub    $0x8,%esp
  8001c5:	56                   	push   %esi
  8001c6:	ff 75 18             	push   0x18(%ebp)
  8001c9:	ff d7                	call   *%edi
  8001cb:	83 c4 10             	add    $0x10,%esp
  8001ce:	83 eb 01             	sub    $0x1,%ebx
  8001d1:	85 db                	test   %ebx,%ebx
  8001d3:	7f ed                	jg     8001c2 <printnum+0x66>
  8001d5:	83 ec 08             	sub    $0x8,%esp
  8001d8:	56                   	push   %esi
  8001d9:	83 ec 04             	sub    $0x4,%esp
  8001dc:	ff 75 e4             	push   -0x1c(%ebp)
  8001df:	ff 75 e0             	push   -0x20(%ebp)
  8001e2:	ff 75 dc             	push   -0x24(%ebp)
  8001e5:	ff 75 d8             	push   -0x28(%ebp)
  8001e8:	e8 43 0b 00 00       	call   800d30 <__umoddi3>
  8001ed:	83 c4 14             	add    $0x14,%esp
  8001f0:	0f be 80 98 0e 80 00 	movsbl 0x800e98(%eax),%eax
  8001f7:	50                   	push   %eax
  8001f8:	ff d7                	call   *%edi
  8001fa:	83 c4 10             	add    $0x10,%esp
  8001fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800200:	5b                   	pop    %ebx
  800201:	5e                   	pop    %esi
  800202:	5f                   	pop    %edi
  800203:	5d                   	pop    %ebp
  800204:	c3                   	ret

00800205 <getuint>:
  800205:	83 fa 01             	cmp    $0x1,%edx
  800208:	7f 13                	jg     80021d <getuint+0x18>
  80020a:	85 d2                	test   %edx,%edx
  80020c:	74 1c                	je     80022a <getuint+0x25>
  80020e:	8b 10                	mov    (%eax),%edx
  800210:	8d 4a 04             	lea    0x4(%edx),%ecx
  800213:	89 08                	mov    %ecx,(%eax)
  800215:	8b 02                	mov    (%edx),%eax
  800217:	ba 00 00 00 00       	mov    $0x0,%edx
  80021c:	c3                   	ret
  80021d:	8b 10                	mov    (%eax),%edx
  80021f:	8d 4a 08             	lea    0x8(%edx),%ecx
  800222:	89 08                	mov    %ecx,(%eax)
  800224:	8b 02                	mov    (%edx),%eax
  800226:	8b 52 04             	mov    0x4(%edx),%edx
  800229:	c3                   	ret
  80022a:	8b 10                	mov    (%eax),%edx
  80022c:	8d 4a 04             	lea    0x4(%edx),%ecx
  80022f:	89 08                	mov    %ecx,(%eax)
  800231:	8b 02                	mov    (%edx),%eax
  800233:	ba 00 00 00 00       	mov    $0x0,%edx
  800238:	c3                   	ret

00800239 <getint>:
  800239:	83 fa 01             	cmp    $0x1,%edx
  80023c:	7f 0f                	jg     80024d <getint+0x14>
  80023e:	85 d2                	test   %edx,%edx
  800240:	74 18                	je     80025a <getint+0x21>
  800242:	8b 10                	mov    (%eax),%edx
  800244:	8d 4a 04             	lea    0x4(%edx),%ecx
  800247:	89 08                	mov    %ecx,(%eax)
  800249:	8b 02                	mov    (%edx),%eax
  80024b:	99                   	cltd
  80024c:	c3                   	ret
  80024d:	8b 10                	mov    (%eax),%edx
  80024f:	8d 4a 08             	lea    0x8(%edx),%ecx
  800252:	89 08                	mov    %ecx,(%eax)
  800254:	8b 02                	mov    (%edx),%eax
  800256:	8b 52 04             	mov    0x4(%edx),%edx
  800259:	c3                   	ret
  80025a:	8b 10                	mov    (%eax),%edx
  80025c:	8d 4a 04             	lea    0x4(%edx),%ecx
  80025f:	89 08                	mov    %ecx,(%eax)
  800261:	8b 02                	mov    (%edx),%eax
  800263:	99                   	cltd
  800264:	c3                   	ret

00800265 <sprintputch>:
  800265:	55                   	push   %ebp
  800266:	89 e5                	mov    %esp,%ebp
  800268:	8b 45 0c             	mov    0xc(%ebp),%eax
  80026b:	83 40 08 01          	addl   $0x1,0x8(%eax)
  80026f:	8b 10                	mov    (%eax),%edx
  800271:	3b 50 04             	cmp    0x4(%eax),%edx
  800274:	73 0a                	jae    800280 <sprintputch+0x1b>
  800276:	8d 4a 01             	lea    0x1(%edx),%ecx
  800279:	89 08                	mov    %ecx,(%eax)
  80027b:	8b 45 08             	mov    0x8(%ebp),%eax
  80027e:	88 02                	mov    %al,(%edx)
  800280:	5d                   	pop    %ebp
  800281:	c3                   	ret

00800282 <printfmt>:
  800282:	55                   	push   %ebp
  800283:	89 e5                	mov    %esp,%ebp
  800285:	83 ec 08             	sub    $0x8,%esp
  800288:	8d 45 14             	lea    0x14(%ebp),%eax
  80028b:	50                   	push   %eax
  80028c:	ff 75 10             	push   0x10(%ebp)
  80028f:	ff 75 0c             	push   0xc(%ebp)
  800292:	ff 75 08             	push   0x8(%ebp)
  800295:	e8 05 00 00 00       	call   80029f <vprintfmt>
  80029a:	83 c4 10             	add    $0x10,%esp
  80029d:	c9                   	leave
  80029e:	c3                   	ret

0080029f <vprintfmt>:
  80029f:	55                   	push   %ebp
  8002a0:	89 e5                	mov    %esp,%ebp
  8002a2:	57                   	push   %edi
  8002a3:	56                   	push   %esi
  8002a4:	53                   	push   %ebx
  8002a5:	83 ec 2c             	sub    $0x2c,%esp
  8002a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8002ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  8002ae:	8b 7d 10             	mov    0x10(%ebp),%edi
  8002b1:	eb 0a                	jmp    8002bd <vprintfmt+0x1e>
  8002b3:	83 ec 08             	sub    $0x8,%esp
  8002b6:	56                   	push   %esi
  8002b7:	50                   	push   %eax
  8002b8:	ff d3                	call   *%ebx
  8002ba:	83 c4 10             	add    $0x10,%esp
  8002bd:	83 c7 01             	add    $0x1,%edi
  8002c0:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8002c4:	83 f8 25             	cmp    $0x25,%eax
  8002c7:	74 0c                	je     8002d5 <vprintfmt+0x36>
  8002c9:	85 c0                	test   %eax,%eax
  8002cb:	75 e6                	jne    8002b3 <vprintfmt+0x14>
  8002cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002d0:	5b                   	pop    %ebx
  8002d1:	5e                   	pop    %esi
  8002d2:	5f                   	pop    %edi
  8002d3:	5d                   	pop    %ebp
  8002d4:	c3                   	ret
  8002d5:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8002d9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  8002e0:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8002e7:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  8002ee:	b9 00 00 00 00       	mov    $0x0,%ecx
  8002f3:	8d 47 01             	lea    0x1(%edi),%eax
  8002f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8002f9:	0f b6 17             	movzbl (%edi),%edx
  8002fc:	8d 42 dd             	lea    -0x23(%edx),%eax
  8002ff:	3c 55                	cmp    $0x55,%al
  800301:	0f 87 c3 02 00 00    	ja     8005ca <vprintfmt+0x32b>
  800307:	0f b6 c0             	movzbl %al,%eax
  80030a:	ff 24 85 80 0f 80 00 	jmp    *0x800f80(,%eax,4)
  800311:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800314:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800318:	eb d9                	jmp    8002f3 <vprintfmt+0x54>
  80031a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80031d:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800321:	eb d0                	jmp    8002f3 <vprintfmt+0x54>
  800323:	0f b6 d2             	movzbl %dl,%edx
  800326:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800329:	b8 00 00 00 00       	mov    $0x0,%eax
  80032e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800331:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800334:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800338:	0f be 17             	movsbl (%edi),%edx
  80033b:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80033e:	83 f9 09             	cmp    $0x9,%ecx
  800341:	77 52                	ja     800395 <vprintfmt+0xf6>
  800343:	83 c7 01             	add    $0x1,%edi
  800346:	eb e9                	jmp    800331 <vprintfmt+0x92>
  800348:	8b 45 14             	mov    0x14(%ebp),%eax
  80034b:	8d 50 04             	lea    0x4(%eax),%edx
  80034e:	89 55 14             	mov    %edx,0x14(%ebp)
  800351:	8b 00                	mov    (%eax),%eax
  800353:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800356:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800359:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80035d:	79 94                	jns    8002f3 <vprintfmt+0x54>
  80035f:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800362:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800365:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80036c:	eb 85                	jmp    8002f3 <vprintfmt+0x54>
  80036e:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800371:	85 d2                	test   %edx,%edx
  800373:	b8 00 00 00 00       	mov    $0x0,%eax
  800378:	0f 49 c2             	cmovns %edx,%eax
  80037b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80037e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800381:	e9 6d ff ff ff       	jmp    8002f3 <vprintfmt+0x54>
  800386:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800389:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  800390:	e9 5e ff ff ff       	jmp    8002f3 <vprintfmt+0x54>
  800395:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  800398:	89 45 d0             	mov    %eax,-0x30(%ebp)
  80039b:	eb bc                	jmp    800359 <vprintfmt+0xba>
  80039d:	83 c1 01             	add    $0x1,%ecx
  8003a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003a3:	e9 4b ff ff ff       	jmp    8002f3 <vprintfmt+0x54>
  8003a8:	8b 45 14             	mov    0x14(%ebp),%eax
  8003ab:	8d 50 04             	lea    0x4(%eax),%edx
  8003ae:	89 55 14             	mov    %edx,0x14(%ebp)
  8003b1:	83 ec 08             	sub    $0x8,%esp
  8003b4:	56                   	push   %esi
  8003b5:	ff 30                	push   (%eax)
  8003b7:	ff d3                	call   *%ebx
  8003b9:	83 c4 10             	add    $0x10,%esp
  8003bc:	e9 a0 01 00 00       	jmp    800561 <vprintfmt+0x2c2>
  8003c1:	8b 45 14             	mov    0x14(%ebp),%eax
  8003c4:	8d 50 04             	lea    0x4(%eax),%edx
  8003c7:	89 55 14             	mov    %edx,0x14(%ebp)
  8003ca:	8b 10                	mov    (%eax),%edx
  8003cc:	89 d0                	mov    %edx,%eax
  8003ce:	f7 d8                	neg    %eax
  8003d0:	0f 48 c2             	cmovs  %edx,%eax
  8003d3:	83 f8 08             	cmp    $0x8,%eax
  8003d6:	7f 20                	jg     8003f8 <vprintfmt+0x159>
  8003d8:	8b 14 85 e0 10 80 00 	mov    0x8010e0(,%eax,4),%edx
  8003df:	85 d2                	test   %edx,%edx
  8003e1:	74 15                	je     8003f8 <vprintfmt+0x159>
  8003e3:	52                   	push   %edx
  8003e4:	68 b9 0e 80 00       	push   $0x800eb9
  8003e9:	56                   	push   %esi
  8003ea:	53                   	push   %ebx
  8003eb:	e8 92 fe ff ff       	call   800282 <printfmt>
  8003f0:	83 c4 10             	add    $0x10,%esp
  8003f3:	e9 69 01 00 00       	jmp    800561 <vprintfmt+0x2c2>
  8003f8:	50                   	push   %eax
  8003f9:	68 b0 0e 80 00       	push   $0x800eb0
  8003fe:	56                   	push   %esi
  8003ff:	53                   	push   %ebx
  800400:	e8 7d fe ff ff       	call   800282 <printfmt>
  800405:	83 c4 10             	add    $0x10,%esp
  800408:	e9 54 01 00 00       	jmp    800561 <vprintfmt+0x2c2>
  80040d:	8b 45 14             	mov    0x14(%ebp),%eax
  800410:	8d 50 04             	lea    0x4(%eax),%edx
  800413:	89 55 14             	mov    %edx,0x14(%ebp)
  800416:	8b 08                	mov    (%eax),%ecx
  800418:	85 c9                	test   %ecx,%ecx
  80041a:	b8 a9 0e 80 00       	mov    $0x800ea9,%eax
  80041f:	0f 45 c1             	cmovne %ecx,%eax
  800422:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800425:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800429:	7e 06                	jle    800431 <vprintfmt+0x192>
  80042b:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  80042f:	75 0b                	jne    80043c <vprintfmt+0x19d>
  800431:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800434:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800437:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80043a:	eb 5c                	jmp    800498 <vprintfmt+0x1f9>
  80043c:	83 ec 08             	sub    $0x8,%esp
  80043f:	ff 75 d0             	push   -0x30(%ebp)
  800442:	ff 75 cc             	push   -0x34(%ebp)
  800445:	e8 20 02 00 00       	call   80066a <strnlen>
  80044a:	89 c2                	mov    %eax,%edx
  80044c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80044f:	29 d0                	sub    %edx,%eax
  800451:	83 c4 10             	add    $0x10,%esp
  800454:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800458:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80045b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80045e:	89 c3                	mov    %eax,%ebx
  800460:	eb 0e                	jmp    800470 <vprintfmt+0x1d1>
  800462:	83 ec 08             	sub    $0x8,%esp
  800465:	56                   	push   %esi
  800466:	57                   	push   %edi
  800467:	ff 55 08             	call   *0x8(%ebp)
  80046a:	83 eb 01             	sub    $0x1,%ebx
  80046d:	83 c4 10             	add    $0x10,%esp
  800470:	85 db                	test   %ebx,%ebx
  800472:	7f ee                	jg     800462 <vprintfmt+0x1c3>
  800474:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800477:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80047a:	85 c0                	test   %eax,%eax
  80047c:	ba 00 00 00 00       	mov    $0x0,%edx
  800481:	0f 49 d0             	cmovns %eax,%edx
  800484:	29 d0                	sub    %edx,%eax
  800486:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800489:	eb a6                	jmp    800431 <vprintfmt+0x192>
  80048b:	83 ec 08             	sub    $0x8,%esp
  80048e:	56                   	push   %esi
  80048f:	52                   	push   %edx
  800490:	ff 55 08             	call   *0x8(%ebp)
  800493:	83 c4 10             	add    $0x10,%esp
  800496:	89 d9                	mov    %ebx,%ecx
  800498:	8d 59 01             	lea    0x1(%ecx),%ebx
  80049b:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  80049f:	0f be d0             	movsbl %al,%edx
  8004a2:	85 d2                	test   %edx,%edx
  8004a4:	74 28                	je     8004ce <vprintfmt+0x22f>
  8004a6:	85 ff                	test   %edi,%edi
  8004a8:	78 05                	js     8004af <vprintfmt+0x210>
  8004aa:	83 ef 01             	sub    $0x1,%edi
  8004ad:	78 2e                	js     8004dd <vprintfmt+0x23e>
  8004af:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8004b3:	74 d6                	je     80048b <vprintfmt+0x1ec>
  8004b5:	0f be c0             	movsbl %al,%eax
  8004b8:	83 e8 20             	sub    $0x20,%eax
  8004bb:	83 f8 5e             	cmp    $0x5e,%eax
  8004be:	76 cb                	jbe    80048b <vprintfmt+0x1ec>
  8004c0:	83 ec 08             	sub    $0x8,%esp
  8004c3:	56                   	push   %esi
  8004c4:	6a 3f                	push   $0x3f
  8004c6:	ff 55 08             	call   *0x8(%ebp)
  8004c9:	83 c4 10             	add    $0x10,%esp
  8004cc:	eb c8                	jmp    800496 <vprintfmt+0x1f7>
  8004ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004d1:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8004d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004d7:	01 c7                	add    %eax,%edi
  8004d9:	29 cf                	sub    %ecx,%edi
  8004db:	eb 13                	jmp    8004f0 <vprintfmt+0x251>
  8004dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004e0:	eb ef                	jmp    8004d1 <vprintfmt+0x232>
  8004e2:	83 ec 08             	sub    $0x8,%esp
  8004e5:	56                   	push   %esi
  8004e6:	6a 20                	push   $0x20
  8004e8:	ff d3                	call   *%ebx
  8004ea:	83 ef 01             	sub    $0x1,%edi
  8004ed:	83 c4 10             	add    $0x10,%esp
  8004f0:	85 ff                	test   %edi,%edi
  8004f2:	7f ee                	jg     8004e2 <vprintfmt+0x243>
  8004f4:	eb 6b                	jmp    800561 <vprintfmt+0x2c2>
  8004f6:	89 ca                	mov    %ecx,%edx
  8004f8:	8d 45 14             	lea    0x14(%ebp),%eax
  8004fb:	e8 39 fd ff ff       	call   800239 <getint>
  800500:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800503:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800506:	85 d2                	test   %edx,%edx
  800508:	78 0b                	js     800515 <vprintfmt+0x276>
  80050a:	89 d1                	mov    %edx,%ecx
  80050c:	89 c2                	mov    %eax,%edx
  80050e:	bf 0a 00 00 00       	mov    $0xa,%edi
  800513:	eb 32                	jmp    800547 <vprintfmt+0x2a8>
  800515:	83 ec 08             	sub    $0x8,%esp
  800518:	56                   	push   %esi
  800519:	6a 2d                	push   $0x2d
  80051b:	ff d3                	call   *%ebx
  80051d:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800520:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800523:	f7 da                	neg    %edx
  800525:	83 d1 00             	adc    $0x0,%ecx
  800528:	f7 d9                	neg    %ecx
  80052a:	83 c4 10             	add    $0x10,%esp
  80052d:	bf 0a 00 00 00       	mov    $0xa,%edi
  800532:	eb 13                	jmp    800547 <vprintfmt+0x2a8>
  800534:	89 ca                	mov    %ecx,%edx
  800536:	8d 45 14             	lea    0x14(%ebp),%eax
  800539:	e8 c7 fc ff ff       	call   800205 <getuint>
  80053e:	89 d1                	mov    %edx,%ecx
  800540:	89 c2                	mov    %eax,%edx
  800542:	bf 0a 00 00 00       	mov    $0xa,%edi
  800547:	83 ec 0c             	sub    $0xc,%esp
  80054a:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80054e:	50                   	push   %eax
  80054f:	ff 75 e0             	push   -0x20(%ebp)
  800552:	57                   	push   %edi
  800553:	51                   	push   %ecx
  800554:	52                   	push   %edx
  800555:	89 f2                	mov    %esi,%edx
  800557:	89 d8                	mov    %ebx,%eax
  800559:	e8 fe fb ff ff       	call   80015c <printnum>
  80055e:	83 c4 20             	add    $0x20,%esp
  800561:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800564:	e9 54 fd ff ff       	jmp    8002bd <vprintfmt+0x1e>
  800569:	89 ca                	mov    %ecx,%edx
  80056b:	8d 45 14             	lea    0x14(%ebp),%eax
  80056e:	e8 92 fc ff ff       	call   800205 <getuint>
  800573:	89 d1                	mov    %edx,%ecx
  800575:	89 c2                	mov    %eax,%edx
  800577:	bf 08 00 00 00       	mov    $0x8,%edi
  80057c:	eb c9                	jmp    800547 <vprintfmt+0x2a8>
  80057e:	83 ec 08             	sub    $0x8,%esp
  800581:	56                   	push   %esi
  800582:	6a 30                	push   $0x30
  800584:	ff d3                	call   *%ebx
  800586:	83 c4 08             	add    $0x8,%esp
  800589:	56                   	push   %esi
  80058a:	6a 78                	push   $0x78
  80058c:	ff d3                	call   *%ebx
  80058e:	8b 45 14             	mov    0x14(%ebp),%eax
  800591:	8d 50 04             	lea    0x4(%eax),%edx
  800594:	89 55 14             	mov    %edx,0x14(%ebp)
  800597:	8b 10                	mov    (%eax),%edx
  800599:	b9 00 00 00 00       	mov    $0x0,%ecx
  80059e:	83 c4 10             	add    $0x10,%esp
  8005a1:	bf 10 00 00 00       	mov    $0x10,%edi
  8005a6:	eb 9f                	jmp    800547 <vprintfmt+0x2a8>
  8005a8:	89 ca                	mov    %ecx,%edx
  8005aa:	8d 45 14             	lea    0x14(%ebp),%eax
  8005ad:	e8 53 fc ff ff       	call   800205 <getuint>
  8005b2:	89 d1                	mov    %edx,%ecx
  8005b4:	89 c2                	mov    %eax,%edx
  8005b6:	bf 10 00 00 00       	mov    $0x10,%edi
  8005bb:	eb 8a                	jmp    800547 <vprintfmt+0x2a8>
  8005bd:	83 ec 08             	sub    $0x8,%esp
  8005c0:	56                   	push   %esi
  8005c1:	6a 25                	push   $0x25
  8005c3:	ff d3                	call   *%ebx
  8005c5:	83 c4 10             	add    $0x10,%esp
  8005c8:	eb 97                	jmp    800561 <vprintfmt+0x2c2>
  8005ca:	83 ec 08             	sub    $0x8,%esp
  8005cd:	56                   	push   %esi
  8005ce:	6a 25                	push   $0x25
  8005d0:	ff d3                	call   *%ebx
  8005d2:	83 c4 10             	add    $0x10,%esp
  8005d5:	89 f8                	mov    %edi,%eax
  8005d7:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  8005db:	74 05                	je     8005e2 <vprintfmt+0x343>
  8005dd:	83 e8 01             	sub    $0x1,%eax
  8005e0:	eb f5                	jmp    8005d7 <vprintfmt+0x338>
  8005e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8005e5:	e9 77 ff ff ff       	jmp    800561 <vprintfmt+0x2c2>

008005ea <vsnprintf>:
  8005ea:	55                   	push   %ebp
  8005eb:	89 e5                	mov    %esp,%ebp
  8005ed:	83 ec 18             	sub    $0x18,%esp
  8005f0:	8b 45 08             	mov    0x8(%ebp),%eax
  8005f3:	8b 55 0c             	mov    0xc(%ebp),%edx
  8005f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  8005f9:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  8005fd:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800600:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800607:	85 c0                	test   %eax,%eax
  800609:	74 26                	je     800631 <vsnprintf+0x47>
  80060b:	85 d2                	test   %edx,%edx
  80060d:	7e 22                	jle    800631 <vsnprintf+0x47>
  80060f:	ff 75 14             	push   0x14(%ebp)
  800612:	ff 75 10             	push   0x10(%ebp)
  800615:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800618:	50                   	push   %eax
  800619:	68 65 02 80 00       	push   $0x800265
  80061e:	e8 7c fc ff ff       	call   80029f <vprintfmt>
  800623:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800626:	c6 00 00             	movb   $0x0,(%eax)
  800629:	8b 45 f4             	mov    -0xc(%ebp),%eax
  80062c:	83 c4 10             	add    $0x10,%esp
  80062f:	c9                   	leave
  800630:	c3                   	ret
  800631:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800636:	eb f7                	jmp    80062f <vsnprintf+0x45>

00800638 <snprintf>:
  800638:	55                   	push   %ebp
  800639:	89 e5                	mov    %esp,%ebp
  80063b:	83 ec 08             	sub    $0x8,%esp
  80063e:	8d 45 14             	lea    0x14(%ebp),%eax
  800641:	50                   	push   %eax
  800642:	ff 75 10             	push   0x10(%ebp)
  800645:	ff 75 0c             	push   0xc(%ebp)
  800648:	ff 75 08             	push   0x8(%ebp)
  80064b:	e8 9a ff ff ff       	call   8005ea <vsnprintf>
  800650:	c9                   	leave
  800651:	c3                   	ret

00800652 <strlen>:
  800652:	55                   	push   %ebp
  800653:	89 e5                	mov    %esp,%ebp
  800655:	8b 55 08             	mov    0x8(%ebp),%edx
  800658:	b8 00 00 00 00       	mov    $0x0,%eax
  80065d:	eb 03                	jmp    800662 <strlen+0x10>
  80065f:	83 c0 01             	add    $0x1,%eax
  800662:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800666:	75 f7                	jne    80065f <strlen+0xd>
  800668:	5d                   	pop    %ebp
  800669:	c3                   	ret

0080066a <strnlen>:
  80066a:	55                   	push   %ebp
  80066b:	89 e5                	mov    %esp,%ebp
  80066d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800670:	8b 55 0c             	mov    0xc(%ebp),%edx
  800673:	b8 00 00 00 00       	mov    $0x0,%eax
  800678:	eb 03                	jmp    80067d <strnlen+0x13>
  80067a:	83 c0 01             	add    $0x1,%eax
  80067d:	39 d0                	cmp    %edx,%eax
  80067f:	74 08                	je     800689 <strnlen+0x1f>
  800681:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  800685:	75 f3                	jne    80067a <strnlen+0x10>
  800687:	89 c2                	mov    %eax,%edx
  800689:	89 d0                	mov    %edx,%eax
  80068b:	5d                   	pop    %ebp
  80068c:	c3                   	ret

0080068d <strcpy>:
  80068d:	55                   	push   %ebp
  80068e:	89 e5                	mov    %esp,%ebp
  800690:	53                   	push   %ebx
  800691:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800694:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800697:	b8 00 00 00 00       	mov    $0x0,%eax
  80069c:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8006a0:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8006a3:	83 c0 01             	add    $0x1,%eax
  8006a6:	84 d2                	test   %dl,%dl
  8006a8:	75 f2                	jne    80069c <strcpy+0xf>
  8006aa:	89 c8                	mov    %ecx,%eax
  8006ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006af:	c9                   	leave
  8006b0:	c3                   	ret

008006b1 <strcat>:
  8006b1:	55                   	push   %ebp
  8006b2:	89 e5                	mov    %esp,%ebp
  8006b4:	53                   	push   %ebx
  8006b5:	83 ec 10             	sub    $0x10,%esp
  8006b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006bb:	53                   	push   %ebx
  8006bc:	e8 91 ff ff ff       	call   800652 <strlen>
  8006c1:	83 c4 08             	add    $0x8,%esp
  8006c4:	ff 75 0c             	push   0xc(%ebp)
  8006c7:	01 d8                	add    %ebx,%eax
  8006c9:	50                   	push   %eax
  8006ca:	e8 be ff ff ff       	call   80068d <strcpy>
  8006cf:	89 d8                	mov    %ebx,%eax
  8006d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006d4:	c9                   	leave
  8006d5:	c3                   	ret

008006d6 <strncpy>:
  8006d6:	55                   	push   %ebp
  8006d7:	89 e5                	mov    %esp,%ebp
  8006d9:	56                   	push   %esi
  8006da:	53                   	push   %ebx
  8006db:	8b 75 08             	mov    0x8(%ebp),%esi
  8006de:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006e1:	89 f3                	mov    %esi,%ebx
  8006e3:	03 5d 10             	add    0x10(%ebp),%ebx
  8006e6:	89 f0                	mov    %esi,%eax
  8006e8:	eb 0f                	jmp    8006f9 <strncpy+0x23>
  8006ea:	83 c0 01             	add    $0x1,%eax
  8006ed:	0f b6 0a             	movzbl (%edx),%ecx
  8006f0:	88 48 ff             	mov    %cl,-0x1(%eax)
  8006f3:	80 f9 01             	cmp    $0x1,%cl
  8006f6:	83 da ff             	sbb    $0xffffffff,%edx
  8006f9:	39 d8                	cmp    %ebx,%eax
  8006fb:	75 ed                	jne    8006ea <strncpy+0x14>
  8006fd:	89 f0                	mov    %esi,%eax
  8006ff:	5b                   	pop    %ebx
  800700:	5e                   	pop    %esi
  800701:	5d                   	pop    %ebp
  800702:	c3                   	ret

00800703 <strlcpy>:
  800703:	55                   	push   %ebp
  800704:	89 e5                	mov    %esp,%ebp
  800706:	56                   	push   %esi
  800707:	53                   	push   %ebx
  800708:	8b 75 08             	mov    0x8(%ebp),%esi
  80070b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80070e:	8b 55 10             	mov    0x10(%ebp),%edx
  800711:	89 f0                	mov    %esi,%eax
  800713:	85 d2                	test   %edx,%edx
  800715:	74 21                	je     800738 <strlcpy+0x35>
  800717:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  80071b:	89 f2                	mov    %esi,%edx
  80071d:	eb 09                	jmp    800728 <strlcpy+0x25>
  80071f:	83 c1 01             	add    $0x1,%ecx
  800722:	83 c2 01             	add    $0x1,%edx
  800725:	88 5a ff             	mov    %bl,-0x1(%edx)
  800728:	39 c2                	cmp    %eax,%edx
  80072a:	74 09                	je     800735 <strlcpy+0x32>
  80072c:	0f b6 19             	movzbl (%ecx),%ebx
  80072f:	84 db                	test   %bl,%bl
  800731:	75 ec                	jne    80071f <strlcpy+0x1c>
  800733:	89 d0                	mov    %edx,%eax
  800735:	c6 00 00             	movb   $0x0,(%eax)
  800738:	29 f0                	sub    %esi,%eax
  80073a:	5b                   	pop    %ebx
  80073b:	5e                   	pop    %esi
  80073c:	5d                   	pop    %ebp
  80073d:	c3                   	ret

0080073e <strcmp>:
  80073e:	55                   	push   %ebp
  80073f:	89 e5                	mov    %esp,%ebp
  800741:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800744:	8b 55 0c             	mov    0xc(%ebp),%edx
  800747:	eb 06                	jmp    80074f <strcmp+0x11>
  800749:	83 c1 01             	add    $0x1,%ecx
  80074c:	83 c2 01             	add    $0x1,%edx
  80074f:	0f b6 01             	movzbl (%ecx),%eax
  800752:	84 c0                	test   %al,%al
  800754:	74 04                	je     80075a <strcmp+0x1c>
  800756:	3a 02                	cmp    (%edx),%al
  800758:	74 ef                	je     800749 <strcmp+0xb>
  80075a:	0f b6 c0             	movzbl %al,%eax
  80075d:	0f b6 12             	movzbl (%edx),%edx
  800760:	29 d0                	sub    %edx,%eax
  800762:	5d                   	pop    %ebp
  800763:	c3                   	ret

00800764 <strncmp>:
  800764:	55                   	push   %ebp
  800765:	89 e5                	mov    %esp,%ebp
  800767:	53                   	push   %ebx
  800768:	8b 45 08             	mov    0x8(%ebp),%eax
  80076b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80076e:	8b 55 10             	mov    0x10(%ebp),%edx
  800771:	eb 09                	jmp    80077c <strncmp+0x18>
  800773:	83 ea 01             	sub    $0x1,%edx
  800776:	83 c0 01             	add    $0x1,%eax
  800779:	83 c1 01             	add    $0x1,%ecx
  80077c:	85 d2                	test   %edx,%edx
  80077e:	74 18                	je     800798 <strncmp+0x34>
  800780:	0f b6 18             	movzbl (%eax),%ebx
  800783:	84 db                	test   %bl,%bl
  800785:	74 04                	je     80078b <strncmp+0x27>
  800787:	3a 19                	cmp    (%ecx),%bl
  800789:	74 e8                	je     800773 <strncmp+0xf>
  80078b:	0f b6 00             	movzbl (%eax),%eax
  80078e:	0f b6 11             	movzbl (%ecx),%edx
  800791:	29 d0                	sub    %edx,%eax
  800793:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800796:	c9                   	leave
  800797:	c3                   	ret
  800798:	b8 00 00 00 00       	mov    $0x0,%eax
  80079d:	eb f4                	jmp    800793 <strncmp+0x2f>

0080079f <strchr>:
  80079f:	55                   	push   %ebp
  8007a0:	89 e5                	mov    %esp,%ebp
  8007a2:	8b 45 08             	mov    0x8(%ebp),%eax
  8007a5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007a9:	eb 03                	jmp    8007ae <strchr+0xf>
  8007ab:	83 c0 01             	add    $0x1,%eax
  8007ae:	0f b6 10             	movzbl (%eax),%edx
  8007b1:	84 d2                	test   %dl,%dl
  8007b3:	74 06                	je     8007bb <strchr+0x1c>
  8007b5:	38 ca                	cmp    %cl,%dl
  8007b7:	75 f2                	jne    8007ab <strchr+0xc>
  8007b9:	eb 05                	jmp    8007c0 <strchr+0x21>
  8007bb:	b8 00 00 00 00       	mov    $0x0,%eax
  8007c0:	5d                   	pop    %ebp
  8007c1:	c3                   	ret

008007c2 <strfind>:
  8007c2:	55                   	push   %ebp
  8007c3:	89 e5                	mov    %esp,%ebp
  8007c5:	8b 45 08             	mov    0x8(%ebp),%eax
  8007c8:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007cc:	0f b6 10             	movzbl (%eax),%edx
  8007cf:	38 ca                	cmp    %cl,%dl
  8007d1:	74 09                	je     8007dc <strfind+0x1a>
  8007d3:	84 d2                	test   %dl,%dl
  8007d5:	74 05                	je     8007dc <strfind+0x1a>
  8007d7:	83 c0 01             	add    $0x1,%eax
  8007da:	eb f0                	jmp    8007cc <strfind+0xa>
  8007dc:	5d                   	pop    %ebp
  8007dd:	c3                   	ret

008007de <memset>:
  8007de:	55                   	push   %ebp
  8007df:	89 e5                	mov    %esp,%ebp
  8007e1:	57                   	push   %edi
  8007e2:	8b 55 08             	mov    0x8(%ebp),%edx
  8007e5:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8007e8:	85 c9                	test   %ecx,%ecx
  8007ea:	74 24                	je     800810 <memset+0x32>
  8007ec:	89 d0                	mov    %edx,%eax
  8007ee:	09 c8                	or     %ecx,%eax
  8007f0:	a8 03                	test   $0x3,%al
  8007f2:	75 14                	jne    800808 <memset+0x2a>
  8007f4:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  8007f8:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  8007fe:	c1 e9 02             	shr    $0x2,%ecx
  800801:	89 d7                	mov    %edx,%edi
  800803:	fc                   	cld
  800804:	f3 ab                	rep stos %eax,%es:(%edi)
  800806:	eb 08                	jmp    800810 <memset+0x32>
  800808:	89 d7                	mov    %edx,%edi
  80080a:	8b 45 0c             	mov    0xc(%ebp),%eax
  80080d:	fc                   	cld
  80080e:	f3 aa                	rep stos %al,%es:(%edi)
  800810:	89 d0                	mov    %edx,%eax
  800812:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800815:	c9                   	leave
  800816:	c3                   	ret

00800817 <memmove>:
  800817:	55                   	push   %ebp
  800818:	89 e5                	mov    %esp,%ebp
  80081a:	57                   	push   %edi
  80081b:	56                   	push   %esi
  80081c:	8b 45 08             	mov    0x8(%ebp),%eax
  80081f:	8b 75 0c             	mov    0xc(%ebp),%esi
  800822:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800825:	39 c6                	cmp    %eax,%esi
  800827:	73 32                	jae    80085b <memmove+0x44>
  800829:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  80082c:	39 d0                	cmp    %edx,%eax
  80082e:	73 2b                	jae    80085b <memmove+0x44>
  800830:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800833:	89 fe                	mov    %edi,%esi
  800835:	09 ce                	or     %ecx,%esi
  800837:	09 d6                	or     %edx,%esi
  800839:	f7 c6 03 00 00 00    	test   $0x3,%esi
  80083f:	75 0e                	jne    80084f <memmove+0x38>
  800841:	83 ef 04             	sub    $0x4,%edi
  800844:	8d 72 fc             	lea    -0x4(%edx),%esi
  800847:	c1 e9 02             	shr    $0x2,%ecx
  80084a:	fd                   	std
  80084b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80084d:	eb 09                	jmp    800858 <memmove+0x41>
  80084f:	83 ef 01             	sub    $0x1,%edi
  800852:	8d 72 ff             	lea    -0x1(%edx),%esi
  800855:	fd                   	std
  800856:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800858:	fc                   	cld
  800859:	eb 1a                	jmp    800875 <memmove+0x5e>
  80085b:	89 c2                	mov    %eax,%edx
  80085d:	09 ca                	or     %ecx,%edx
  80085f:	09 f2                	or     %esi,%edx
  800861:	f6 c2 03             	test   $0x3,%dl
  800864:	75 0a                	jne    800870 <memmove+0x59>
  800866:	c1 e9 02             	shr    $0x2,%ecx
  800869:	89 c7                	mov    %eax,%edi
  80086b:	fc                   	cld
  80086c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80086e:	eb 05                	jmp    800875 <memmove+0x5e>
  800870:	89 c7                	mov    %eax,%edi
  800872:	fc                   	cld
  800873:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800875:	5e                   	pop    %esi
  800876:	5f                   	pop    %edi
  800877:	5d                   	pop    %ebp
  800878:	c3                   	ret

00800879 <memcpy>:
  800879:	55                   	push   %ebp
  80087a:	89 e5                	mov    %esp,%ebp
  80087c:	83 ec 0c             	sub    $0xc,%esp
  80087f:	ff 75 10             	push   0x10(%ebp)
  800882:	ff 75 0c             	push   0xc(%ebp)
  800885:	ff 75 08             	push   0x8(%ebp)
  800888:	e8 8a ff ff ff       	call   800817 <memmove>
  80088d:	c9                   	leave
  80088e:	c3                   	ret

0080088f <memcmp>:
  80088f:	55                   	push   %ebp
  800890:	89 e5                	mov    %esp,%ebp
  800892:	56                   	push   %esi
  800893:	53                   	push   %ebx
  800894:	8b 45 08             	mov    0x8(%ebp),%eax
  800897:	8b 55 0c             	mov    0xc(%ebp),%edx
  80089a:	89 c6                	mov    %eax,%esi
  80089c:	03 75 10             	add    0x10(%ebp),%esi
  80089f:	eb 06                	jmp    8008a7 <memcmp+0x18>
  8008a1:	83 c0 01             	add    $0x1,%eax
  8008a4:	83 c2 01             	add    $0x1,%edx
  8008a7:	39 f0                	cmp    %esi,%eax
  8008a9:	74 14                	je     8008bf <memcmp+0x30>
  8008ab:	0f b6 08             	movzbl (%eax),%ecx
  8008ae:	0f b6 1a             	movzbl (%edx),%ebx
  8008b1:	38 d9                	cmp    %bl,%cl
  8008b3:	74 ec                	je     8008a1 <memcmp+0x12>
  8008b5:	0f b6 c1             	movzbl %cl,%eax
  8008b8:	0f b6 db             	movzbl %bl,%ebx
  8008bb:	29 d8                	sub    %ebx,%eax
  8008bd:	eb 05                	jmp    8008c4 <memcmp+0x35>
  8008bf:	b8 00 00 00 00       	mov    $0x0,%eax
  8008c4:	5b                   	pop    %ebx
  8008c5:	5e                   	pop    %esi
  8008c6:	5d                   	pop    %ebp
  8008c7:	c3                   	ret

008008c8 <memfind>:
  8008c8:	55                   	push   %ebp
  8008c9:	89 e5                	mov    %esp,%ebp
  8008cb:	8b 45 08             	mov    0x8(%ebp),%eax
  8008ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8008d1:	89 c2                	mov    %eax,%edx
  8008d3:	03 55 10             	add    0x10(%ebp),%edx
  8008d6:	eb 03                	jmp    8008db <memfind+0x13>
  8008d8:	83 c0 01             	add    $0x1,%eax
  8008db:	39 d0                	cmp    %edx,%eax
  8008dd:	73 04                	jae    8008e3 <memfind+0x1b>
  8008df:	38 08                	cmp    %cl,(%eax)
  8008e1:	75 f5                	jne    8008d8 <memfind+0x10>
  8008e3:	5d                   	pop    %ebp
  8008e4:	c3                   	ret

008008e5 <strtol>:
  8008e5:	55                   	push   %ebp
  8008e6:	89 e5                	mov    %esp,%ebp
  8008e8:	57                   	push   %edi
  8008e9:	56                   	push   %esi
  8008ea:	53                   	push   %ebx
  8008eb:	8b 55 08             	mov    0x8(%ebp),%edx
  8008ee:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8008f1:	eb 03                	jmp    8008f6 <strtol+0x11>
  8008f3:	83 c2 01             	add    $0x1,%edx
  8008f6:	0f b6 02             	movzbl (%edx),%eax
  8008f9:	3c 20                	cmp    $0x20,%al
  8008fb:	74 f6                	je     8008f3 <strtol+0xe>
  8008fd:	3c 09                	cmp    $0x9,%al
  8008ff:	74 f2                	je     8008f3 <strtol+0xe>
  800901:	3c 2b                	cmp    $0x2b,%al
  800903:	74 2a                	je     80092f <strtol+0x4a>
  800905:	bf 00 00 00 00       	mov    $0x0,%edi
  80090a:	3c 2d                	cmp    $0x2d,%al
  80090c:	74 2b                	je     800939 <strtol+0x54>
  80090e:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800914:	75 0f                	jne    800925 <strtol+0x40>
  800916:	80 3a 30             	cmpb   $0x30,(%edx)
  800919:	74 28                	je     800943 <strtol+0x5e>
  80091b:	85 db                	test   %ebx,%ebx
  80091d:	b8 0a 00 00 00       	mov    $0xa,%eax
  800922:	0f 44 d8             	cmove  %eax,%ebx
  800925:	b9 00 00 00 00       	mov    $0x0,%ecx
  80092a:	89 5d 10             	mov    %ebx,0x10(%ebp)
  80092d:	eb 46                	jmp    800975 <strtol+0x90>
  80092f:	83 c2 01             	add    $0x1,%edx
  800932:	bf 00 00 00 00       	mov    $0x0,%edi
  800937:	eb d5                	jmp    80090e <strtol+0x29>
  800939:	83 c2 01             	add    $0x1,%edx
  80093c:	bf 01 00 00 00       	mov    $0x1,%edi
  800941:	eb cb                	jmp    80090e <strtol+0x29>
  800943:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800947:	74 0e                	je     800957 <strtol+0x72>
  800949:	85 db                	test   %ebx,%ebx
  80094b:	75 d8                	jne    800925 <strtol+0x40>
  80094d:	83 c2 01             	add    $0x1,%edx
  800950:	bb 08 00 00 00       	mov    $0x8,%ebx
  800955:	eb ce                	jmp    800925 <strtol+0x40>
  800957:	83 c2 02             	add    $0x2,%edx
  80095a:	bb 10 00 00 00       	mov    $0x10,%ebx
  80095f:	eb c4                	jmp    800925 <strtol+0x40>
  800961:	0f be c0             	movsbl %al,%eax
  800964:	83 e8 30             	sub    $0x30,%eax
  800967:	3b 45 10             	cmp    0x10(%ebp),%eax
  80096a:	7d 3a                	jge    8009a6 <strtol+0xc1>
  80096c:	83 c2 01             	add    $0x1,%edx
  80096f:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800973:	01 c1                	add    %eax,%ecx
  800975:	0f b6 02             	movzbl (%edx),%eax
  800978:	8d 70 d0             	lea    -0x30(%eax),%esi
  80097b:	89 f3                	mov    %esi,%ebx
  80097d:	80 fb 09             	cmp    $0x9,%bl
  800980:	76 df                	jbe    800961 <strtol+0x7c>
  800982:	8d 70 9f             	lea    -0x61(%eax),%esi
  800985:	89 f3                	mov    %esi,%ebx
  800987:	80 fb 19             	cmp    $0x19,%bl
  80098a:	77 08                	ja     800994 <strtol+0xaf>
  80098c:	0f be c0             	movsbl %al,%eax
  80098f:	83 e8 57             	sub    $0x57,%eax
  800992:	eb d3                	jmp    800967 <strtol+0x82>
  800994:	8d 70 bf             	lea    -0x41(%eax),%esi
  800997:	89 f3                	mov    %esi,%ebx
  800999:	80 fb 19             	cmp    $0x19,%bl
  80099c:	77 08                	ja     8009a6 <strtol+0xc1>
  80099e:	0f be c0             	movsbl %al,%eax
  8009a1:	83 e8 37             	sub    $0x37,%eax
  8009a4:	eb c1                	jmp    800967 <strtol+0x82>
  8009a6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  8009aa:	74 05                	je     8009b1 <strtol+0xcc>
  8009ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  8009af:	89 10                	mov    %edx,(%eax)
  8009b1:	89 c8                	mov    %ecx,%eax
  8009b3:	f7 d8                	neg    %eax
  8009b5:	85 ff                	test   %edi,%edi
  8009b7:	0f 45 c8             	cmovne %eax,%ecx
  8009ba:	89 c8                	mov    %ecx,%eax
  8009bc:	5b                   	pop    %ebx
  8009bd:	5e                   	pop    %esi
  8009be:	5f                   	pop    %edi
  8009bf:	5d                   	pop    %ebp
  8009c0:	c3                   	ret

008009c1 <syscall>:
  8009c1:	55                   	push   %ebp
  8009c2:	89 e5                	mov    %esp,%ebp
  8009c4:	57                   	push   %edi
  8009c5:	56                   	push   %esi
  8009c6:	53                   	push   %ebx
  8009c7:	83 ec 1c             	sub    $0x1c,%esp
  8009ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8009cd:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8009d0:	89 ca                	mov    %ecx,%edx
  8009d2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8009d5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8009d8:	8b 7d 10             	mov    0x10(%ebp),%edi
  8009db:	8b 75 14             	mov    0x14(%ebp),%esi
  8009de:	cd 30                	int    $0x30
  8009e0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8009e4:	74 04                	je     8009ea <syscall+0x29>
  8009e6:	85 c0                	test   %eax,%eax
  8009e8:	7f 08                	jg     8009f2 <syscall+0x31>
  8009ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8009ed:	5b                   	pop    %ebx
  8009ee:	5e                   	pop    %esi
  8009ef:	5f                   	pop    %edi
  8009f0:	5d                   	pop    %ebp
  8009f1:	c3                   	ret
  8009f2:	83 ec 0c             	sub    $0xc,%esp
  8009f5:	50                   	push   %eax
  8009f6:	ff 75 e0             	push   -0x20(%ebp)
  8009f9:	68 4f 0f 80 00       	push   $0x800f4f
  8009fe:	6a 1e                	push   $0x1e
  800a00:	68 6c 0f 80 00       	push   $0x800f6c
  800a05:	e8 b1 01 00 00       	call   800bbb <_panic>

00800a0a <sys_cputs>:
  800a0a:	55                   	push   %ebp
  800a0b:	89 e5                	mov    %esp,%ebp
  800a0d:	83 ec 08             	sub    $0x8,%esp
  800a10:	6a 00                	push   $0x0
  800a12:	6a 00                	push   $0x0
  800a14:	6a 00                	push   $0x0
  800a16:	ff 75 0c             	push   0xc(%ebp)
  800a19:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a1c:	ba 00 00 00 00       	mov    $0x0,%edx
  800a21:	b8 00 00 00 00       	mov    $0x0,%eax
  800a26:	e8 96 ff ff ff       	call   8009c1 <syscall>
  800a2b:	83 c4 10             	add    $0x10,%esp
  800a2e:	c9                   	leave
  800a2f:	c3                   	ret

00800a30 <sys_cgetc>:
  800a30:	55                   	push   %ebp
  800a31:	89 e5                	mov    %esp,%ebp
  800a33:	83 ec 08             	sub    $0x8,%esp
  800a36:	6a 00                	push   $0x0
  800a38:	6a 00                	push   $0x0
  800a3a:	6a 00                	push   $0x0
  800a3c:	6a 00                	push   $0x0
  800a3e:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a43:	ba 00 00 00 00       	mov    $0x0,%edx
  800a48:	b8 01 00 00 00       	mov    $0x1,%eax
  800a4d:	e8 6f ff ff ff       	call   8009c1 <syscall>
  800a52:	c9                   	leave
  800a53:	c3                   	ret

00800a54 <sys_env_destroy>:
  800a54:	55                   	push   %ebp
  800a55:	89 e5                	mov    %esp,%ebp
  800a57:	83 ec 08             	sub    $0x8,%esp
  800a5a:	6a 00                	push   $0x0
  800a5c:	6a 00                	push   $0x0
  800a5e:	6a 00                	push   $0x0
  800a60:	6a 00                	push   $0x0
  800a62:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a65:	ba 01 00 00 00       	mov    $0x1,%edx
  800a6a:	b8 03 00 00 00       	mov    $0x3,%eax
  800a6f:	e8 4d ff ff ff       	call   8009c1 <syscall>
  800a74:	c9                   	leave
  800a75:	c3                   	ret

00800a76 <sys_getenvid>:
  800a76:	55                   	push   %ebp
  800a77:	89 e5                	mov    %esp,%ebp
  800a79:	83 ec 08             	sub    $0x8,%esp
  800a7c:	6a 00                	push   $0x0
  800a7e:	6a 00                	push   $0x0
  800a80:	6a 00                	push   $0x0
  800a82:	6a 00                	push   $0x0
  800a84:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a89:	ba 00 00 00 00       	mov    $0x0,%edx
  800a8e:	b8 02 00 00 00       	mov    $0x2,%eax
  800a93:	e8 29 ff ff ff       	call   8009c1 <syscall>
  800a98:	c9                   	leave
  800a99:	c3                   	ret

00800a9a <sys_yield>:
  800a9a:	55                   	push   %ebp
  800a9b:	89 e5                	mov    %esp,%ebp
  800a9d:	83 ec 08             	sub    $0x8,%esp
  800aa0:	6a 00                	push   $0x0
  800aa2:	6a 00                	push   $0x0
  800aa4:	6a 00                	push   $0x0
  800aa6:	6a 00                	push   $0x0
  800aa8:	b9 00 00 00 00       	mov    $0x0,%ecx
  800aad:	ba 00 00 00 00       	mov    $0x0,%edx
  800ab2:	b8 0a 00 00 00       	mov    $0xa,%eax
  800ab7:	e8 05 ff ff ff       	call   8009c1 <syscall>
  800abc:	83 c4 10             	add    $0x10,%esp
  800abf:	c9                   	leave
  800ac0:	c3                   	ret

00800ac1 <sys_page_alloc>:
  800ac1:	55                   	push   %ebp
  800ac2:	89 e5                	mov    %esp,%ebp
  800ac4:	83 ec 08             	sub    $0x8,%esp
  800ac7:	6a 00                	push   $0x0
  800ac9:	6a 00                	push   $0x0
  800acb:	ff 75 10             	push   0x10(%ebp)
  800ace:	ff 75 0c             	push   0xc(%ebp)
  800ad1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ad4:	ba 01 00 00 00       	mov    $0x1,%edx
  800ad9:	b8 04 00 00 00       	mov    $0x4,%eax
  800ade:	e8 de fe ff ff       	call   8009c1 <syscall>
  800ae3:	c9                   	leave
  800ae4:	c3                   	ret

00800ae5 <sys_page_map>:
  800ae5:	55                   	push   %ebp
  800ae6:	89 e5                	mov    %esp,%ebp
  800ae8:	83 ec 08             	sub    $0x8,%esp
  800aeb:	ff 75 18             	push   0x18(%ebp)
  800aee:	ff 75 14             	push   0x14(%ebp)
  800af1:	ff 75 10             	push   0x10(%ebp)
  800af4:	ff 75 0c             	push   0xc(%ebp)
  800af7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800afa:	ba 01 00 00 00       	mov    $0x1,%edx
  800aff:	b8 05 00 00 00       	mov    $0x5,%eax
  800b04:	e8 b8 fe ff ff       	call   8009c1 <syscall>
  800b09:	c9                   	leave
  800b0a:	c3                   	ret

00800b0b <sys_page_unmap>:
  800b0b:	55                   	push   %ebp
  800b0c:	89 e5                	mov    %esp,%ebp
  800b0e:	83 ec 08             	sub    $0x8,%esp
  800b11:	6a 00                	push   $0x0
  800b13:	6a 00                	push   $0x0
  800b15:	6a 00                	push   $0x0
  800b17:	ff 75 0c             	push   0xc(%ebp)
  800b1a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b1d:	ba 01 00 00 00       	mov    $0x1,%edx
  800b22:	b8 06 00 00 00       	mov    $0x6,%eax
  800b27:	e8 95 fe ff ff       	call   8009c1 <syscall>
  800b2c:	c9                   	leave
  800b2d:	c3                   	ret

00800b2e <sys_env_set_status>:
  800b2e:	55                   	push   %ebp
  800b2f:	89 e5                	mov    %esp,%ebp
  800b31:	83 ec 08             	sub    $0x8,%esp
  800b34:	6a 00                	push   $0x0
  800b36:	6a 00                	push   $0x0
  800b38:	6a 00                	push   $0x0
  800b3a:	ff 75 0c             	push   0xc(%ebp)
  800b3d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b40:	ba 01 00 00 00       	mov    $0x1,%edx
  800b45:	b8 08 00 00 00       	mov    $0x8,%eax
  800b4a:	e8 72 fe ff ff       	call   8009c1 <syscall>
  800b4f:	c9                   	leave
  800b50:	c3                   	ret

00800b51 <sys_env_set_pgfault_upcall>:
  800b51:	55                   	push   %ebp
  800b52:	89 e5                	mov    %esp,%ebp
  800b54:	83 ec 08             	sub    $0x8,%esp
  800b57:	6a 00                	push   $0x0
  800b59:	6a 00                	push   $0x0
  800b5b:	6a 00                	push   $0x0
  800b5d:	ff 75 0c             	push   0xc(%ebp)
  800b60:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b63:	ba 01 00 00 00       	mov    $0x1,%edx
  800b68:	b8 09 00 00 00       	mov    $0x9,%eax
  800b6d:	e8 4f fe ff ff       	call   8009c1 <syscall>
  800b72:	c9                   	leave
  800b73:	c3                   	ret

00800b74 <sys_ipc_try_send>:
  800b74:	55                   	push   %ebp
  800b75:	89 e5                	mov    %esp,%ebp
  800b77:	83 ec 08             	sub    $0x8,%esp
  800b7a:	6a 00                	push   $0x0
  800b7c:	ff 75 14             	push   0x14(%ebp)
  800b7f:	ff 75 10             	push   0x10(%ebp)
  800b82:	ff 75 0c             	push   0xc(%ebp)
  800b85:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b88:	ba 00 00 00 00       	mov    $0x0,%edx
  800b8d:	b8 0c 00 00 00       	mov    $0xc,%eax
  800b92:	e8 2a fe ff ff       	call   8009c1 <syscall>
  800b97:	c9                   	leave
  800b98:	c3                   	ret

00800b99 <sys_ipc_recv>:
  800b99:	55                   	push   %ebp
  800b9a:	89 e5                	mov    %esp,%ebp
  800b9c:	83 ec 08             	sub    $0x8,%esp
  800b9f:	6a 00                	push   $0x0
  800ba1:	6a 00                	push   $0x0
  800ba3:	6a 00                	push   $0x0
  800ba5:	6a 00                	push   $0x0
  800ba7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800baa:	ba 01 00 00 00       	mov    $0x1,%edx
  800baf:	b8 0d 00 00 00       	mov    $0xd,%eax
  800bb4:	e8 08 fe ff ff       	call   8009c1 <syscall>
  800bb9:	c9                   	leave
  800bba:	c3                   	ret

00800bbb <_panic>:
  800bbb:	55                   	push   %ebp
  800bbc:	89 e5                	mov    %esp,%ebp
  800bbe:	56                   	push   %esi
  800bbf:	53                   	push   %ebx
  800bc0:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800bc3:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800bc9:	e8 a8 fe ff ff       	call   800a76 <sys_getenvid>
  800bce:	83 ec 0c             	sub    $0xc,%esp
  800bd1:	ff 75 0c             	push   0xc(%ebp)
  800bd4:	ff 75 08             	push   0x8(%ebp)
  800bd7:	56                   	push   %esi
  800bd8:	50                   	push   %eax
  800bd9:	68 04 11 80 00       	push   $0x801104
  800bde:	e8 65 f5 ff ff       	call   800148 <cprintf>
  800be3:	83 c4 18             	add    $0x18,%esp
  800be6:	53                   	push   %ebx
  800be7:	ff 75 10             	push   0x10(%ebp)
  800bea:	e8 08 f5 ff ff       	call   8000f7 <vcprintf>
  800bef:	c7 04 24 8c 0e 80 00 	movl   $0x800e8c,(%esp)
  800bf6:	e8 4d f5 ff ff       	call   800148 <cprintf>
  800bfb:	83 c4 10             	add    $0x10,%esp
  800bfe:	cc                   	int3
  800bff:	eb fd                	jmp    800bfe <_panic+0x43>
  800c01:	66 90                	xchg   %ax,%ax
  800c03:	66 90                	xchg   %ax,%ax
  800c05:	66 90                	xchg   %ax,%ax
  800c07:	66 90                	xchg   %ax,%ax
  800c09:	66 90                	xchg   %ax,%ax
  800c0b:	66 90                	xchg   %ax,%ax
  800c0d:	66 90                	xchg   %ax,%ax
  800c0f:	90                   	nop

00800c10 <__udivdi3>:
  800c10:	f3 0f 1e fb          	endbr32
  800c14:	55                   	push   %ebp
  800c15:	57                   	push   %edi
  800c16:	56                   	push   %esi
  800c17:	53                   	push   %ebx
  800c18:	83 ec 1c             	sub    $0x1c,%esp
  800c1b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800c1f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c23:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c27:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c2b:	85 c0                	test   %eax,%eax
  800c2d:	75 19                	jne    800c48 <__udivdi3+0x38>
  800c2f:	39 de                	cmp    %ebx,%esi
  800c31:	73 4d                	jae    800c80 <__udivdi3+0x70>
  800c33:	31 ff                	xor    %edi,%edi
  800c35:	89 e8                	mov    %ebp,%eax
  800c37:	89 f2                	mov    %esi,%edx
  800c39:	f7 f3                	div    %ebx
  800c3b:	89 fa                	mov    %edi,%edx
  800c3d:	83 c4 1c             	add    $0x1c,%esp
  800c40:	5b                   	pop    %ebx
  800c41:	5e                   	pop    %esi
  800c42:	5f                   	pop    %edi
  800c43:	5d                   	pop    %ebp
  800c44:	c3                   	ret
  800c45:	8d 76 00             	lea    0x0(%esi),%esi
  800c48:	39 c6                	cmp    %eax,%esi
  800c4a:	73 14                	jae    800c60 <__udivdi3+0x50>
  800c4c:	31 ff                	xor    %edi,%edi
  800c4e:	31 c0                	xor    %eax,%eax
  800c50:	89 fa                	mov    %edi,%edx
  800c52:	83 c4 1c             	add    $0x1c,%esp
  800c55:	5b                   	pop    %ebx
  800c56:	5e                   	pop    %esi
  800c57:	5f                   	pop    %edi
  800c58:	5d                   	pop    %ebp
  800c59:	c3                   	ret
  800c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800c60:	0f bd f8             	bsr    %eax,%edi
  800c63:	83 f7 1f             	xor    $0x1f,%edi
  800c66:	75 48                	jne    800cb0 <__udivdi3+0xa0>
  800c68:	39 f0                	cmp    %esi,%eax
  800c6a:	72 06                	jb     800c72 <__udivdi3+0x62>
  800c6c:	31 c0                	xor    %eax,%eax
  800c6e:	39 dd                	cmp    %ebx,%ebp
  800c70:	72 de                	jb     800c50 <__udivdi3+0x40>
  800c72:	b8 01 00 00 00       	mov    $0x1,%eax
  800c77:	eb d7                	jmp    800c50 <__udivdi3+0x40>
  800c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800c80:	89 d9                	mov    %ebx,%ecx
  800c82:	85 db                	test   %ebx,%ebx
  800c84:	75 0b                	jne    800c91 <__udivdi3+0x81>
  800c86:	b8 01 00 00 00       	mov    $0x1,%eax
  800c8b:	31 d2                	xor    %edx,%edx
  800c8d:	f7 f3                	div    %ebx
  800c8f:	89 c1                	mov    %eax,%ecx
  800c91:	31 d2                	xor    %edx,%edx
  800c93:	89 f0                	mov    %esi,%eax
  800c95:	f7 f1                	div    %ecx
  800c97:	89 c6                	mov    %eax,%esi
  800c99:	89 e8                	mov    %ebp,%eax
  800c9b:	89 f7                	mov    %esi,%edi
  800c9d:	f7 f1                	div    %ecx
  800c9f:	89 fa                	mov    %edi,%edx
  800ca1:	83 c4 1c             	add    $0x1c,%esp
  800ca4:	5b                   	pop    %ebx
  800ca5:	5e                   	pop    %esi
  800ca6:	5f                   	pop    %edi
  800ca7:	5d                   	pop    %ebp
  800ca8:	c3                   	ret
  800ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800cb0:	89 f9                	mov    %edi,%ecx
  800cb2:	ba 20 00 00 00       	mov    $0x20,%edx
  800cb7:	29 fa                	sub    %edi,%edx
  800cb9:	d3 e0                	shl    %cl,%eax
  800cbb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800cbf:	89 d1                	mov    %edx,%ecx
  800cc1:	89 d8                	mov    %ebx,%eax
  800cc3:	d3 e8                	shr    %cl,%eax
  800cc5:	89 c1                	mov    %eax,%ecx
  800cc7:	8b 44 24 08          	mov    0x8(%esp),%eax
  800ccb:	09 c1                	or     %eax,%ecx
  800ccd:	89 f0                	mov    %esi,%eax
  800ccf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800cd3:	89 f9                	mov    %edi,%ecx
  800cd5:	d3 e3                	shl    %cl,%ebx
  800cd7:	89 d1                	mov    %edx,%ecx
  800cd9:	d3 e8                	shr    %cl,%eax
  800cdb:	89 f9                	mov    %edi,%ecx
  800cdd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800ce1:	89 eb                	mov    %ebp,%ebx
  800ce3:	d3 e6                	shl    %cl,%esi
  800ce5:	89 d1                	mov    %edx,%ecx
  800ce7:	d3 eb                	shr    %cl,%ebx
  800ce9:	09 f3                	or     %esi,%ebx
  800ceb:	89 c6                	mov    %eax,%esi
  800ced:	89 f2                	mov    %esi,%edx
  800cef:	89 d8                	mov    %ebx,%eax
  800cf1:	f7 74 24 08          	divl   0x8(%esp)
  800cf5:	89 d6                	mov    %edx,%esi
  800cf7:	89 c3                	mov    %eax,%ebx
  800cf9:	f7 64 24 0c          	mull   0xc(%esp)
  800cfd:	39 d6                	cmp    %edx,%esi
  800cff:	72 1f                	jb     800d20 <__udivdi3+0x110>
  800d01:	89 f9                	mov    %edi,%ecx
  800d03:	d3 e5                	shl    %cl,%ebp
  800d05:	39 c5                	cmp    %eax,%ebp
  800d07:	73 04                	jae    800d0d <__udivdi3+0xfd>
  800d09:	39 d6                	cmp    %edx,%esi
  800d0b:	74 13                	je     800d20 <__udivdi3+0x110>
  800d0d:	89 d8                	mov    %ebx,%eax
  800d0f:	31 ff                	xor    %edi,%edi
  800d11:	e9 3a ff ff ff       	jmp    800c50 <__udivdi3+0x40>
  800d16:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d1d:	00 
  800d1e:	66 90                	xchg   %ax,%ax
  800d20:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d23:	31 ff                	xor    %edi,%edi
  800d25:	e9 26 ff ff ff       	jmp    800c50 <__udivdi3+0x40>
  800d2a:	66 90                	xchg   %ax,%ax
  800d2c:	66 90                	xchg   %ax,%ax
  800d2e:	66 90                	xchg   %ax,%ax

00800d30 <__umoddi3>:
  800d30:	f3 0f 1e fb          	endbr32
  800d34:	55                   	push   %ebp
  800d35:	57                   	push   %edi
  800d36:	56                   	push   %esi
  800d37:	53                   	push   %ebx
  800d38:	83 ec 1c             	sub    $0x1c,%esp
  800d3b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d3f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d43:	8b 74 24 30          	mov    0x30(%esp),%esi
  800d47:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800d4b:	89 da                	mov    %ebx,%edx
  800d4d:	85 c0                	test   %eax,%eax
  800d4f:	75 17                	jne    800d68 <__umoddi3+0x38>
  800d51:	39 fb                	cmp    %edi,%ebx
  800d53:	73 53                	jae    800da8 <__umoddi3+0x78>
  800d55:	89 f0                	mov    %esi,%eax
  800d57:	f7 f7                	div    %edi
  800d59:	89 d0                	mov    %edx,%eax
  800d5b:	31 d2                	xor    %edx,%edx
  800d5d:	83 c4 1c             	add    $0x1c,%esp
  800d60:	5b                   	pop    %ebx
  800d61:	5e                   	pop    %esi
  800d62:	5f                   	pop    %edi
  800d63:	5d                   	pop    %ebp
  800d64:	c3                   	ret
  800d65:	8d 76 00             	lea    0x0(%esi),%esi
  800d68:	89 f1                	mov    %esi,%ecx
  800d6a:	39 c3                	cmp    %eax,%ebx
  800d6c:	73 12                	jae    800d80 <__umoddi3+0x50>
  800d6e:	89 f0                	mov    %esi,%eax
  800d70:	83 c4 1c             	add    $0x1c,%esp
  800d73:	5b                   	pop    %ebx
  800d74:	5e                   	pop    %esi
  800d75:	5f                   	pop    %edi
  800d76:	5d                   	pop    %ebp
  800d77:	c3                   	ret
  800d78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d7f:	00 
  800d80:	0f bd e8             	bsr    %eax,%ebp
  800d83:	83 f5 1f             	xor    $0x1f,%ebp
  800d86:	75 48                	jne    800dd0 <__umoddi3+0xa0>
  800d88:	39 d8                	cmp    %ebx,%eax
  800d8a:	0f 82 d0 00 00 00    	jb     800e60 <__umoddi3+0x130>
  800d90:	39 fe                	cmp    %edi,%esi
  800d92:	0f 83 c8 00 00 00    	jae    800e60 <__umoddi3+0x130>
  800d98:	89 c8                	mov    %ecx,%eax
  800d9a:	83 c4 1c             	add    $0x1c,%esp
  800d9d:	5b                   	pop    %ebx
  800d9e:	5e                   	pop    %esi
  800d9f:	5f                   	pop    %edi
  800da0:	5d                   	pop    %ebp
  800da1:	c3                   	ret
  800da2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800da8:	89 f9                	mov    %edi,%ecx
  800daa:	85 ff                	test   %edi,%edi
  800dac:	75 0b                	jne    800db9 <__umoddi3+0x89>
  800dae:	b8 01 00 00 00       	mov    $0x1,%eax
  800db3:	31 d2                	xor    %edx,%edx
  800db5:	f7 f7                	div    %edi
  800db7:	89 c1                	mov    %eax,%ecx
  800db9:	89 d8                	mov    %ebx,%eax
  800dbb:	31 d2                	xor    %edx,%edx
  800dbd:	f7 f1                	div    %ecx
  800dbf:	89 f0                	mov    %esi,%eax
  800dc1:	f7 f1                	div    %ecx
  800dc3:	89 d0                	mov    %edx,%eax
  800dc5:	31 d2                	xor    %edx,%edx
  800dc7:	eb 94                	jmp    800d5d <__umoddi3+0x2d>
  800dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800dd0:	89 e9                	mov    %ebp,%ecx
  800dd2:	ba 20 00 00 00       	mov    $0x20,%edx
  800dd7:	29 ea                	sub    %ebp,%edx
  800dd9:	d3 e0                	shl    %cl,%eax
  800ddb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800ddf:	89 d1                	mov    %edx,%ecx
  800de1:	89 f8                	mov    %edi,%eax
  800de3:	d3 e8                	shr    %cl,%eax
  800de5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800de9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800ded:	89 c1                	mov    %eax,%ecx
  800def:	8b 44 24 08          	mov    0x8(%esp),%eax
  800df3:	09 c1                	or     %eax,%ecx
  800df5:	89 d8                	mov    %ebx,%eax
  800df7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800dfb:	89 e9                	mov    %ebp,%ecx
  800dfd:	d3 e7                	shl    %cl,%edi
  800dff:	89 d1                	mov    %edx,%ecx
  800e01:	d3 e8                	shr    %cl,%eax
  800e03:	89 e9                	mov    %ebp,%ecx
  800e05:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800e09:	d3 e3                	shl    %cl,%ebx
  800e0b:	89 c7                	mov    %eax,%edi
  800e0d:	89 d1                	mov    %edx,%ecx
  800e0f:	89 f0                	mov    %esi,%eax
  800e11:	d3 e8                	shr    %cl,%eax
  800e13:	89 fa                	mov    %edi,%edx
  800e15:	89 e9                	mov    %ebp,%ecx
  800e17:	09 d8                	or     %ebx,%eax
  800e19:	d3 e6                	shl    %cl,%esi
  800e1b:	f7 74 24 08          	divl   0x8(%esp)
  800e1f:	89 d3                	mov    %edx,%ebx
  800e21:	f7 64 24 0c          	mull   0xc(%esp)
  800e25:	89 c7                	mov    %eax,%edi
  800e27:	89 d1                	mov    %edx,%ecx
  800e29:	39 d3                	cmp    %edx,%ebx
  800e2b:	72 06                	jb     800e33 <__umoddi3+0x103>
  800e2d:	75 10                	jne    800e3f <__umoddi3+0x10f>
  800e2f:	39 c6                	cmp    %eax,%esi
  800e31:	73 0c                	jae    800e3f <__umoddi3+0x10f>
  800e33:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e37:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e3b:	89 d1                	mov    %edx,%ecx
  800e3d:	89 c7                	mov    %eax,%edi
  800e3f:	89 f2                	mov    %esi,%edx
  800e41:	29 fa                	sub    %edi,%edx
  800e43:	19 cb                	sbb    %ecx,%ebx
  800e45:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800e4a:	89 d8                	mov    %ebx,%eax
  800e4c:	d3 e0                	shl    %cl,%eax
  800e4e:	89 e9                	mov    %ebp,%ecx
  800e50:	d3 ea                	shr    %cl,%edx
  800e52:	d3 eb                	shr    %cl,%ebx
  800e54:	09 d0                	or     %edx,%eax
  800e56:	89 da                	mov    %ebx,%edx
  800e58:	83 c4 1c             	add    $0x1c,%esp
  800e5b:	5b                   	pop    %ebx
  800e5c:	5e                   	pop    %esi
  800e5d:	5f                   	pop    %edi
  800e5e:	5d                   	pop    %ebp
  800e5f:	c3                   	ret
  800e60:	89 da                	mov    %ebx,%edx
  800e62:	89 f1                	mov    %esi,%ecx
  800e64:	29 f9                	sub    %edi,%ecx
  800e66:	19 c2                	sbb    %eax,%edx
  800e68:	89 c8                	mov    %ecx,%eax
  800e6a:	e9 2b ff ff ff       	jmp    800d9a <__umoddi3+0x6a>
