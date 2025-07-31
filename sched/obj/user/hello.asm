
obj/user/hello:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 2d 00 00 00       	call   80005e <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 14             	sub    $0x14,%esp
  800039:	68 80 0e 80 00       	push   $0x800e80
  80003e:	e8 0f 01 00 00       	call   800152 <cprintf>
  800043:	a1 04 20 80 00       	mov    0x802004,%eax
  800048:	8b 40 48             	mov    0x48(%eax),%eax
  80004b:	83 c4 08             	add    $0x8,%esp
  80004e:	50                   	push   %eax
  80004f:	68 8e 0e 80 00       	push   $0x800e8e
  800054:	e8 f9 00 00 00       	call   800152 <cprintf>
  800059:	83 c4 10             	add    $0x10,%esp
  80005c:	c9                   	leave
  80005d:	c3                   	ret

0080005e <libmain>:
  80005e:	55                   	push   %ebp
  80005f:	89 e5                	mov    %esp,%ebp
  800061:	56                   	push   %esi
  800062:	53                   	push   %ebx
  800063:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800066:	8b 75 0c             	mov    0xc(%ebp),%esi
  800069:	e8 12 0a 00 00       	call   800a80 <sys_getenvid>
  80006e:	85 c0                	test   %eax,%eax
  800070:	78 15                	js     800087 <libmain+0x29>
  800072:	25 ff 03 00 00       	and    $0x3ff,%eax
  800077:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  80007d:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800082:	a3 04 20 80 00       	mov    %eax,0x802004
  800087:	85 db                	test   %ebx,%ebx
  800089:	7e 07                	jle    800092 <libmain+0x34>
  80008b:	8b 06                	mov    (%esi),%eax
  80008d:	a3 00 20 80 00       	mov    %eax,0x802000
  800092:	83 ec 08             	sub    $0x8,%esp
  800095:	56                   	push   %esi
  800096:	53                   	push   %ebx
  800097:	e8 97 ff ff ff       	call   800033 <umain>
  80009c:	e8 0a 00 00 00       	call   8000ab <exit>
  8000a1:	83 c4 10             	add    $0x10,%esp
  8000a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8000a7:	5b                   	pop    %ebx
  8000a8:	5e                   	pop    %esi
  8000a9:	5d                   	pop    %ebp
  8000aa:	c3                   	ret

008000ab <exit>:
  8000ab:	55                   	push   %ebp
  8000ac:	89 e5                	mov    %esp,%ebp
  8000ae:	83 ec 14             	sub    $0x14,%esp
  8000b1:	6a 00                	push   $0x0
  8000b3:	e8 a6 09 00 00       	call   800a5e <sys_env_destroy>
  8000b8:	83 c4 10             	add    $0x10,%esp
  8000bb:	c9                   	leave
  8000bc:	c3                   	ret

008000bd <putch>:
  8000bd:	55                   	push   %ebp
  8000be:	89 e5                	mov    %esp,%ebp
  8000c0:	53                   	push   %ebx
  8000c1:	83 ec 04             	sub    $0x4,%esp
  8000c4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000c7:	8b 13                	mov    (%ebx),%edx
  8000c9:	8d 42 01             	lea    0x1(%edx),%eax
  8000cc:	89 03                	mov    %eax,(%ebx)
  8000ce:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000d1:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8000d5:	3d ff 00 00 00       	cmp    $0xff,%eax
  8000da:	74 09                	je     8000e5 <putch+0x28>
  8000dc:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8000e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8000e3:	c9                   	leave
  8000e4:	c3                   	ret
  8000e5:	83 ec 08             	sub    $0x8,%esp
  8000e8:	68 ff 00 00 00       	push   $0xff
  8000ed:	8d 43 08             	lea    0x8(%ebx),%eax
  8000f0:	50                   	push   %eax
  8000f1:	e8 1e 09 00 00       	call   800a14 <sys_cputs>
  8000f6:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8000fc:	83 c4 10             	add    $0x10,%esp
  8000ff:	eb db                	jmp    8000dc <putch+0x1f>

00800101 <vcprintf>:
  800101:	55                   	push   %ebp
  800102:	89 e5                	mov    %esp,%ebp
  800104:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80010a:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800111:	00 00 00 
  800114:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  80011b:	00 00 00 
  80011e:	ff 75 0c             	push   0xc(%ebp)
  800121:	ff 75 08             	push   0x8(%ebp)
  800124:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80012a:	50                   	push   %eax
  80012b:	68 bd 00 80 00       	push   $0x8000bd
  800130:	e8 74 01 00 00       	call   8002a9 <vprintfmt>
  800135:	83 c4 08             	add    $0x8,%esp
  800138:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  80013e:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800144:	50                   	push   %eax
  800145:	e8 ca 08 00 00       	call   800a14 <sys_cputs>
  80014a:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800150:	c9                   	leave
  800151:	c3                   	ret

00800152 <cprintf>:
  800152:	55                   	push   %ebp
  800153:	89 e5                	mov    %esp,%ebp
  800155:	83 ec 10             	sub    $0x10,%esp
  800158:	8d 45 0c             	lea    0xc(%ebp),%eax
  80015b:	50                   	push   %eax
  80015c:	ff 75 08             	push   0x8(%ebp)
  80015f:	e8 9d ff ff ff       	call   800101 <vcprintf>
  800164:	c9                   	leave
  800165:	c3                   	ret

00800166 <printnum>:
  800166:	55                   	push   %ebp
  800167:	89 e5                	mov    %esp,%ebp
  800169:	57                   	push   %edi
  80016a:	56                   	push   %esi
  80016b:	53                   	push   %ebx
  80016c:	83 ec 1c             	sub    $0x1c,%esp
  80016f:	89 c7                	mov    %eax,%edi
  800171:	89 d6                	mov    %edx,%esi
  800173:	8b 45 08             	mov    0x8(%ebp),%eax
  800176:	8b 55 0c             	mov    0xc(%ebp),%edx
  800179:	89 d1                	mov    %edx,%ecx
  80017b:	89 c2                	mov    %eax,%edx
  80017d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800180:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800183:	8b 45 10             	mov    0x10(%ebp),%eax
  800186:	8b 5d 14             	mov    0x14(%ebp),%ebx
  800189:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80018c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800193:	39 c2                	cmp    %eax,%edx
  800195:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  800198:	72 3e                	jb     8001d8 <printnum+0x72>
  80019a:	83 ec 0c             	sub    $0xc,%esp
  80019d:	ff 75 18             	push   0x18(%ebp)
  8001a0:	83 eb 01             	sub    $0x1,%ebx
  8001a3:	53                   	push   %ebx
  8001a4:	50                   	push   %eax
  8001a5:	83 ec 08             	sub    $0x8,%esp
  8001a8:	ff 75 e4             	push   -0x1c(%ebp)
  8001ab:	ff 75 e0             	push   -0x20(%ebp)
  8001ae:	ff 75 dc             	push   -0x24(%ebp)
  8001b1:	ff 75 d8             	push   -0x28(%ebp)
  8001b4:	e8 57 0a 00 00       	call   800c10 <__udivdi3>
  8001b9:	83 c4 18             	add    $0x18,%esp
  8001bc:	52                   	push   %edx
  8001bd:	50                   	push   %eax
  8001be:	89 f2                	mov    %esi,%edx
  8001c0:	89 f8                	mov    %edi,%eax
  8001c2:	e8 9f ff ff ff       	call   800166 <printnum>
  8001c7:	83 c4 20             	add    $0x20,%esp
  8001ca:	eb 13                	jmp    8001df <printnum+0x79>
  8001cc:	83 ec 08             	sub    $0x8,%esp
  8001cf:	56                   	push   %esi
  8001d0:	ff 75 18             	push   0x18(%ebp)
  8001d3:	ff d7                	call   *%edi
  8001d5:	83 c4 10             	add    $0x10,%esp
  8001d8:	83 eb 01             	sub    $0x1,%ebx
  8001db:	85 db                	test   %ebx,%ebx
  8001dd:	7f ed                	jg     8001cc <printnum+0x66>
  8001df:	83 ec 08             	sub    $0x8,%esp
  8001e2:	56                   	push   %esi
  8001e3:	83 ec 04             	sub    $0x4,%esp
  8001e6:	ff 75 e4             	push   -0x1c(%ebp)
  8001e9:	ff 75 e0             	push   -0x20(%ebp)
  8001ec:	ff 75 dc             	push   -0x24(%ebp)
  8001ef:	ff 75 d8             	push   -0x28(%ebp)
  8001f2:	e8 39 0b 00 00       	call   800d30 <__umoddi3>
  8001f7:	83 c4 14             	add    $0x14,%esp
  8001fa:	0f be 80 af 0e 80 00 	movsbl 0x800eaf(%eax),%eax
  800201:	50                   	push   %eax
  800202:	ff d7                	call   *%edi
  800204:	83 c4 10             	add    $0x10,%esp
  800207:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80020a:	5b                   	pop    %ebx
  80020b:	5e                   	pop    %esi
  80020c:	5f                   	pop    %edi
  80020d:	5d                   	pop    %ebp
  80020e:	c3                   	ret

0080020f <getuint>:
  80020f:	83 fa 01             	cmp    $0x1,%edx
  800212:	7f 13                	jg     800227 <getuint+0x18>
  800214:	85 d2                	test   %edx,%edx
  800216:	74 1c                	je     800234 <getuint+0x25>
  800218:	8b 10                	mov    (%eax),%edx
  80021a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80021d:	89 08                	mov    %ecx,(%eax)
  80021f:	8b 02                	mov    (%edx),%eax
  800221:	ba 00 00 00 00       	mov    $0x0,%edx
  800226:	c3                   	ret
  800227:	8b 10                	mov    (%eax),%edx
  800229:	8d 4a 08             	lea    0x8(%edx),%ecx
  80022c:	89 08                	mov    %ecx,(%eax)
  80022e:	8b 02                	mov    (%edx),%eax
  800230:	8b 52 04             	mov    0x4(%edx),%edx
  800233:	c3                   	ret
  800234:	8b 10                	mov    (%eax),%edx
  800236:	8d 4a 04             	lea    0x4(%edx),%ecx
  800239:	89 08                	mov    %ecx,(%eax)
  80023b:	8b 02                	mov    (%edx),%eax
  80023d:	ba 00 00 00 00       	mov    $0x0,%edx
  800242:	c3                   	ret

00800243 <getint>:
  800243:	83 fa 01             	cmp    $0x1,%edx
  800246:	7f 0f                	jg     800257 <getint+0x14>
  800248:	85 d2                	test   %edx,%edx
  80024a:	74 18                	je     800264 <getint+0x21>
  80024c:	8b 10                	mov    (%eax),%edx
  80024e:	8d 4a 04             	lea    0x4(%edx),%ecx
  800251:	89 08                	mov    %ecx,(%eax)
  800253:	8b 02                	mov    (%edx),%eax
  800255:	99                   	cltd
  800256:	c3                   	ret
  800257:	8b 10                	mov    (%eax),%edx
  800259:	8d 4a 08             	lea    0x8(%edx),%ecx
  80025c:	89 08                	mov    %ecx,(%eax)
  80025e:	8b 02                	mov    (%edx),%eax
  800260:	8b 52 04             	mov    0x4(%edx),%edx
  800263:	c3                   	ret
  800264:	8b 10                	mov    (%eax),%edx
  800266:	8d 4a 04             	lea    0x4(%edx),%ecx
  800269:	89 08                	mov    %ecx,(%eax)
  80026b:	8b 02                	mov    (%edx),%eax
  80026d:	99                   	cltd
  80026e:	c3                   	ret

0080026f <sprintputch>:
  80026f:	55                   	push   %ebp
  800270:	89 e5                	mov    %esp,%ebp
  800272:	8b 45 0c             	mov    0xc(%ebp),%eax
  800275:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800279:	8b 10                	mov    (%eax),%edx
  80027b:	3b 50 04             	cmp    0x4(%eax),%edx
  80027e:	73 0a                	jae    80028a <sprintputch+0x1b>
  800280:	8d 4a 01             	lea    0x1(%edx),%ecx
  800283:	89 08                	mov    %ecx,(%eax)
  800285:	8b 45 08             	mov    0x8(%ebp),%eax
  800288:	88 02                	mov    %al,(%edx)
  80028a:	5d                   	pop    %ebp
  80028b:	c3                   	ret

0080028c <printfmt>:
  80028c:	55                   	push   %ebp
  80028d:	89 e5                	mov    %esp,%ebp
  80028f:	83 ec 08             	sub    $0x8,%esp
  800292:	8d 45 14             	lea    0x14(%ebp),%eax
  800295:	50                   	push   %eax
  800296:	ff 75 10             	push   0x10(%ebp)
  800299:	ff 75 0c             	push   0xc(%ebp)
  80029c:	ff 75 08             	push   0x8(%ebp)
  80029f:	e8 05 00 00 00       	call   8002a9 <vprintfmt>
  8002a4:	83 c4 10             	add    $0x10,%esp
  8002a7:	c9                   	leave
  8002a8:	c3                   	ret

008002a9 <vprintfmt>:
  8002a9:	55                   	push   %ebp
  8002aa:	89 e5                	mov    %esp,%ebp
  8002ac:	57                   	push   %edi
  8002ad:	56                   	push   %esi
  8002ae:	53                   	push   %ebx
  8002af:	83 ec 2c             	sub    $0x2c,%esp
  8002b2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8002b5:	8b 75 0c             	mov    0xc(%ebp),%esi
  8002b8:	8b 7d 10             	mov    0x10(%ebp),%edi
  8002bb:	eb 0a                	jmp    8002c7 <vprintfmt+0x1e>
  8002bd:	83 ec 08             	sub    $0x8,%esp
  8002c0:	56                   	push   %esi
  8002c1:	50                   	push   %eax
  8002c2:	ff d3                	call   *%ebx
  8002c4:	83 c4 10             	add    $0x10,%esp
  8002c7:	83 c7 01             	add    $0x1,%edi
  8002ca:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8002ce:	83 f8 25             	cmp    $0x25,%eax
  8002d1:	74 0c                	je     8002df <vprintfmt+0x36>
  8002d3:	85 c0                	test   %eax,%eax
  8002d5:	75 e6                	jne    8002bd <vprintfmt+0x14>
  8002d7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002da:	5b                   	pop    %ebx
  8002db:	5e                   	pop    %esi
  8002dc:	5f                   	pop    %edi
  8002dd:	5d                   	pop    %ebp
  8002de:	c3                   	ret
  8002df:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8002e3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  8002ea:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8002f1:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  8002f8:	b9 00 00 00 00       	mov    $0x0,%ecx
  8002fd:	8d 47 01             	lea    0x1(%edi),%eax
  800300:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800303:	0f b6 17             	movzbl (%edi),%edx
  800306:	8d 42 dd             	lea    -0x23(%edx),%eax
  800309:	3c 55                	cmp    $0x55,%al
  80030b:	0f 87 c3 02 00 00    	ja     8005d4 <vprintfmt+0x32b>
  800311:	0f b6 c0             	movzbl %al,%eax
  800314:	ff 24 85 a0 0f 80 00 	jmp    *0x800fa0(,%eax,4)
  80031b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80031e:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800322:	eb d9                	jmp    8002fd <vprintfmt+0x54>
  800324:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800327:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  80032b:	eb d0                	jmp    8002fd <vprintfmt+0x54>
  80032d:	0f b6 d2             	movzbl %dl,%edx
  800330:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800333:	b8 00 00 00 00       	mov    $0x0,%eax
  800338:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80033b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  80033e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800342:	0f be 17             	movsbl (%edi),%edx
  800345:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800348:	83 f9 09             	cmp    $0x9,%ecx
  80034b:	77 52                	ja     80039f <vprintfmt+0xf6>
  80034d:	83 c7 01             	add    $0x1,%edi
  800350:	eb e9                	jmp    80033b <vprintfmt+0x92>
  800352:	8b 45 14             	mov    0x14(%ebp),%eax
  800355:	8d 50 04             	lea    0x4(%eax),%edx
  800358:	89 55 14             	mov    %edx,0x14(%ebp)
  80035b:	8b 00                	mov    (%eax),%eax
  80035d:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800360:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800363:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800367:	79 94                	jns    8002fd <vprintfmt+0x54>
  800369:	8b 45 d0             	mov    -0x30(%ebp),%eax
  80036c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80036f:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800376:	eb 85                	jmp    8002fd <vprintfmt+0x54>
  800378:	8b 55 e0             	mov    -0x20(%ebp),%edx
  80037b:	85 d2                	test   %edx,%edx
  80037d:	b8 00 00 00 00       	mov    $0x0,%eax
  800382:	0f 49 c2             	cmovns %edx,%eax
  800385:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800388:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80038b:	e9 6d ff ff ff       	jmp    8002fd <vprintfmt+0x54>
  800390:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800393:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  80039a:	e9 5e ff ff ff       	jmp    8002fd <vprintfmt+0x54>
  80039f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8003a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003a5:	eb bc                	jmp    800363 <vprintfmt+0xba>
  8003a7:	83 c1 01             	add    $0x1,%ecx
  8003aa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003ad:	e9 4b ff ff ff       	jmp    8002fd <vprintfmt+0x54>
  8003b2:	8b 45 14             	mov    0x14(%ebp),%eax
  8003b5:	8d 50 04             	lea    0x4(%eax),%edx
  8003b8:	89 55 14             	mov    %edx,0x14(%ebp)
  8003bb:	83 ec 08             	sub    $0x8,%esp
  8003be:	56                   	push   %esi
  8003bf:	ff 30                	push   (%eax)
  8003c1:	ff d3                	call   *%ebx
  8003c3:	83 c4 10             	add    $0x10,%esp
  8003c6:	e9 a0 01 00 00       	jmp    80056b <vprintfmt+0x2c2>
  8003cb:	8b 45 14             	mov    0x14(%ebp),%eax
  8003ce:	8d 50 04             	lea    0x4(%eax),%edx
  8003d1:	89 55 14             	mov    %edx,0x14(%ebp)
  8003d4:	8b 10                	mov    (%eax),%edx
  8003d6:	89 d0                	mov    %edx,%eax
  8003d8:	f7 d8                	neg    %eax
  8003da:	0f 48 c2             	cmovs  %edx,%eax
  8003dd:	83 f8 08             	cmp    $0x8,%eax
  8003e0:	7f 20                	jg     800402 <vprintfmt+0x159>
  8003e2:	8b 14 85 00 11 80 00 	mov    0x801100(,%eax,4),%edx
  8003e9:	85 d2                	test   %edx,%edx
  8003eb:	74 15                	je     800402 <vprintfmt+0x159>
  8003ed:	52                   	push   %edx
  8003ee:	68 d0 0e 80 00       	push   $0x800ed0
  8003f3:	56                   	push   %esi
  8003f4:	53                   	push   %ebx
  8003f5:	e8 92 fe ff ff       	call   80028c <printfmt>
  8003fa:	83 c4 10             	add    $0x10,%esp
  8003fd:	e9 69 01 00 00       	jmp    80056b <vprintfmt+0x2c2>
  800402:	50                   	push   %eax
  800403:	68 c7 0e 80 00       	push   $0x800ec7
  800408:	56                   	push   %esi
  800409:	53                   	push   %ebx
  80040a:	e8 7d fe ff ff       	call   80028c <printfmt>
  80040f:	83 c4 10             	add    $0x10,%esp
  800412:	e9 54 01 00 00       	jmp    80056b <vprintfmt+0x2c2>
  800417:	8b 45 14             	mov    0x14(%ebp),%eax
  80041a:	8d 50 04             	lea    0x4(%eax),%edx
  80041d:	89 55 14             	mov    %edx,0x14(%ebp)
  800420:	8b 08                	mov    (%eax),%ecx
  800422:	85 c9                	test   %ecx,%ecx
  800424:	b8 c0 0e 80 00       	mov    $0x800ec0,%eax
  800429:	0f 45 c1             	cmovne %ecx,%eax
  80042c:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80042f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800433:	7e 06                	jle    80043b <vprintfmt+0x192>
  800435:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800439:	75 0b                	jne    800446 <vprintfmt+0x19d>
  80043b:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  80043e:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800441:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800444:	eb 5c                	jmp    8004a2 <vprintfmt+0x1f9>
  800446:	83 ec 08             	sub    $0x8,%esp
  800449:	ff 75 d0             	push   -0x30(%ebp)
  80044c:	ff 75 cc             	push   -0x34(%ebp)
  80044f:	e8 20 02 00 00       	call   800674 <strnlen>
  800454:	89 c2                	mov    %eax,%edx
  800456:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800459:	29 d0                	sub    %edx,%eax
  80045b:	83 c4 10             	add    $0x10,%esp
  80045e:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800462:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800465:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800468:	89 c3                	mov    %eax,%ebx
  80046a:	eb 0e                	jmp    80047a <vprintfmt+0x1d1>
  80046c:	83 ec 08             	sub    $0x8,%esp
  80046f:	56                   	push   %esi
  800470:	57                   	push   %edi
  800471:	ff 55 08             	call   *0x8(%ebp)
  800474:	83 eb 01             	sub    $0x1,%ebx
  800477:	83 c4 10             	add    $0x10,%esp
  80047a:	85 db                	test   %ebx,%ebx
  80047c:	7f ee                	jg     80046c <vprintfmt+0x1c3>
  80047e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800481:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800484:	85 c0                	test   %eax,%eax
  800486:	ba 00 00 00 00       	mov    $0x0,%edx
  80048b:	0f 49 d0             	cmovns %eax,%edx
  80048e:	29 d0                	sub    %edx,%eax
  800490:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800493:	eb a6                	jmp    80043b <vprintfmt+0x192>
  800495:	83 ec 08             	sub    $0x8,%esp
  800498:	56                   	push   %esi
  800499:	52                   	push   %edx
  80049a:	ff 55 08             	call   *0x8(%ebp)
  80049d:	83 c4 10             	add    $0x10,%esp
  8004a0:	89 d9                	mov    %ebx,%ecx
  8004a2:	8d 59 01             	lea    0x1(%ecx),%ebx
  8004a5:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8004a9:	0f be d0             	movsbl %al,%edx
  8004ac:	85 d2                	test   %edx,%edx
  8004ae:	74 28                	je     8004d8 <vprintfmt+0x22f>
  8004b0:	85 ff                	test   %edi,%edi
  8004b2:	78 05                	js     8004b9 <vprintfmt+0x210>
  8004b4:	83 ef 01             	sub    $0x1,%edi
  8004b7:	78 2e                	js     8004e7 <vprintfmt+0x23e>
  8004b9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8004bd:	74 d6                	je     800495 <vprintfmt+0x1ec>
  8004bf:	0f be c0             	movsbl %al,%eax
  8004c2:	83 e8 20             	sub    $0x20,%eax
  8004c5:	83 f8 5e             	cmp    $0x5e,%eax
  8004c8:	76 cb                	jbe    800495 <vprintfmt+0x1ec>
  8004ca:	83 ec 08             	sub    $0x8,%esp
  8004cd:	56                   	push   %esi
  8004ce:	6a 3f                	push   $0x3f
  8004d0:	ff 55 08             	call   *0x8(%ebp)
  8004d3:	83 c4 10             	add    $0x10,%esp
  8004d6:	eb c8                	jmp    8004a0 <vprintfmt+0x1f7>
  8004d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004db:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8004de:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004e1:	01 c7                	add    %eax,%edi
  8004e3:	29 cf                	sub    %ecx,%edi
  8004e5:	eb 13                	jmp    8004fa <vprintfmt+0x251>
  8004e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004ea:	eb ef                	jmp    8004db <vprintfmt+0x232>
  8004ec:	83 ec 08             	sub    $0x8,%esp
  8004ef:	56                   	push   %esi
  8004f0:	6a 20                	push   $0x20
  8004f2:	ff d3                	call   *%ebx
  8004f4:	83 ef 01             	sub    $0x1,%edi
  8004f7:	83 c4 10             	add    $0x10,%esp
  8004fa:	85 ff                	test   %edi,%edi
  8004fc:	7f ee                	jg     8004ec <vprintfmt+0x243>
  8004fe:	eb 6b                	jmp    80056b <vprintfmt+0x2c2>
  800500:	89 ca                	mov    %ecx,%edx
  800502:	8d 45 14             	lea    0x14(%ebp),%eax
  800505:	e8 39 fd ff ff       	call   800243 <getint>
  80050a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80050d:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800510:	85 d2                	test   %edx,%edx
  800512:	78 0b                	js     80051f <vprintfmt+0x276>
  800514:	89 d1                	mov    %edx,%ecx
  800516:	89 c2                	mov    %eax,%edx
  800518:	bf 0a 00 00 00       	mov    $0xa,%edi
  80051d:	eb 32                	jmp    800551 <vprintfmt+0x2a8>
  80051f:	83 ec 08             	sub    $0x8,%esp
  800522:	56                   	push   %esi
  800523:	6a 2d                	push   $0x2d
  800525:	ff d3                	call   *%ebx
  800527:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80052a:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  80052d:	f7 da                	neg    %edx
  80052f:	83 d1 00             	adc    $0x0,%ecx
  800532:	f7 d9                	neg    %ecx
  800534:	83 c4 10             	add    $0x10,%esp
  800537:	bf 0a 00 00 00       	mov    $0xa,%edi
  80053c:	eb 13                	jmp    800551 <vprintfmt+0x2a8>
  80053e:	89 ca                	mov    %ecx,%edx
  800540:	8d 45 14             	lea    0x14(%ebp),%eax
  800543:	e8 c7 fc ff ff       	call   80020f <getuint>
  800548:	89 d1                	mov    %edx,%ecx
  80054a:	89 c2                	mov    %eax,%edx
  80054c:	bf 0a 00 00 00       	mov    $0xa,%edi
  800551:	83 ec 0c             	sub    $0xc,%esp
  800554:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800558:	50                   	push   %eax
  800559:	ff 75 e0             	push   -0x20(%ebp)
  80055c:	57                   	push   %edi
  80055d:	51                   	push   %ecx
  80055e:	52                   	push   %edx
  80055f:	89 f2                	mov    %esi,%edx
  800561:	89 d8                	mov    %ebx,%eax
  800563:	e8 fe fb ff ff       	call   800166 <printnum>
  800568:	83 c4 20             	add    $0x20,%esp
  80056b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80056e:	e9 54 fd ff ff       	jmp    8002c7 <vprintfmt+0x1e>
  800573:	89 ca                	mov    %ecx,%edx
  800575:	8d 45 14             	lea    0x14(%ebp),%eax
  800578:	e8 92 fc ff ff       	call   80020f <getuint>
  80057d:	89 d1                	mov    %edx,%ecx
  80057f:	89 c2                	mov    %eax,%edx
  800581:	bf 08 00 00 00       	mov    $0x8,%edi
  800586:	eb c9                	jmp    800551 <vprintfmt+0x2a8>
  800588:	83 ec 08             	sub    $0x8,%esp
  80058b:	56                   	push   %esi
  80058c:	6a 30                	push   $0x30
  80058e:	ff d3                	call   *%ebx
  800590:	83 c4 08             	add    $0x8,%esp
  800593:	56                   	push   %esi
  800594:	6a 78                	push   $0x78
  800596:	ff d3                	call   *%ebx
  800598:	8b 45 14             	mov    0x14(%ebp),%eax
  80059b:	8d 50 04             	lea    0x4(%eax),%edx
  80059e:	89 55 14             	mov    %edx,0x14(%ebp)
  8005a1:	8b 10                	mov    (%eax),%edx
  8005a3:	b9 00 00 00 00       	mov    $0x0,%ecx
  8005a8:	83 c4 10             	add    $0x10,%esp
  8005ab:	bf 10 00 00 00       	mov    $0x10,%edi
  8005b0:	eb 9f                	jmp    800551 <vprintfmt+0x2a8>
  8005b2:	89 ca                	mov    %ecx,%edx
  8005b4:	8d 45 14             	lea    0x14(%ebp),%eax
  8005b7:	e8 53 fc ff ff       	call   80020f <getuint>
  8005bc:	89 d1                	mov    %edx,%ecx
  8005be:	89 c2                	mov    %eax,%edx
  8005c0:	bf 10 00 00 00       	mov    $0x10,%edi
  8005c5:	eb 8a                	jmp    800551 <vprintfmt+0x2a8>
  8005c7:	83 ec 08             	sub    $0x8,%esp
  8005ca:	56                   	push   %esi
  8005cb:	6a 25                	push   $0x25
  8005cd:	ff d3                	call   *%ebx
  8005cf:	83 c4 10             	add    $0x10,%esp
  8005d2:	eb 97                	jmp    80056b <vprintfmt+0x2c2>
  8005d4:	83 ec 08             	sub    $0x8,%esp
  8005d7:	56                   	push   %esi
  8005d8:	6a 25                	push   $0x25
  8005da:	ff d3                	call   *%ebx
  8005dc:	83 c4 10             	add    $0x10,%esp
  8005df:	89 f8                	mov    %edi,%eax
  8005e1:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  8005e5:	74 05                	je     8005ec <vprintfmt+0x343>
  8005e7:	83 e8 01             	sub    $0x1,%eax
  8005ea:	eb f5                	jmp    8005e1 <vprintfmt+0x338>
  8005ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8005ef:	e9 77 ff ff ff       	jmp    80056b <vprintfmt+0x2c2>

008005f4 <vsnprintf>:
  8005f4:	55                   	push   %ebp
  8005f5:	89 e5                	mov    %esp,%ebp
  8005f7:	83 ec 18             	sub    $0x18,%esp
  8005fa:	8b 45 08             	mov    0x8(%ebp),%eax
  8005fd:	8b 55 0c             	mov    0xc(%ebp),%edx
  800600:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800603:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800607:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80060a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800611:	85 c0                	test   %eax,%eax
  800613:	74 26                	je     80063b <vsnprintf+0x47>
  800615:	85 d2                	test   %edx,%edx
  800617:	7e 22                	jle    80063b <vsnprintf+0x47>
  800619:	ff 75 14             	push   0x14(%ebp)
  80061c:	ff 75 10             	push   0x10(%ebp)
  80061f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800622:	50                   	push   %eax
  800623:	68 6f 02 80 00       	push   $0x80026f
  800628:	e8 7c fc ff ff       	call   8002a9 <vprintfmt>
  80062d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800630:	c6 00 00             	movb   $0x0,(%eax)
  800633:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800636:	83 c4 10             	add    $0x10,%esp
  800639:	c9                   	leave
  80063a:	c3                   	ret
  80063b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800640:	eb f7                	jmp    800639 <vsnprintf+0x45>

00800642 <snprintf>:
  800642:	55                   	push   %ebp
  800643:	89 e5                	mov    %esp,%ebp
  800645:	83 ec 08             	sub    $0x8,%esp
  800648:	8d 45 14             	lea    0x14(%ebp),%eax
  80064b:	50                   	push   %eax
  80064c:	ff 75 10             	push   0x10(%ebp)
  80064f:	ff 75 0c             	push   0xc(%ebp)
  800652:	ff 75 08             	push   0x8(%ebp)
  800655:	e8 9a ff ff ff       	call   8005f4 <vsnprintf>
  80065a:	c9                   	leave
  80065b:	c3                   	ret

0080065c <strlen>:
  80065c:	55                   	push   %ebp
  80065d:	89 e5                	mov    %esp,%ebp
  80065f:	8b 55 08             	mov    0x8(%ebp),%edx
  800662:	b8 00 00 00 00       	mov    $0x0,%eax
  800667:	eb 03                	jmp    80066c <strlen+0x10>
  800669:	83 c0 01             	add    $0x1,%eax
  80066c:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800670:	75 f7                	jne    800669 <strlen+0xd>
  800672:	5d                   	pop    %ebp
  800673:	c3                   	ret

00800674 <strnlen>:
  800674:	55                   	push   %ebp
  800675:	89 e5                	mov    %esp,%ebp
  800677:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80067a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80067d:	b8 00 00 00 00       	mov    $0x0,%eax
  800682:	eb 03                	jmp    800687 <strnlen+0x13>
  800684:	83 c0 01             	add    $0x1,%eax
  800687:	39 d0                	cmp    %edx,%eax
  800689:	74 08                	je     800693 <strnlen+0x1f>
  80068b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  80068f:	75 f3                	jne    800684 <strnlen+0x10>
  800691:	89 c2                	mov    %eax,%edx
  800693:	89 d0                	mov    %edx,%eax
  800695:	5d                   	pop    %ebp
  800696:	c3                   	ret

00800697 <strcpy>:
  800697:	55                   	push   %ebp
  800698:	89 e5                	mov    %esp,%ebp
  80069a:	53                   	push   %ebx
  80069b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80069e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8006a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8006a6:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8006aa:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8006ad:	83 c0 01             	add    $0x1,%eax
  8006b0:	84 d2                	test   %dl,%dl
  8006b2:	75 f2                	jne    8006a6 <strcpy+0xf>
  8006b4:	89 c8                	mov    %ecx,%eax
  8006b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006b9:	c9                   	leave
  8006ba:	c3                   	ret

008006bb <strcat>:
  8006bb:	55                   	push   %ebp
  8006bc:	89 e5                	mov    %esp,%ebp
  8006be:	53                   	push   %ebx
  8006bf:	83 ec 10             	sub    $0x10,%esp
  8006c2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006c5:	53                   	push   %ebx
  8006c6:	e8 91 ff ff ff       	call   80065c <strlen>
  8006cb:	83 c4 08             	add    $0x8,%esp
  8006ce:	ff 75 0c             	push   0xc(%ebp)
  8006d1:	01 d8                	add    %ebx,%eax
  8006d3:	50                   	push   %eax
  8006d4:	e8 be ff ff ff       	call   800697 <strcpy>
  8006d9:	89 d8                	mov    %ebx,%eax
  8006db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006de:	c9                   	leave
  8006df:	c3                   	ret

008006e0 <strncpy>:
  8006e0:	55                   	push   %ebp
  8006e1:	89 e5                	mov    %esp,%ebp
  8006e3:	56                   	push   %esi
  8006e4:	53                   	push   %ebx
  8006e5:	8b 75 08             	mov    0x8(%ebp),%esi
  8006e8:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006eb:	89 f3                	mov    %esi,%ebx
  8006ed:	03 5d 10             	add    0x10(%ebp),%ebx
  8006f0:	89 f0                	mov    %esi,%eax
  8006f2:	eb 0f                	jmp    800703 <strncpy+0x23>
  8006f4:	83 c0 01             	add    $0x1,%eax
  8006f7:	0f b6 0a             	movzbl (%edx),%ecx
  8006fa:	88 48 ff             	mov    %cl,-0x1(%eax)
  8006fd:	80 f9 01             	cmp    $0x1,%cl
  800700:	83 da ff             	sbb    $0xffffffff,%edx
  800703:	39 d8                	cmp    %ebx,%eax
  800705:	75 ed                	jne    8006f4 <strncpy+0x14>
  800707:	89 f0                	mov    %esi,%eax
  800709:	5b                   	pop    %ebx
  80070a:	5e                   	pop    %esi
  80070b:	5d                   	pop    %ebp
  80070c:	c3                   	ret

0080070d <strlcpy>:
  80070d:	55                   	push   %ebp
  80070e:	89 e5                	mov    %esp,%ebp
  800710:	56                   	push   %esi
  800711:	53                   	push   %ebx
  800712:	8b 75 08             	mov    0x8(%ebp),%esi
  800715:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800718:	8b 55 10             	mov    0x10(%ebp),%edx
  80071b:	89 f0                	mov    %esi,%eax
  80071d:	85 d2                	test   %edx,%edx
  80071f:	74 21                	je     800742 <strlcpy+0x35>
  800721:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800725:	89 f2                	mov    %esi,%edx
  800727:	eb 09                	jmp    800732 <strlcpy+0x25>
  800729:	83 c1 01             	add    $0x1,%ecx
  80072c:	83 c2 01             	add    $0x1,%edx
  80072f:	88 5a ff             	mov    %bl,-0x1(%edx)
  800732:	39 c2                	cmp    %eax,%edx
  800734:	74 09                	je     80073f <strlcpy+0x32>
  800736:	0f b6 19             	movzbl (%ecx),%ebx
  800739:	84 db                	test   %bl,%bl
  80073b:	75 ec                	jne    800729 <strlcpy+0x1c>
  80073d:	89 d0                	mov    %edx,%eax
  80073f:	c6 00 00             	movb   $0x0,(%eax)
  800742:	29 f0                	sub    %esi,%eax
  800744:	5b                   	pop    %ebx
  800745:	5e                   	pop    %esi
  800746:	5d                   	pop    %ebp
  800747:	c3                   	ret

00800748 <strcmp>:
  800748:	55                   	push   %ebp
  800749:	89 e5                	mov    %esp,%ebp
  80074b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80074e:	8b 55 0c             	mov    0xc(%ebp),%edx
  800751:	eb 06                	jmp    800759 <strcmp+0x11>
  800753:	83 c1 01             	add    $0x1,%ecx
  800756:	83 c2 01             	add    $0x1,%edx
  800759:	0f b6 01             	movzbl (%ecx),%eax
  80075c:	84 c0                	test   %al,%al
  80075e:	74 04                	je     800764 <strcmp+0x1c>
  800760:	3a 02                	cmp    (%edx),%al
  800762:	74 ef                	je     800753 <strcmp+0xb>
  800764:	0f b6 c0             	movzbl %al,%eax
  800767:	0f b6 12             	movzbl (%edx),%edx
  80076a:	29 d0                	sub    %edx,%eax
  80076c:	5d                   	pop    %ebp
  80076d:	c3                   	ret

0080076e <strncmp>:
  80076e:	55                   	push   %ebp
  80076f:	89 e5                	mov    %esp,%ebp
  800771:	53                   	push   %ebx
  800772:	8b 45 08             	mov    0x8(%ebp),%eax
  800775:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800778:	8b 55 10             	mov    0x10(%ebp),%edx
  80077b:	eb 09                	jmp    800786 <strncmp+0x18>
  80077d:	83 ea 01             	sub    $0x1,%edx
  800780:	83 c0 01             	add    $0x1,%eax
  800783:	83 c1 01             	add    $0x1,%ecx
  800786:	85 d2                	test   %edx,%edx
  800788:	74 18                	je     8007a2 <strncmp+0x34>
  80078a:	0f b6 18             	movzbl (%eax),%ebx
  80078d:	84 db                	test   %bl,%bl
  80078f:	74 04                	je     800795 <strncmp+0x27>
  800791:	3a 19                	cmp    (%ecx),%bl
  800793:	74 e8                	je     80077d <strncmp+0xf>
  800795:	0f b6 00             	movzbl (%eax),%eax
  800798:	0f b6 11             	movzbl (%ecx),%edx
  80079b:	29 d0                	sub    %edx,%eax
  80079d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007a0:	c9                   	leave
  8007a1:	c3                   	ret
  8007a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8007a7:	eb f4                	jmp    80079d <strncmp+0x2f>

008007a9 <strchr>:
  8007a9:	55                   	push   %ebp
  8007aa:	89 e5                	mov    %esp,%ebp
  8007ac:	8b 45 08             	mov    0x8(%ebp),%eax
  8007af:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007b3:	eb 03                	jmp    8007b8 <strchr+0xf>
  8007b5:	83 c0 01             	add    $0x1,%eax
  8007b8:	0f b6 10             	movzbl (%eax),%edx
  8007bb:	84 d2                	test   %dl,%dl
  8007bd:	74 06                	je     8007c5 <strchr+0x1c>
  8007bf:	38 ca                	cmp    %cl,%dl
  8007c1:	75 f2                	jne    8007b5 <strchr+0xc>
  8007c3:	eb 05                	jmp    8007ca <strchr+0x21>
  8007c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8007ca:	5d                   	pop    %ebp
  8007cb:	c3                   	ret

008007cc <strfind>:
  8007cc:	55                   	push   %ebp
  8007cd:	89 e5                	mov    %esp,%ebp
  8007cf:	8b 45 08             	mov    0x8(%ebp),%eax
  8007d2:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007d6:	0f b6 10             	movzbl (%eax),%edx
  8007d9:	38 ca                	cmp    %cl,%dl
  8007db:	74 09                	je     8007e6 <strfind+0x1a>
  8007dd:	84 d2                	test   %dl,%dl
  8007df:	74 05                	je     8007e6 <strfind+0x1a>
  8007e1:	83 c0 01             	add    $0x1,%eax
  8007e4:	eb f0                	jmp    8007d6 <strfind+0xa>
  8007e6:	5d                   	pop    %ebp
  8007e7:	c3                   	ret

008007e8 <memset>:
  8007e8:	55                   	push   %ebp
  8007e9:	89 e5                	mov    %esp,%ebp
  8007eb:	57                   	push   %edi
  8007ec:	8b 55 08             	mov    0x8(%ebp),%edx
  8007ef:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8007f2:	85 c9                	test   %ecx,%ecx
  8007f4:	74 24                	je     80081a <memset+0x32>
  8007f6:	89 d0                	mov    %edx,%eax
  8007f8:	09 c8                	or     %ecx,%eax
  8007fa:	a8 03                	test   $0x3,%al
  8007fc:	75 14                	jne    800812 <memset+0x2a>
  8007fe:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800802:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800808:	c1 e9 02             	shr    $0x2,%ecx
  80080b:	89 d7                	mov    %edx,%edi
  80080d:	fc                   	cld
  80080e:	f3 ab                	rep stos %eax,%es:(%edi)
  800810:	eb 08                	jmp    80081a <memset+0x32>
  800812:	89 d7                	mov    %edx,%edi
  800814:	8b 45 0c             	mov    0xc(%ebp),%eax
  800817:	fc                   	cld
  800818:	f3 aa                	rep stos %al,%es:(%edi)
  80081a:	89 d0                	mov    %edx,%eax
  80081c:	8b 7d fc             	mov    -0x4(%ebp),%edi
  80081f:	c9                   	leave
  800820:	c3                   	ret

00800821 <memmove>:
  800821:	55                   	push   %ebp
  800822:	89 e5                	mov    %esp,%ebp
  800824:	57                   	push   %edi
  800825:	56                   	push   %esi
  800826:	8b 45 08             	mov    0x8(%ebp),%eax
  800829:	8b 75 0c             	mov    0xc(%ebp),%esi
  80082c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  80082f:	39 c6                	cmp    %eax,%esi
  800831:	73 32                	jae    800865 <memmove+0x44>
  800833:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800836:	39 d0                	cmp    %edx,%eax
  800838:	73 2b                	jae    800865 <memmove+0x44>
  80083a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  80083d:	89 fe                	mov    %edi,%esi
  80083f:	09 ce                	or     %ecx,%esi
  800841:	09 d6                	or     %edx,%esi
  800843:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800849:	75 0e                	jne    800859 <memmove+0x38>
  80084b:	83 ef 04             	sub    $0x4,%edi
  80084e:	8d 72 fc             	lea    -0x4(%edx),%esi
  800851:	c1 e9 02             	shr    $0x2,%ecx
  800854:	fd                   	std
  800855:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800857:	eb 09                	jmp    800862 <memmove+0x41>
  800859:	83 ef 01             	sub    $0x1,%edi
  80085c:	8d 72 ff             	lea    -0x1(%edx),%esi
  80085f:	fd                   	std
  800860:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800862:	fc                   	cld
  800863:	eb 1a                	jmp    80087f <memmove+0x5e>
  800865:	89 c2                	mov    %eax,%edx
  800867:	09 ca                	or     %ecx,%edx
  800869:	09 f2                	or     %esi,%edx
  80086b:	f6 c2 03             	test   $0x3,%dl
  80086e:	75 0a                	jne    80087a <memmove+0x59>
  800870:	c1 e9 02             	shr    $0x2,%ecx
  800873:	89 c7                	mov    %eax,%edi
  800875:	fc                   	cld
  800876:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800878:	eb 05                	jmp    80087f <memmove+0x5e>
  80087a:	89 c7                	mov    %eax,%edi
  80087c:	fc                   	cld
  80087d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  80087f:	5e                   	pop    %esi
  800880:	5f                   	pop    %edi
  800881:	5d                   	pop    %ebp
  800882:	c3                   	ret

00800883 <memcpy>:
  800883:	55                   	push   %ebp
  800884:	89 e5                	mov    %esp,%ebp
  800886:	83 ec 0c             	sub    $0xc,%esp
  800889:	ff 75 10             	push   0x10(%ebp)
  80088c:	ff 75 0c             	push   0xc(%ebp)
  80088f:	ff 75 08             	push   0x8(%ebp)
  800892:	e8 8a ff ff ff       	call   800821 <memmove>
  800897:	c9                   	leave
  800898:	c3                   	ret

00800899 <memcmp>:
  800899:	55                   	push   %ebp
  80089a:	89 e5                	mov    %esp,%ebp
  80089c:	56                   	push   %esi
  80089d:	53                   	push   %ebx
  80089e:	8b 45 08             	mov    0x8(%ebp),%eax
  8008a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008a4:	89 c6                	mov    %eax,%esi
  8008a6:	03 75 10             	add    0x10(%ebp),%esi
  8008a9:	eb 06                	jmp    8008b1 <memcmp+0x18>
  8008ab:	83 c0 01             	add    $0x1,%eax
  8008ae:	83 c2 01             	add    $0x1,%edx
  8008b1:	39 f0                	cmp    %esi,%eax
  8008b3:	74 14                	je     8008c9 <memcmp+0x30>
  8008b5:	0f b6 08             	movzbl (%eax),%ecx
  8008b8:	0f b6 1a             	movzbl (%edx),%ebx
  8008bb:	38 d9                	cmp    %bl,%cl
  8008bd:	74 ec                	je     8008ab <memcmp+0x12>
  8008bf:	0f b6 c1             	movzbl %cl,%eax
  8008c2:	0f b6 db             	movzbl %bl,%ebx
  8008c5:	29 d8                	sub    %ebx,%eax
  8008c7:	eb 05                	jmp    8008ce <memcmp+0x35>
  8008c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8008ce:	5b                   	pop    %ebx
  8008cf:	5e                   	pop    %esi
  8008d0:	5d                   	pop    %ebp
  8008d1:	c3                   	ret

008008d2 <memfind>:
  8008d2:	55                   	push   %ebp
  8008d3:	89 e5                	mov    %esp,%ebp
  8008d5:	8b 45 08             	mov    0x8(%ebp),%eax
  8008d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8008db:	89 c2                	mov    %eax,%edx
  8008dd:	03 55 10             	add    0x10(%ebp),%edx
  8008e0:	eb 03                	jmp    8008e5 <memfind+0x13>
  8008e2:	83 c0 01             	add    $0x1,%eax
  8008e5:	39 d0                	cmp    %edx,%eax
  8008e7:	73 04                	jae    8008ed <memfind+0x1b>
  8008e9:	38 08                	cmp    %cl,(%eax)
  8008eb:	75 f5                	jne    8008e2 <memfind+0x10>
  8008ed:	5d                   	pop    %ebp
  8008ee:	c3                   	ret

008008ef <strtol>:
  8008ef:	55                   	push   %ebp
  8008f0:	89 e5                	mov    %esp,%ebp
  8008f2:	57                   	push   %edi
  8008f3:	56                   	push   %esi
  8008f4:	53                   	push   %ebx
  8008f5:	8b 55 08             	mov    0x8(%ebp),%edx
  8008f8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8008fb:	eb 03                	jmp    800900 <strtol+0x11>
  8008fd:	83 c2 01             	add    $0x1,%edx
  800900:	0f b6 02             	movzbl (%edx),%eax
  800903:	3c 20                	cmp    $0x20,%al
  800905:	74 f6                	je     8008fd <strtol+0xe>
  800907:	3c 09                	cmp    $0x9,%al
  800909:	74 f2                	je     8008fd <strtol+0xe>
  80090b:	3c 2b                	cmp    $0x2b,%al
  80090d:	74 2a                	je     800939 <strtol+0x4a>
  80090f:	bf 00 00 00 00       	mov    $0x0,%edi
  800914:	3c 2d                	cmp    $0x2d,%al
  800916:	74 2b                	je     800943 <strtol+0x54>
  800918:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  80091e:	75 0f                	jne    80092f <strtol+0x40>
  800920:	80 3a 30             	cmpb   $0x30,(%edx)
  800923:	74 28                	je     80094d <strtol+0x5e>
  800925:	85 db                	test   %ebx,%ebx
  800927:	b8 0a 00 00 00       	mov    $0xa,%eax
  80092c:	0f 44 d8             	cmove  %eax,%ebx
  80092f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800934:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800937:	eb 46                	jmp    80097f <strtol+0x90>
  800939:	83 c2 01             	add    $0x1,%edx
  80093c:	bf 00 00 00 00       	mov    $0x0,%edi
  800941:	eb d5                	jmp    800918 <strtol+0x29>
  800943:	83 c2 01             	add    $0x1,%edx
  800946:	bf 01 00 00 00       	mov    $0x1,%edi
  80094b:	eb cb                	jmp    800918 <strtol+0x29>
  80094d:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800951:	74 0e                	je     800961 <strtol+0x72>
  800953:	85 db                	test   %ebx,%ebx
  800955:	75 d8                	jne    80092f <strtol+0x40>
  800957:	83 c2 01             	add    $0x1,%edx
  80095a:	bb 08 00 00 00       	mov    $0x8,%ebx
  80095f:	eb ce                	jmp    80092f <strtol+0x40>
  800961:	83 c2 02             	add    $0x2,%edx
  800964:	bb 10 00 00 00       	mov    $0x10,%ebx
  800969:	eb c4                	jmp    80092f <strtol+0x40>
  80096b:	0f be c0             	movsbl %al,%eax
  80096e:	83 e8 30             	sub    $0x30,%eax
  800971:	3b 45 10             	cmp    0x10(%ebp),%eax
  800974:	7d 3a                	jge    8009b0 <strtol+0xc1>
  800976:	83 c2 01             	add    $0x1,%edx
  800979:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  80097d:	01 c1                	add    %eax,%ecx
  80097f:	0f b6 02             	movzbl (%edx),%eax
  800982:	8d 70 d0             	lea    -0x30(%eax),%esi
  800985:	89 f3                	mov    %esi,%ebx
  800987:	80 fb 09             	cmp    $0x9,%bl
  80098a:	76 df                	jbe    80096b <strtol+0x7c>
  80098c:	8d 70 9f             	lea    -0x61(%eax),%esi
  80098f:	89 f3                	mov    %esi,%ebx
  800991:	80 fb 19             	cmp    $0x19,%bl
  800994:	77 08                	ja     80099e <strtol+0xaf>
  800996:	0f be c0             	movsbl %al,%eax
  800999:	83 e8 57             	sub    $0x57,%eax
  80099c:	eb d3                	jmp    800971 <strtol+0x82>
  80099e:	8d 70 bf             	lea    -0x41(%eax),%esi
  8009a1:	89 f3                	mov    %esi,%ebx
  8009a3:	80 fb 19             	cmp    $0x19,%bl
  8009a6:	77 08                	ja     8009b0 <strtol+0xc1>
  8009a8:	0f be c0             	movsbl %al,%eax
  8009ab:	83 e8 37             	sub    $0x37,%eax
  8009ae:	eb c1                	jmp    800971 <strtol+0x82>
  8009b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  8009b4:	74 05                	je     8009bb <strtol+0xcc>
  8009b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  8009b9:	89 10                	mov    %edx,(%eax)
  8009bb:	89 c8                	mov    %ecx,%eax
  8009bd:	f7 d8                	neg    %eax
  8009bf:	85 ff                	test   %edi,%edi
  8009c1:	0f 45 c8             	cmovne %eax,%ecx
  8009c4:	89 c8                	mov    %ecx,%eax
  8009c6:	5b                   	pop    %ebx
  8009c7:	5e                   	pop    %esi
  8009c8:	5f                   	pop    %edi
  8009c9:	5d                   	pop    %ebp
  8009ca:	c3                   	ret

008009cb <syscall>:
  8009cb:	55                   	push   %ebp
  8009cc:	89 e5                	mov    %esp,%ebp
  8009ce:	57                   	push   %edi
  8009cf:	56                   	push   %esi
  8009d0:	53                   	push   %ebx
  8009d1:	83 ec 1c             	sub    $0x1c,%esp
  8009d4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8009d7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8009da:	89 ca                	mov    %ecx,%edx
  8009dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8009df:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8009e2:	8b 7d 10             	mov    0x10(%ebp),%edi
  8009e5:	8b 75 14             	mov    0x14(%ebp),%esi
  8009e8:	cd 30                	int    $0x30
  8009ea:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8009ee:	74 04                	je     8009f4 <syscall+0x29>
  8009f0:	85 c0                	test   %eax,%eax
  8009f2:	7f 08                	jg     8009fc <syscall+0x31>
  8009f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8009f7:	5b                   	pop    %ebx
  8009f8:	5e                   	pop    %esi
  8009f9:	5f                   	pop    %edi
  8009fa:	5d                   	pop    %ebp
  8009fb:	c3                   	ret
  8009fc:	83 ec 0c             	sub    $0xc,%esp
  8009ff:	50                   	push   %eax
  800a00:	ff 75 e0             	push   -0x20(%ebp)
  800a03:	68 66 0f 80 00       	push   $0x800f66
  800a08:	6a 1e                	push   $0x1e
  800a0a:	68 83 0f 80 00       	push   $0x800f83
  800a0f:	e8 b1 01 00 00       	call   800bc5 <_panic>

00800a14 <sys_cputs>:
  800a14:	55                   	push   %ebp
  800a15:	89 e5                	mov    %esp,%ebp
  800a17:	83 ec 08             	sub    $0x8,%esp
  800a1a:	6a 00                	push   $0x0
  800a1c:	6a 00                	push   $0x0
  800a1e:	6a 00                	push   $0x0
  800a20:	ff 75 0c             	push   0xc(%ebp)
  800a23:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a26:	ba 00 00 00 00       	mov    $0x0,%edx
  800a2b:	b8 00 00 00 00       	mov    $0x0,%eax
  800a30:	e8 96 ff ff ff       	call   8009cb <syscall>
  800a35:	83 c4 10             	add    $0x10,%esp
  800a38:	c9                   	leave
  800a39:	c3                   	ret

00800a3a <sys_cgetc>:
  800a3a:	55                   	push   %ebp
  800a3b:	89 e5                	mov    %esp,%ebp
  800a3d:	83 ec 08             	sub    $0x8,%esp
  800a40:	6a 00                	push   $0x0
  800a42:	6a 00                	push   $0x0
  800a44:	6a 00                	push   $0x0
  800a46:	6a 00                	push   $0x0
  800a48:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a4d:	ba 00 00 00 00       	mov    $0x0,%edx
  800a52:	b8 01 00 00 00       	mov    $0x1,%eax
  800a57:	e8 6f ff ff ff       	call   8009cb <syscall>
  800a5c:	c9                   	leave
  800a5d:	c3                   	ret

00800a5e <sys_env_destroy>:
  800a5e:	55                   	push   %ebp
  800a5f:	89 e5                	mov    %esp,%ebp
  800a61:	83 ec 08             	sub    $0x8,%esp
  800a64:	6a 00                	push   $0x0
  800a66:	6a 00                	push   $0x0
  800a68:	6a 00                	push   $0x0
  800a6a:	6a 00                	push   $0x0
  800a6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a6f:	ba 01 00 00 00       	mov    $0x1,%edx
  800a74:	b8 03 00 00 00       	mov    $0x3,%eax
  800a79:	e8 4d ff ff ff       	call   8009cb <syscall>
  800a7e:	c9                   	leave
  800a7f:	c3                   	ret

00800a80 <sys_getenvid>:
  800a80:	55                   	push   %ebp
  800a81:	89 e5                	mov    %esp,%ebp
  800a83:	83 ec 08             	sub    $0x8,%esp
  800a86:	6a 00                	push   $0x0
  800a88:	6a 00                	push   $0x0
  800a8a:	6a 00                	push   $0x0
  800a8c:	6a 00                	push   $0x0
  800a8e:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a93:	ba 00 00 00 00       	mov    $0x0,%edx
  800a98:	b8 02 00 00 00       	mov    $0x2,%eax
  800a9d:	e8 29 ff ff ff       	call   8009cb <syscall>
  800aa2:	c9                   	leave
  800aa3:	c3                   	ret

00800aa4 <sys_yield>:
  800aa4:	55                   	push   %ebp
  800aa5:	89 e5                	mov    %esp,%ebp
  800aa7:	83 ec 08             	sub    $0x8,%esp
  800aaa:	6a 00                	push   $0x0
  800aac:	6a 00                	push   $0x0
  800aae:	6a 00                	push   $0x0
  800ab0:	6a 00                	push   $0x0
  800ab2:	b9 00 00 00 00       	mov    $0x0,%ecx
  800ab7:	ba 00 00 00 00       	mov    $0x0,%edx
  800abc:	b8 0a 00 00 00       	mov    $0xa,%eax
  800ac1:	e8 05 ff ff ff       	call   8009cb <syscall>
  800ac6:	83 c4 10             	add    $0x10,%esp
  800ac9:	c9                   	leave
  800aca:	c3                   	ret

00800acb <sys_page_alloc>:
  800acb:	55                   	push   %ebp
  800acc:	89 e5                	mov    %esp,%ebp
  800ace:	83 ec 08             	sub    $0x8,%esp
  800ad1:	6a 00                	push   $0x0
  800ad3:	6a 00                	push   $0x0
  800ad5:	ff 75 10             	push   0x10(%ebp)
  800ad8:	ff 75 0c             	push   0xc(%ebp)
  800adb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ade:	ba 01 00 00 00       	mov    $0x1,%edx
  800ae3:	b8 04 00 00 00       	mov    $0x4,%eax
  800ae8:	e8 de fe ff ff       	call   8009cb <syscall>
  800aed:	c9                   	leave
  800aee:	c3                   	ret

00800aef <sys_page_map>:
  800aef:	55                   	push   %ebp
  800af0:	89 e5                	mov    %esp,%ebp
  800af2:	83 ec 08             	sub    $0x8,%esp
  800af5:	ff 75 18             	push   0x18(%ebp)
  800af8:	ff 75 14             	push   0x14(%ebp)
  800afb:	ff 75 10             	push   0x10(%ebp)
  800afe:	ff 75 0c             	push   0xc(%ebp)
  800b01:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b04:	ba 01 00 00 00       	mov    $0x1,%edx
  800b09:	b8 05 00 00 00       	mov    $0x5,%eax
  800b0e:	e8 b8 fe ff ff       	call   8009cb <syscall>
  800b13:	c9                   	leave
  800b14:	c3                   	ret

00800b15 <sys_page_unmap>:
  800b15:	55                   	push   %ebp
  800b16:	89 e5                	mov    %esp,%ebp
  800b18:	83 ec 08             	sub    $0x8,%esp
  800b1b:	6a 00                	push   $0x0
  800b1d:	6a 00                	push   $0x0
  800b1f:	6a 00                	push   $0x0
  800b21:	ff 75 0c             	push   0xc(%ebp)
  800b24:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b27:	ba 01 00 00 00       	mov    $0x1,%edx
  800b2c:	b8 06 00 00 00       	mov    $0x6,%eax
  800b31:	e8 95 fe ff ff       	call   8009cb <syscall>
  800b36:	c9                   	leave
  800b37:	c3                   	ret

00800b38 <sys_env_set_status>:
  800b38:	55                   	push   %ebp
  800b39:	89 e5                	mov    %esp,%ebp
  800b3b:	83 ec 08             	sub    $0x8,%esp
  800b3e:	6a 00                	push   $0x0
  800b40:	6a 00                	push   $0x0
  800b42:	6a 00                	push   $0x0
  800b44:	ff 75 0c             	push   0xc(%ebp)
  800b47:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b4a:	ba 01 00 00 00       	mov    $0x1,%edx
  800b4f:	b8 08 00 00 00       	mov    $0x8,%eax
  800b54:	e8 72 fe ff ff       	call   8009cb <syscall>
  800b59:	c9                   	leave
  800b5a:	c3                   	ret

00800b5b <sys_env_set_pgfault_upcall>:
  800b5b:	55                   	push   %ebp
  800b5c:	89 e5                	mov    %esp,%ebp
  800b5e:	83 ec 08             	sub    $0x8,%esp
  800b61:	6a 00                	push   $0x0
  800b63:	6a 00                	push   $0x0
  800b65:	6a 00                	push   $0x0
  800b67:	ff 75 0c             	push   0xc(%ebp)
  800b6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b6d:	ba 01 00 00 00       	mov    $0x1,%edx
  800b72:	b8 09 00 00 00       	mov    $0x9,%eax
  800b77:	e8 4f fe ff ff       	call   8009cb <syscall>
  800b7c:	c9                   	leave
  800b7d:	c3                   	ret

00800b7e <sys_ipc_try_send>:
  800b7e:	55                   	push   %ebp
  800b7f:	89 e5                	mov    %esp,%ebp
  800b81:	83 ec 08             	sub    $0x8,%esp
  800b84:	6a 00                	push   $0x0
  800b86:	ff 75 14             	push   0x14(%ebp)
  800b89:	ff 75 10             	push   0x10(%ebp)
  800b8c:	ff 75 0c             	push   0xc(%ebp)
  800b8f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b92:	ba 00 00 00 00       	mov    $0x0,%edx
  800b97:	b8 0c 00 00 00       	mov    $0xc,%eax
  800b9c:	e8 2a fe ff ff       	call   8009cb <syscall>
  800ba1:	c9                   	leave
  800ba2:	c3                   	ret

00800ba3 <sys_ipc_recv>:
  800ba3:	55                   	push   %ebp
  800ba4:	89 e5                	mov    %esp,%ebp
  800ba6:	83 ec 08             	sub    $0x8,%esp
  800ba9:	6a 00                	push   $0x0
  800bab:	6a 00                	push   $0x0
  800bad:	6a 00                	push   $0x0
  800baf:	6a 00                	push   $0x0
  800bb1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bb4:	ba 01 00 00 00       	mov    $0x1,%edx
  800bb9:	b8 0d 00 00 00       	mov    $0xd,%eax
  800bbe:	e8 08 fe ff ff       	call   8009cb <syscall>
  800bc3:	c9                   	leave
  800bc4:	c3                   	ret

00800bc5 <_panic>:
  800bc5:	55                   	push   %ebp
  800bc6:	89 e5                	mov    %esp,%ebp
  800bc8:	56                   	push   %esi
  800bc9:	53                   	push   %ebx
  800bca:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800bcd:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800bd3:	e8 a8 fe ff ff       	call   800a80 <sys_getenvid>
  800bd8:	83 ec 0c             	sub    $0xc,%esp
  800bdb:	ff 75 0c             	push   0xc(%ebp)
  800bde:	ff 75 08             	push   0x8(%ebp)
  800be1:	56                   	push   %esi
  800be2:	50                   	push   %eax
  800be3:	68 24 11 80 00       	push   $0x801124
  800be8:	e8 65 f5 ff ff       	call   800152 <cprintf>
  800bed:	83 c4 18             	add    $0x18,%esp
  800bf0:	53                   	push   %ebx
  800bf1:	ff 75 10             	push   0x10(%ebp)
  800bf4:	e8 08 f5 ff ff       	call   800101 <vcprintf>
  800bf9:	c7 04 24 8c 0e 80 00 	movl   $0x800e8c,(%esp)
  800c00:	e8 4d f5 ff ff       	call   800152 <cprintf>
  800c05:	83 c4 10             	add    $0x10,%esp
  800c08:	cc                   	int3
  800c09:	eb fd                	jmp    800c08 <_panic+0x43>
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
