
obj/user/pingpong:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 8f 00 00 00       	call   8000c0 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	57                   	push   %edi
  800037:	56                   	push   %esi
  800038:	53                   	push   %ebx
  800039:	83 ec 1c             	sub    $0x1c,%esp
  80003c:	e8 08 0f 00 00       	call   800f49 <fork>
  800041:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800044:	85 c0                	test   %eax,%eax
  800046:	75 4f                	jne    800097 <umain+0x64>
  800048:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  80004b:	83 ec 04             	sub    $0x4,%esp
  80004e:	6a 00                	push   $0x0
  800050:	6a 00                	push   $0x0
  800052:	56                   	push   %esi
  800053:	e8 2f 10 00 00       	call   801087 <ipc_recv>
  800058:	89 c3                	mov    %eax,%ebx
  80005a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80005d:	e8 80 0a 00 00       	call   800ae2 <sys_getenvid>
  800062:	57                   	push   %edi
  800063:	53                   	push   %ebx
  800064:	50                   	push   %eax
  800065:	68 b6 14 80 00       	push   $0x8014b6
  80006a:	e8 45 01 00 00       	call   8001b4 <cprintf>
  80006f:	83 c4 20             	add    $0x20,%esp
  800072:	83 fb 0a             	cmp    $0xa,%ebx
  800075:	74 18                	je     80008f <umain+0x5c>
  800077:	83 c3 01             	add    $0x1,%ebx
  80007a:	6a 00                	push   $0x0
  80007c:	6a 00                	push   $0x0
  80007e:	53                   	push   %ebx
  80007f:	ff 75 e4             	push   -0x1c(%ebp)
  800082:	e8 60 10 00 00       	call   8010e7 <ipc_send>
  800087:	83 c4 10             	add    $0x10,%esp
  80008a:	83 fb 0a             	cmp    $0xa,%ebx
  80008d:	75 bc                	jne    80004b <umain+0x18>
  80008f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800092:	5b                   	pop    %ebx
  800093:	5e                   	pop    %esi
  800094:	5f                   	pop    %edi
  800095:	5d                   	pop    %ebp
  800096:	c3                   	ret
  800097:	89 c3                	mov    %eax,%ebx
  800099:	e8 44 0a 00 00       	call   800ae2 <sys_getenvid>
  80009e:	83 ec 04             	sub    $0x4,%esp
  8000a1:	53                   	push   %ebx
  8000a2:	50                   	push   %eax
  8000a3:	68 a0 14 80 00       	push   $0x8014a0
  8000a8:	e8 07 01 00 00       	call   8001b4 <cprintf>
  8000ad:	6a 00                	push   $0x0
  8000af:	6a 00                	push   $0x0
  8000b1:	6a 00                	push   $0x0
  8000b3:	ff 75 e4             	push   -0x1c(%ebp)
  8000b6:	e8 2c 10 00 00       	call   8010e7 <ipc_send>
  8000bb:	83 c4 20             	add    $0x20,%esp
  8000be:	eb 88                	jmp    800048 <umain+0x15>

008000c0 <libmain>:
  8000c0:	55                   	push   %ebp
  8000c1:	89 e5                	mov    %esp,%ebp
  8000c3:	56                   	push   %esi
  8000c4:	53                   	push   %ebx
  8000c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000c8:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000cb:	e8 12 0a 00 00       	call   800ae2 <sys_getenvid>
  8000d0:	85 c0                	test   %eax,%eax
  8000d2:	78 15                	js     8000e9 <libmain+0x29>
  8000d4:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000d9:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8000df:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8000e4:	a3 04 20 80 00       	mov    %eax,0x802004
  8000e9:	85 db                	test   %ebx,%ebx
  8000eb:	7e 07                	jle    8000f4 <libmain+0x34>
  8000ed:	8b 06                	mov    (%esi),%eax
  8000ef:	a3 00 20 80 00       	mov    %eax,0x802000
  8000f4:	83 ec 08             	sub    $0x8,%esp
  8000f7:	56                   	push   %esi
  8000f8:	53                   	push   %ebx
  8000f9:	e8 35 ff ff ff       	call   800033 <umain>
  8000fe:	e8 0a 00 00 00       	call   80010d <exit>
  800103:	83 c4 10             	add    $0x10,%esp
  800106:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800109:	5b                   	pop    %ebx
  80010a:	5e                   	pop    %esi
  80010b:	5d                   	pop    %ebp
  80010c:	c3                   	ret

0080010d <exit>:
  80010d:	55                   	push   %ebp
  80010e:	89 e5                	mov    %esp,%ebp
  800110:	83 ec 14             	sub    $0x14,%esp
  800113:	6a 00                	push   $0x0
  800115:	e8 a6 09 00 00       	call   800ac0 <sys_env_destroy>
  80011a:	83 c4 10             	add    $0x10,%esp
  80011d:	c9                   	leave
  80011e:	c3                   	ret

0080011f <putch>:
  80011f:	55                   	push   %ebp
  800120:	89 e5                	mov    %esp,%ebp
  800122:	53                   	push   %ebx
  800123:	83 ec 04             	sub    $0x4,%esp
  800126:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800129:	8b 13                	mov    (%ebx),%edx
  80012b:	8d 42 01             	lea    0x1(%edx),%eax
  80012e:	89 03                	mov    %eax,(%ebx)
  800130:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800133:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800137:	3d ff 00 00 00       	cmp    $0xff,%eax
  80013c:	74 09                	je     800147 <putch+0x28>
  80013e:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800142:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800145:	c9                   	leave
  800146:	c3                   	ret
  800147:	83 ec 08             	sub    $0x8,%esp
  80014a:	68 ff 00 00 00       	push   $0xff
  80014f:	8d 43 08             	lea    0x8(%ebx),%eax
  800152:	50                   	push   %eax
  800153:	e8 1e 09 00 00       	call   800a76 <sys_cputs>
  800158:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  80015e:	83 c4 10             	add    $0x10,%esp
  800161:	eb db                	jmp    80013e <putch+0x1f>

00800163 <vcprintf>:
  800163:	55                   	push   %ebp
  800164:	89 e5                	mov    %esp,%ebp
  800166:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80016c:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800173:	00 00 00 
  800176:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  80017d:	00 00 00 
  800180:	ff 75 0c             	push   0xc(%ebp)
  800183:	ff 75 08             	push   0x8(%ebp)
  800186:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80018c:	50                   	push   %eax
  80018d:	68 1f 01 80 00       	push   $0x80011f
  800192:	e8 74 01 00 00       	call   80030b <vprintfmt>
  800197:	83 c4 08             	add    $0x8,%esp
  80019a:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  8001a0:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  8001a6:	50                   	push   %eax
  8001a7:	e8 ca 08 00 00       	call   800a76 <sys_cputs>
  8001ac:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  8001b2:	c9                   	leave
  8001b3:	c3                   	ret

008001b4 <cprintf>:
  8001b4:	55                   	push   %ebp
  8001b5:	89 e5                	mov    %esp,%ebp
  8001b7:	83 ec 10             	sub    $0x10,%esp
  8001ba:	8d 45 0c             	lea    0xc(%ebp),%eax
  8001bd:	50                   	push   %eax
  8001be:	ff 75 08             	push   0x8(%ebp)
  8001c1:	e8 9d ff ff ff       	call   800163 <vcprintf>
  8001c6:	c9                   	leave
  8001c7:	c3                   	ret

008001c8 <printnum>:
  8001c8:	55                   	push   %ebp
  8001c9:	89 e5                	mov    %esp,%ebp
  8001cb:	57                   	push   %edi
  8001cc:	56                   	push   %esi
  8001cd:	53                   	push   %ebx
  8001ce:	83 ec 1c             	sub    $0x1c,%esp
  8001d1:	89 c7                	mov    %eax,%edi
  8001d3:	89 d6                	mov    %edx,%esi
  8001d5:	8b 45 08             	mov    0x8(%ebp),%eax
  8001d8:	8b 55 0c             	mov    0xc(%ebp),%edx
  8001db:	89 d1                	mov    %edx,%ecx
  8001dd:	89 c2                	mov    %eax,%edx
  8001df:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8001e2:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8001e5:	8b 45 10             	mov    0x10(%ebp),%eax
  8001e8:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8001eb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8001ee:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8001f5:	39 c2                	cmp    %eax,%edx
  8001f7:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8001fa:	72 3e                	jb     80023a <printnum+0x72>
  8001fc:	83 ec 0c             	sub    $0xc,%esp
  8001ff:	ff 75 18             	push   0x18(%ebp)
  800202:	83 eb 01             	sub    $0x1,%ebx
  800205:	53                   	push   %ebx
  800206:	50                   	push   %eax
  800207:	83 ec 08             	sub    $0x8,%esp
  80020a:	ff 75 e4             	push   -0x1c(%ebp)
  80020d:	ff 75 e0             	push   -0x20(%ebp)
  800210:	ff 75 dc             	push   -0x24(%ebp)
  800213:	ff 75 d8             	push   -0x28(%ebp)
  800216:	e8 25 10 00 00       	call   801240 <__udivdi3>
  80021b:	83 c4 18             	add    $0x18,%esp
  80021e:	52                   	push   %edx
  80021f:	50                   	push   %eax
  800220:	89 f2                	mov    %esi,%edx
  800222:	89 f8                	mov    %edi,%eax
  800224:	e8 9f ff ff ff       	call   8001c8 <printnum>
  800229:	83 c4 20             	add    $0x20,%esp
  80022c:	eb 13                	jmp    800241 <printnum+0x79>
  80022e:	83 ec 08             	sub    $0x8,%esp
  800231:	56                   	push   %esi
  800232:	ff 75 18             	push   0x18(%ebp)
  800235:	ff d7                	call   *%edi
  800237:	83 c4 10             	add    $0x10,%esp
  80023a:	83 eb 01             	sub    $0x1,%ebx
  80023d:	85 db                	test   %ebx,%ebx
  80023f:	7f ed                	jg     80022e <printnum+0x66>
  800241:	83 ec 08             	sub    $0x8,%esp
  800244:	56                   	push   %esi
  800245:	83 ec 04             	sub    $0x4,%esp
  800248:	ff 75 e4             	push   -0x1c(%ebp)
  80024b:	ff 75 e0             	push   -0x20(%ebp)
  80024e:	ff 75 dc             	push   -0x24(%ebp)
  800251:	ff 75 d8             	push   -0x28(%ebp)
  800254:	e8 07 11 00 00       	call   801360 <__umoddi3>
  800259:	83 c4 14             	add    $0x14,%esp
  80025c:	0f be 80 d3 14 80 00 	movsbl 0x8014d3(%eax),%eax
  800263:	50                   	push   %eax
  800264:	ff d7                	call   *%edi
  800266:	83 c4 10             	add    $0x10,%esp
  800269:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80026c:	5b                   	pop    %ebx
  80026d:	5e                   	pop    %esi
  80026e:	5f                   	pop    %edi
  80026f:	5d                   	pop    %ebp
  800270:	c3                   	ret

00800271 <getuint>:
  800271:	83 fa 01             	cmp    $0x1,%edx
  800274:	7f 13                	jg     800289 <getuint+0x18>
  800276:	85 d2                	test   %edx,%edx
  800278:	74 1c                	je     800296 <getuint+0x25>
  80027a:	8b 10                	mov    (%eax),%edx
  80027c:	8d 4a 04             	lea    0x4(%edx),%ecx
  80027f:	89 08                	mov    %ecx,(%eax)
  800281:	8b 02                	mov    (%edx),%eax
  800283:	ba 00 00 00 00       	mov    $0x0,%edx
  800288:	c3                   	ret
  800289:	8b 10                	mov    (%eax),%edx
  80028b:	8d 4a 08             	lea    0x8(%edx),%ecx
  80028e:	89 08                	mov    %ecx,(%eax)
  800290:	8b 02                	mov    (%edx),%eax
  800292:	8b 52 04             	mov    0x4(%edx),%edx
  800295:	c3                   	ret
  800296:	8b 10                	mov    (%eax),%edx
  800298:	8d 4a 04             	lea    0x4(%edx),%ecx
  80029b:	89 08                	mov    %ecx,(%eax)
  80029d:	8b 02                	mov    (%edx),%eax
  80029f:	ba 00 00 00 00       	mov    $0x0,%edx
  8002a4:	c3                   	ret

008002a5 <getint>:
  8002a5:	83 fa 01             	cmp    $0x1,%edx
  8002a8:	7f 0f                	jg     8002b9 <getint+0x14>
  8002aa:	85 d2                	test   %edx,%edx
  8002ac:	74 18                	je     8002c6 <getint+0x21>
  8002ae:	8b 10                	mov    (%eax),%edx
  8002b0:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002b3:	89 08                	mov    %ecx,(%eax)
  8002b5:	8b 02                	mov    (%edx),%eax
  8002b7:	99                   	cltd
  8002b8:	c3                   	ret
  8002b9:	8b 10                	mov    (%eax),%edx
  8002bb:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002be:	89 08                	mov    %ecx,(%eax)
  8002c0:	8b 02                	mov    (%edx),%eax
  8002c2:	8b 52 04             	mov    0x4(%edx),%edx
  8002c5:	c3                   	ret
  8002c6:	8b 10                	mov    (%eax),%edx
  8002c8:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002cb:	89 08                	mov    %ecx,(%eax)
  8002cd:	8b 02                	mov    (%edx),%eax
  8002cf:	99                   	cltd
  8002d0:	c3                   	ret

008002d1 <sprintputch>:
  8002d1:	55                   	push   %ebp
  8002d2:	89 e5                	mov    %esp,%ebp
  8002d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  8002d7:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8002db:	8b 10                	mov    (%eax),%edx
  8002dd:	3b 50 04             	cmp    0x4(%eax),%edx
  8002e0:	73 0a                	jae    8002ec <sprintputch+0x1b>
  8002e2:	8d 4a 01             	lea    0x1(%edx),%ecx
  8002e5:	89 08                	mov    %ecx,(%eax)
  8002e7:	8b 45 08             	mov    0x8(%ebp),%eax
  8002ea:	88 02                	mov    %al,(%edx)
  8002ec:	5d                   	pop    %ebp
  8002ed:	c3                   	ret

008002ee <printfmt>:
  8002ee:	55                   	push   %ebp
  8002ef:	89 e5                	mov    %esp,%ebp
  8002f1:	83 ec 08             	sub    $0x8,%esp
  8002f4:	8d 45 14             	lea    0x14(%ebp),%eax
  8002f7:	50                   	push   %eax
  8002f8:	ff 75 10             	push   0x10(%ebp)
  8002fb:	ff 75 0c             	push   0xc(%ebp)
  8002fe:	ff 75 08             	push   0x8(%ebp)
  800301:	e8 05 00 00 00       	call   80030b <vprintfmt>
  800306:	83 c4 10             	add    $0x10,%esp
  800309:	c9                   	leave
  80030a:	c3                   	ret

0080030b <vprintfmt>:
  80030b:	55                   	push   %ebp
  80030c:	89 e5                	mov    %esp,%ebp
  80030e:	57                   	push   %edi
  80030f:	56                   	push   %esi
  800310:	53                   	push   %ebx
  800311:	83 ec 2c             	sub    $0x2c,%esp
  800314:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800317:	8b 75 0c             	mov    0xc(%ebp),%esi
  80031a:	8b 7d 10             	mov    0x10(%ebp),%edi
  80031d:	eb 0a                	jmp    800329 <vprintfmt+0x1e>
  80031f:	83 ec 08             	sub    $0x8,%esp
  800322:	56                   	push   %esi
  800323:	50                   	push   %eax
  800324:	ff d3                	call   *%ebx
  800326:	83 c4 10             	add    $0x10,%esp
  800329:	83 c7 01             	add    $0x1,%edi
  80032c:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800330:	83 f8 25             	cmp    $0x25,%eax
  800333:	74 0c                	je     800341 <vprintfmt+0x36>
  800335:	85 c0                	test   %eax,%eax
  800337:	75 e6                	jne    80031f <vprintfmt+0x14>
  800339:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80033c:	5b                   	pop    %ebx
  80033d:	5e                   	pop    %esi
  80033e:	5f                   	pop    %edi
  80033f:	5d                   	pop    %ebp
  800340:	c3                   	ret
  800341:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800345:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80034c:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800353:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80035a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80035f:	8d 47 01             	lea    0x1(%edi),%eax
  800362:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800365:	0f b6 17             	movzbl (%edi),%edx
  800368:	8d 42 dd             	lea    -0x23(%edx),%eax
  80036b:	3c 55                	cmp    $0x55,%al
  80036d:	0f 87 c3 02 00 00    	ja     800636 <vprintfmt+0x32b>
  800373:	0f b6 c0             	movzbl %al,%eax
  800376:	ff 24 85 80 16 80 00 	jmp    *0x801680(,%eax,4)
  80037d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800380:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800384:	eb d9                	jmp    80035f <vprintfmt+0x54>
  800386:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800389:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  80038d:	eb d0                	jmp    80035f <vprintfmt+0x54>
  80038f:	0f b6 d2             	movzbl %dl,%edx
  800392:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800395:	b8 00 00 00 00       	mov    $0x0,%eax
  80039a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80039d:	8d 04 80             	lea    (%eax,%eax,4),%eax
  8003a0:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  8003a4:	0f be 17             	movsbl (%edi),%edx
  8003a7:	8d 4a d0             	lea    -0x30(%edx),%ecx
  8003aa:	83 f9 09             	cmp    $0x9,%ecx
  8003ad:	77 52                	ja     800401 <vprintfmt+0xf6>
  8003af:	83 c7 01             	add    $0x1,%edi
  8003b2:	eb e9                	jmp    80039d <vprintfmt+0x92>
  8003b4:	8b 45 14             	mov    0x14(%ebp),%eax
  8003b7:	8d 50 04             	lea    0x4(%eax),%edx
  8003ba:	89 55 14             	mov    %edx,0x14(%ebp)
  8003bd:	8b 00                	mov    (%eax),%eax
  8003bf:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003c2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003c5:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8003c9:	79 94                	jns    80035f <vprintfmt+0x54>
  8003cb:	8b 45 d0             	mov    -0x30(%ebp),%eax
  8003ce:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003d1:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003d8:	eb 85                	jmp    80035f <vprintfmt+0x54>
  8003da:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8003dd:	85 d2                	test   %edx,%edx
  8003df:	b8 00 00 00 00       	mov    $0x0,%eax
  8003e4:	0f 49 c2             	cmovns %edx,%eax
  8003e7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003ed:	e9 6d ff ff ff       	jmp    80035f <vprintfmt+0x54>
  8003f2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003f5:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8003fc:	e9 5e ff ff ff       	jmp    80035f <vprintfmt+0x54>
  800401:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  800404:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800407:	eb bc                	jmp    8003c5 <vprintfmt+0xba>
  800409:	83 c1 01             	add    $0x1,%ecx
  80040c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80040f:	e9 4b ff ff ff       	jmp    80035f <vprintfmt+0x54>
  800414:	8b 45 14             	mov    0x14(%ebp),%eax
  800417:	8d 50 04             	lea    0x4(%eax),%edx
  80041a:	89 55 14             	mov    %edx,0x14(%ebp)
  80041d:	83 ec 08             	sub    $0x8,%esp
  800420:	56                   	push   %esi
  800421:	ff 30                	push   (%eax)
  800423:	ff d3                	call   *%ebx
  800425:	83 c4 10             	add    $0x10,%esp
  800428:	e9 a0 01 00 00       	jmp    8005cd <vprintfmt+0x2c2>
  80042d:	8b 45 14             	mov    0x14(%ebp),%eax
  800430:	8d 50 04             	lea    0x4(%eax),%edx
  800433:	89 55 14             	mov    %edx,0x14(%ebp)
  800436:	8b 10                	mov    (%eax),%edx
  800438:	89 d0                	mov    %edx,%eax
  80043a:	f7 d8                	neg    %eax
  80043c:	0f 48 c2             	cmovs  %edx,%eax
  80043f:	83 f8 08             	cmp    $0x8,%eax
  800442:	7f 20                	jg     800464 <vprintfmt+0x159>
  800444:	8b 14 85 e0 17 80 00 	mov    0x8017e0(,%eax,4),%edx
  80044b:	85 d2                	test   %edx,%edx
  80044d:	74 15                	je     800464 <vprintfmt+0x159>
  80044f:	52                   	push   %edx
  800450:	68 f4 14 80 00       	push   $0x8014f4
  800455:	56                   	push   %esi
  800456:	53                   	push   %ebx
  800457:	e8 92 fe ff ff       	call   8002ee <printfmt>
  80045c:	83 c4 10             	add    $0x10,%esp
  80045f:	e9 69 01 00 00       	jmp    8005cd <vprintfmt+0x2c2>
  800464:	50                   	push   %eax
  800465:	68 eb 14 80 00       	push   $0x8014eb
  80046a:	56                   	push   %esi
  80046b:	53                   	push   %ebx
  80046c:	e8 7d fe ff ff       	call   8002ee <printfmt>
  800471:	83 c4 10             	add    $0x10,%esp
  800474:	e9 54 01 00 00       	jmp    8005cd <vprintfmt+0x2c2>
  800479:	8b 45 14             	mov    0x14(%ebp),%eax
  80047c:	8d 50 04             	lea    0x4(%eax),%edx
  80047f:	89 55 14             	mov    %edx,0x14(%ebp)
  800482:	8b 08                	mov    (%eax),%ecx
  800484:	85 c9                	test   %ecx,%ecx
  800486:	b8 e4 14 80 00       	mov    $0x8014e4,%eax
  80048b:	0f 45 c1             	cmovne %ecx,%eax
  80048e:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800491:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800495:	7e 06                	jle    80049d <vprintfmt+0x192>
  800497:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  80049b:	75 0b                	jne    8004a8 <vprintfmt+0x19d>
  80049d:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  8004a0:	8b 7d d0             	mov    -0x30(%ebp),%edi
  8004a3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004a6:	eb 5c                	jmp    800504 <vprintfmt+0x1f9>
  8004a8:	83 ec 08             	sub    $0x8,%esp
  8004ab:	ff 75 d0             	push   -0x30(%ebp)
  8004ae:	ff 75 cc             	push   -0x34(%ebp)
  8004b1:	e8 20 02 00 00       	call   8006d6 <strnlen>
  8004b6:	89 c2                	mov    %eax,%edx
  8004b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004bb:	29 d0                	sub    %edx,%eax
  8004bd:	83 c4 10             	add    $0x10,%esp
  8004c0:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8004c4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004c7:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004ca:	89 c3                	mov    %eax,%ebx
  8004cc:	eb 0e                	jmp    8004dc <vprintfmt+0x1d1>
  8004ce:	83 ec 08             	sub    $0x8,%esp
  8004d1:	56                   	push   %esi
  8004d2:	57                   	push   %edi
  8004d3:	ff 55 08             	call   *0x8(%ebp)
  8004d6:	83 eb 01             	sub    $0x1,%ebx
  8004d9:	83 c4 10             	add    $0x10,%esp
  8004dc:	85 db                	test   %ebx,%ebx
  8004de:	7f ee                	jg     8004ce <vprintfmt+0x1c3>
  8004e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004e6:	85 c0                	test   %eax,%eax
  8004e8:	ba 00 00 00 00       	mov    $0x0,%edx
  8004ed:	0f 49 d0             	cmovns %eax,%edx
  8004f0:	29 d0                	sub    %edx,%eax
  8004f2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004f5:	eb a6                	jmp    80049d <vprintfmt+0x192>
  8004f7:	83 ec 08             	sub    $0x8,%esp
  8004fa:	56                   	push   %esi
  8004fb:	52                   	push   %edx
  8004fc:	ff 55 08             	call   *0x8(%ebp)
  8004ff:	83 c4 10             	add    $0x10,%esp
  800502:	89 d9                	mov    %ebx,%ecx
  800504:	8d 59 01             	lea    0x1(%ecx),%ebx
  800507:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  80050b:	0f be d0             	movsbl %al,%edx
  80050e:	85 d2                	test   %edx,%edx
  800510:	74 28                	je     80053a <vprintfmt+0x22f>
  800512:	85 ff                	test   %edi,%edi
  800514:	78 05                	js     80051b <vprintfmt+0x210>
  800516:	83 ef 01             	sub    $0x1,%edi
  800519:	78 2e                	js     800549 <vprintfmt+0x23e>
  80051b:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  80051f:	74 d6                	je     8004f7 <vprintfmt+0x1ec>
  800521:	0f be c0             	movsbl %al,%eax
  800524:	83 e8 20             	sub    $0x20,%eax
  800527:	83 f8 5e             	cmp    $0x5e,%eax
  80052a:	76 cb                	jbe    8004f7 <vprintfmt+0x1ec>
  80052c:	83 ec 08             	sub    $0x8,%esp
  80052f:	56                   	push   %esi
  800530:	6a 3f                	push   $0x3f
  800532:	ff 55 08             	call   *0x8(%ebp)
  800535:	83 c4 10             	add    $0x10,%esp
  800538:	eb c8                	jmp    800502 <vprintfmt+0x1f7>
  80053a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80053d:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800540:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800543:	01 c7                	add    %eax,%edi
  800545:	29 cf                	sub    %ecx,%edi
  800547:	eb 13                	jmp    80055c <vprintfmt+0x251>
  800549:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80054c:	eb ef                	jmp    80053d <vprintfmt+0x232>
  80054e:	83 ec 08             	sub    $0x8,%esp
  800551:	56                   	push   %esi
  800552:	6a 20                	push   $0x20
  800554:	ff d3                	call   *%ebx
  800556:	83 ef 01             	sub    $0x1,%edi
  800559:	83 c4 10             	add    $0x10,%esp
  80055c:	85 ff                	test   %edi,%edi
  80055e:	7f ee                	jg     80054e <vprintfmt+0x243>
  800560:	eb 6b                	jmp    8005cd <vprintfmt+0x2c2>
  800562:	89 ca                	mov    %ecx,%edx
  800564:	8d 45 14             	lea    0x14(%ebp),%eax
  800567:	e8 39 fd ff ff       	call   8002a5 <getint>
  80056c:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80056f:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800572:	85 d2                	test   %edx,%edx
  800574:	78 0b                	js     800581 <vprintfmt+0x276>
  800576:	89 d1                	mov    %edx,%ecx
  800578:	89 c2                	mov    %eax,%edx
  80057a:	bf 0a 00 00 00       	mov    $0xa,%edi
  80057f:	eb 32                	jmp    8005b3 <vprintfmt+0x2a8>
  800581:	83 ec 08             	sub    $0x8,%esp
  800584:	56                   	push   %esi
  800585:	6a 2d                	push   $0x2d
  800587:	ff d3                	call   *%ebx
  800589:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80058c:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  80058f:	f7 da                	neg    %edx
  800591:	83 d1 00             	adc    $0x0,%ecx
  800594:	f7 d9                	neg    %ecx
  800596:	83 c4 10             	add    $0x10,%esp
  800599:	bf 0a 00 00 00       	mov    $0xa,%edi
  80059e:	eb 13                	jmp    8005b3 <vprintfmt+0x2a8>
  8005a0:	89 ca                	mov    %ecx,%edx
  8005a2:	8d 45 14             	lea    0x14(%ebp),%eax
  8005a5:	e8 c7 fc ff ff       	call   800271 <getuint>
  8005aa:	89 d1                	mov    %edx,%ecx
  8005ac:	89 c2                	mov    %eax,%edx
  8005ae:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005b3:	83 ec 0c             	sub    $0xc,%esp
  8005b6:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  8005ba:	50                   	push   %eax
  8005bb:	ff 75 e0             	push   -0x20(%ebp)
  8005be:	57                   	push   %edi
  8005bf:	51                   	push   %ecx
  8005c0:	52                   	push   %edx
  8005c1:	89 f2                	mov    %esi,%edx
  8005c3:	89 d8                	mov    %ebx,%eax
  8005c5:	e8 fe fb ff ff       	call   8001c8 <printnum>
  8005ca:	83 c4 20             	add    $0x20,%esp
  8005cd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005d0:	e9 54 fd ff ff       	jmp    800329 <vprintfmt+0x1e>
  8005d5:	89 ca                	mov    %ecx,%edx
  8005d7:	8d 45 14             	lea    0x14(%ebp),%eax
  8005da:	e8 92 fc ff ff       	call   800271 <getuint>
  8005df:	89 d1                	mov    %edx,%ecx
  8005e1:	89 c2                	mov    %eax,%edx
  8005e3:	bf 08 00 00 00       	mov    $0x8,%edi
  8005e8:	eb c9                	jmp    8005b3 <vprintfmt+0x2a8>
  8005ea:	83 ec 08             	sub    $0x8,%esp
  8005ed:	56                   	push   %esi
  8005ee:	6a 30                	push   $0x30
  8005f0:	ff d3                	call   *%ebx
  8005f2:	83 c4 08             	add    $0x8,%esp
  8005f5:	56                   	push   %esi
  8005f6:	6a 78                	push   $0x78
  8005f8:	ff d3                	call   *%ebx
  8005fa:	8b 45 14             	mov    0x14(%ebp),%eax
  8005fd:	8d 50 04             	lea    0x4(%eax),%edx
  800600:	89 55 14             	mov    %edx,0x14(%ebp)
  800603:	8b 10                	mov    (%eax),%edx
  800605:	b9 00 00 00 00       	mov    $0x0,%ecx
  80060a:	83 c4 10             	add    $0x10,%esp
  80060d:	bf 10 00 00 00       	mov    $0x10,%edi
  800612:	eb 9f                	jmp    8005b3 <vprintfmt+0x2a8>
  800614:	89 ca                	mov    %ecx,%edx
  800616:	8d 45 14             	lea    0x14(%ebp),%eax
  800619:	e8 53 fc ff ff       	call   800271 <getuint>
  80061e:	89 d1                	mov    %edx,%ecx
  800620:	89 c2                	mov    %eax,%edx
  800622:	bf 10 00 00 00       	mov    $0x10,%edi
  800627:	eb 8a                	jmp    8005b3 <vprintfmt+0x2a8>
  800629:	83 ec 08             	sub    $0x8,%esp
  80062c:	56                   	push   %esi
  80062d:	6a 25                	push   $0x25
  80062f:	ff d3                	call   *%ebx
  800631:	83 c4 10             	add    $0x10,%esp
  800634:	eb 97                	jmp    8005cd <vprintfmt+0x2c2>
  800636:	83 ec 08             	sub    $0x8,%esp
  800639:	56                   	push   %esi
  80063a:	6a 25                	push   $0x25
  80063c:	ff d3                	call   *%ebx
  80063e:	83 c4 10             	add    $0x10,%esp
  800641:	89 f8                	mov    %edi,%eax
  800643:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800647:	74 05                	je     80064e <vprintfmt+0x343>
  800649:	83 e8 01             	sub    $0x1,%eax
  80064c:	eb f5                	jmp    800643 <vprintfmt+0x338>
  80064e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800651:	e9 77 ff ff ff       	jmp    8005cd <vprintfmt+0x2c2>

00800656 <vsnprintf>:
  800656:	55                   	push   %ebp
  800657:	89 e5                	mov    %esp,%ebp
  800659:	83 ec 18             	sub    $0x18,%esp
  80065c:	8b 45 08             	mov    0x8(%ebp),%eax
  80065f:	8b 55 0c             	mov    0xc(%ebp),%edx
  800662:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800665:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800669:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80066c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800673:	85 c0                	test   %eax,%eax
  800675:	74 26                	je     80069d <vsnprintf+0x47>
  800677:	85 d2                	test   %edx,%edx
  800679:	7e 22                	jle    80069d <vsnprintf+0x47>
  80067b:	ff 75 14             	push   0x14(%ebp)
  80067e:	ff 75 10             	push   0x10(%ebp)
  800681:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800684:	50                   	push   %eax
  800685:	68 d1 02 80 00       	push   $0x8002d1
  80068a:	e8 7c fc ff ff       	call   80030b <vprintfmt>
  80068f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800692:	c6 00 00             	movb   $0x0,(%eax)
  800695:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800698:	83 c4 10             	add    $0x10,%esp
  80069b:	c9                   	leave
  80069c:	c3                   	ret
  80069d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8006a2:	eb f7                	jmp    80069b <vsnprintf+0x45>

008006a4 <snprintf>:
  8006a4:	55                   	push   %ebp
  8006a5:	89 e5                	mov    %esp,%ebp
  8006a7:	83 ec 08             	sub    $0x8,%esp
  8006aa:	8d 45 14             	lea    0x14(%ebp),%eax
  8006ad:	50                   	push   %eax
  8006ae:	ff 75 10             	push   0x10(%ebp)
  8006b1:	ff 75 0c             	push   0xc(%ebp)
  8006b4:	ff 75 08             	push   0x8(%ebp)
  8006b7:	e8 9a ff ff ff       	call   800656 <vsnprintf>
  8006bc:	c9                   	leave
  8006bd:	c3                   	ret

008006be <strlen>:
  8006be:	55                   	push   %ebp
  8006bf:	89 e5                	mov    %esp,%ebp
  8006c1:	8b 55 08             	mov    0x8(%ebp),%edx
  8006c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c9:	eb 03                	jmp    8006ce <strlen+0x10>
  8006cb:	83 c0 01             	add    $0x1,%eax
  8006ce:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8006d2:	75 f7                	jne    8006cb <strlen+0xd>
  8006d4:	5d                   	pop    %ebp
  8006d5:	c3                   	ret

008006d6 <strnlen>:
  8006d6:	55                   	push   %ebp
  8006d7:	89 e5                	mov    %esp,%ebp
  8006d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006dc:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006df:	b8 00 00 00 00       	mov    $0x0,%eax
  8006e4:	eb 03                	jmp    8006e9 <strnlen+0x13>
  8006e6:	83 c0 01             	add    $0x1,%eax
  8006e9:	39 d0                	cmp    %edx,%eax
  8006eb:	74 08                	je     8006f5 <strnlen+0x1f>
  8006ed:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8006f1:	75 f3                	jne    8006e6 <strnlen+0x10>
  8006f3:	89 c2                	mov    %eax,%edx
  8006f5:	89 d0                	mov    %edx,%eax
  8006f7:	5d                   	pop    %ebp
  8006f8:	c3                   	ret

008006f9 <strcpy>:
  8006f9:	55                   	push   %ebp
  8006fa:	89 e5                	mov    %esp,%ebp
  8006fc:	53                   	push   %ebx
  8006fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800700:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800703:	b8 00 00 00 00       	mov    $0x0,%eax
  800708:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  80070c:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  80070f:	83 c0 01             	add    $0x1,%eax
  800712:	84 d2                	test   %dl,%dl
  800714:	75 f2                	jne    800708 <strcpy+0xf>
  800716:	89 c8                	mov    %ecx,%eax
  800718:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80071b:	c9                   	leave
  80071c:	c3                   	ret

0080071d <strcat>:
  80071d:	55                   	push   %ebp
  80071e:	89 e5                	mov    %esp,%ebp
  800720:	53                   	push   %ebx
  800721:	83 ec 10             	sub    $0x10,%esp
  800724:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800727:	53                   	push   %ebx
  800728:	e8 91 ff ff ff       	call   8006be <strlen>
  80072d:	83 c4 08             	add    $0x8,%esp
  800730:	ff 75 0c             	push   0xc(%ebp)
  800733:	01 d8                	add    %ebx,%eax
  800735:	50                   	push   %eax
  800736:	e8 be ff ff ff       	call   8006f9 <strcpy>
  80073b:	89 d8                	mov    %ebx,%eax
  80073d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800740:	c9                   	leave
  800741:	c3                   	ret

00800742 <strncpy>:
  800742:	55                   	push   %ebp
  800743:	89 e5                	mov    %esp,%ebp
  800745:	56                   	push   %esi
  800746:	53                   	push   %ebx
  800747:	8b 75 08             	mov    0x8(%ebp),%esi
  80074a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80074d:	89 f3                	mov    %esi,%ebx
  80074f:	03 5d 10             	add    0x10(%ebp),%ebx
  800752:	89 f0                	mov    %esi,%eax
  800754:	eb 0f                	jmp    800765 <strncpy+0x23>
  800756:	83 c0 01             	add    $0x1,%eax
  800759:	0f b6 0a             	movzbl (%edx),%ecx
  80075c:	88 48 ff             	mov    %cl,-0x1(%eax)
  80075f:	80 f9 01             	cmp    $0x1,%cl
  800762:	83 da ff             	sbb    $0xffffffff,%edx
  800765:	39 d8                	cmp    %ebx,%eax
  800767:	75 ed                	jne    800756 <strncpy+0x14>
  800769:	89 f0                	mov    %esi,%eax
  80076b:	5b                   	pop    %ebx
  80076c:	5e                   	pop    %esi
  80076d:	5d                   	pop    %ebp
  80076e:	c3                   	ret

0080076f <strlcpy>:
  80076f:	55                   	push   %ebp
  800770:	89 e5                	mov    %esp,%ebp
  800772:	56                   	push   %esi
  800773:	53                   	push   %ebx
  800774:	8b 75 08             	mov    0x8(%ebp),%esi
  800777:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80077a:	8b 55 10             	mov    0x10(%ebp),%edx
  80077d:	89 f0                	mov    %esi,%eax
  80077f:	85 d2                	test   %edx,%edx
  800781:	74 21                	je     8007a4 <strlcpy+0x35>
  800783:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800787:	89 f2                	mov    %esi,%edx
  800789:	eb 09                	jmp    800794 <strlcpy+0x25>
  80078b:	83 c1 01             	add    $0x1,%ecx
  80078e:	83 c2 01             	add    $0x1,%edx
  800791:	88 5a ff             	mov    %bl,-0x1(%edx)
  800794:	39 c2                	cmp    %eax,%edx
  800796:	74 09                	je     8007a1 <strlcpy+0x32>
  800798:	0f b6 19             	movzbl (%ecx),%ebx
  80079b:	84 db                	test   %bl,%bl
  80079d:	75 ec                	jne    80078b <strlcpy+0x1c>
  80079f:	89 d0                	mov    %edx,%eax
  8007a1:	c6 00 00             	movb   $0x0,(%eax)
  8007a4:	29 f0                	sub    %esi,%eax
  8007a6:	5b                   	pop    %ebx
  8007a7:	5e                   	pop    %esi
  8007a8:	5d                   	pop    %ebp
  8007a9:	c3                   	ret

008007aa <strcmp>:
  8007aa:	55                   	push   %ebp
  8007ab:	89 e5                	mov    %esp,%ebp
  8007ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8007b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007b3:	eb 06                	jmp    8007bb <strcmp+0x11>
  8007b5:	83 c1 01             	add    $0x1,%ecx
  8007b8:	83 c2 01             	add    $0x1,%edx
  8007bb:	0f b6 01             	movzbl (%ecx),%eax
  8007be:	84 c0                	test   %al,%al
  8007c0:	74 04                	je     8007c6 <strcmp+0x1c>
  8007c2:	3a 02                	cmp    (%edx),%al
  8007c4:	74 ef                	je     8007b5 <strcmp+0xb>
  8007c6:	0f b6 c0             	movzbl %al,%eax
  8007c9:	0f b6 12             	movzbl (%edx),%edx
  8007cc:	29 d0                	sub    %edx,%eax
  8007ce:	5d                   	pop    %ebp
  8007cf:	c3                   	ret

008007d0 <strncmp>:
  8007d0:	55                   	push   %ebp
  8007d1:	89 e5                	mov    %esp,%ebp
  8007d3:	53                   	push   %ebx
  8007d4:	8b 45 08             	mov    0x8(%ebp),%eax
  8007d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007da:	8b 55 10             	mov    0x10(%ebp),%edx
  8007dd:	eb 09                	jmp    8007e8 <strncmp+0x18>
  8007df:	83 ea 01             	sub    $0x1,%edx
  8007e2:	83 c0 01             	add    $0x1,%eax
  8007e5:	83 c1 01             	add    $0x1,%ecx
  8007e8:	85 d2                	test   %edx,%edx
  8007ea:	74 18                	je     800804 <strncmp+0x34>
  8007ec:	0f b6 18             	movzbl (%eax),%ebx
  8007ef:	84 db                	test   %bl,%bl
  8007f1:	74 04                	je     8007f7 <strncmp+0x27>
  8007f3:	3a 19                	cmp    (%ecx),%bl
  8007f5:	74 e8                	je     8007df <strncmp+0xf>
  8007f7:	0f b6 00             	movzbl (%eax),%eax
  8007fa:	0f b6 11             	movzbl (%ecx),%edx
  8007fd:	29 d0                	sub    %edx,%eax
  8007ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800802:	c9                   	leave
  800803:	c3                   	ret
  800804:	b8 00 00 00 00       	mov    $0x0,%eax
  800809:	eb f4                	jmp    8007ff <strncmp+0x2f>

0080080b <strchr>:
  80080b:	55                   	push   %ebp
  80080c:	89 e5                	mov    %esp,%ebp
  80080e:	8b 45 08             	mov    0x8(%ebp),%eax
  800811:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800815:	eb 03                	jmp    80081a <strchr+0xf>
  800817:	83 c0 01             	add    $0x1,%eax
  80081a:	0f b6 10             	movzbl (%eax),%edx
  80081d:	84 d2                	test   %dl,%dl
  80081f:	74 06                	je     800827 <strchr+0x1c>
  800821:	38 ca                	cmp    %cl,%dl
  800823:	75 f2                	jne    800817 <strchr+0xc>
  800825:	eb 05                	jmp    80082c <strchr+0x21>
  800827:	b8 00 00 00 00       	mov    $0x0,%eax
  80082c:	5d                   	pop    %ebp
  80082d:	c3                   	ret

0080082e <strfind>:
  80082e:	55                   	push   %ebp
  80082f:	89 e5                	mov    %esp,%ebp
  800831:	8b 45 08             	mov    0x8(%ebp),%eax
  800834:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800838:	0f b6 10             	movzbl (%eax),%edx
  80083b:	38 ca                	cmp    %cl,%dl
  80083d:	74 09                	je     800848 <strfind+0x1a>
  80083f:	84 d2                	test   %dl,%dl
  800841:	74 05                	je     800848 <strfind+0x1a>
  800843:	83 c0 01             	add    $0x1,%eax
  800846:	eb f0                	jmp    800838 <strfind+0xa>
  800848:	5d                   	pop    %ebp
  800849:	c3                   	ret

0080084a <memset>:
  80084a:	55                   	push   %ebp
  80084b:	89 e5                	mov    %esp,%ebp
  80084d:	57                   	push   %edi
  80084e:	8b 55 08             	mov    0x8(%ebp),%edx
  800851:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800854:	85 c9                	test   %ecx,%ecx
  800856:	74 24                	je     80087c <memset+0x32>
  800858:	89 d0                	mov    %edx,%eax
  80085a:	09 c8                	or     %ecx,%eax
  80085c:	a8 03                	test   $0x3,%al
  80085e:	75 14                	jne    800874 <memset+0x2a>
  800860:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800864:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  80086a:	c1 e9 02             	shr    $0x2,%ecx
  80086d:	89 d7                	mov    %edx,%edi
  80086f:	fc                   	cld
  800870:	f3 ab                	rep stos %eax,%es:(%edi)
  800872:	eb 08                	jmp    80087c <memset+0x32>
  800874:	89 d7                	mov    %edx,%edi
  800876:	8b 45 0c             	mov    0xc(%ebp),%eax
  800879:	fc                   	cld
  80087a:	f3 aa                	rep stos %al,%es:(%edi)
  80087c:	89 d0                	mov    %edx,%eax
  80087e:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800881:	c9                   	leave
  800882:	c3                   	ret

00800883 <memmove>:
  800883:	55                   	push   %ebp
  800884:	89 e5                	mov    %esp,%ebp
  800886:	57                   	push   %edi
  800887:	56                   	push   %esi
  800888:	8b 45 08             	mov    0x8(%ebp),%eax
  80088b:	8b 75 0c             	mov    0xc(%ebp),%esi
  80088e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800891:	39 c6                	cmp    %eax,%esi
  800893:	73 32                	jae    8008c7 <memmove+0x44>
  800895:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800898:	39 d0                	cmp    %edx,%eax
  80089a:	73 2b                	jae    8008c7 <memmove+0x44>
  80089c:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  80089f:	89 fe                	mov    %edi,%esi
  8008a1:	09 ce                	or     %ecx,%esi
  8008a3:	09 d6                	or     %edx,%esi
  8008a5:	f7 c6 03 00 00 00    	test   $0x3,%esi
  8008ab:	75 0e                	jne    8008bb <memmove+0x38>
  8008ad:	83 ef 04             	sub    $0x4,%edi
  8008b0:	8d 72 fc             	lea    -0x4(%edx),%esi
  8008b3:	c1 e9 02             	shr    $0x2,%ecx
  8008b6:	fd                   	std
  8008b7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008b9:	eb 09                	jmp    8008c4 <memmove+0x41>
  8008bb:	83 ef 01             	sub    $0x1,%edi
  8008be:	8d 72 ff             	lea    -0x1(%edx),%esi
  8008c1:	fd                   	std
  8008c2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008c4:	fc                   	cld
  8008c5:	eb 1a                	jmp    8008e1 <memmove+0x5e>
  8008c7:	89 c2                	mov    %eax,%edx
  8008c9:	09 ca                	or     %ecx,%edx
  8008cb:	09 f2                	or     %esi,%edx
  8008cd:	f6 c2 03             	test   $0x3,%dl
  8008d0:	75 0a                	jne    8008dc <memmove+0x59>
  8008d2:	c1 e9 02             	shr    $0x2,%ecx
  8008d5:	89 c7                	mov    %eax,%edi
  8008d7:	fc                   	cld
  8008d8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008da:	eb 05                	jmp    8008e1 <memmove+0x5e>
  8008dc:	89 c7                	mov    %eax,%edi
  8008de:	fc                   	cld
  8008df:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008e1:	5e                   	pop    %esi
  8008e2:	5f                   	pop    %edi
  8008e3:	5d                   	pop    %ebp
  8008e4:	c3                   	ret

008008e5 <memcpy>:
  8008e5:	55                   	push   %ebp
  8008e6:	89 e5                	mov    %esp,%ebp
  8008e8:	83 ec 0c             	sub    $0xc,%esp
  8008eb:	ff 75 10             	push   0x10(%ebp)
  8008ee:	ff 75 0c             	push   0xc(%ebp)
  8008f1:	ff 75 08             	push   0x8(%ebp)
  8008f4:	e8 8a ff ff ff       	call   800883 <memmove>
  8008f9:	c9                   	leave
  8008fa:	c3                   	ret

008008fb <memcmp>:
  8008fb:	55                   	push   %ebp
  8008fc:	89 e5                	mov    %esp,%ebp
  8008fe:	56                   	push   %esi
  8008ff:	53                   	push   %ebx
  800900:	8b 45 08             	mov    0x8(%ebp),%eax
  800903:	8b 55 0c             	mov    0xc(%ebp),%edx
  800906:	89 c6                	mov    %eax,%esi
  800908:	03 75 10             	add    0x10(%ebp),%esi
  80090b:	eb 06                	jmp    800913 <memcmp+0x18>
  80090d:	83 c0 01             	add    $0x1,%eax
  800910:	83 c2 01             	add    $0x1,%edx
  800913:	39 f0                	cmp    %esi,%eax
  800915:	74 14                	je     80092b <memcmp+0x30>
  800917:	0f b6 08             	movzbl (%eax),%ecx
  80091a:	0f b6 1a             	movzbl (%edx),%ebx
  80091d:	38 d9                	cmp    %bl,%cl
  80091f:	74 ec                	je     80090d <memcmp+0x12>
  800921:	0f b6 c1             	movzbl %cl,%eax
  800924:	0f b6 db             	movzbl %bl,%ebx
  800927:	29 d8                	sub    %ebx,%eax
  800929:	eb 05                	jmp    800930 <memcmp+0x35>
  80092b:	b8 00 00 00 00       	mov    $0x0,%eax
  800930:	5b                   	pop    %ebx
  800931:	5e                   	pop    %esi
  800932:	5d                   	pop    %ebp
  800933:	c3                   	ret

00800934 <memfind>:
  800934:	55                   	push   %ebp
  800935:	89 e5                	mov    %esp,%ebp
  800937:	8b 45 08             	mov    0x8(%ebp),%eax
  80093a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80093d:	89 c2                	mov    %eax,%edx
  80093f:	03 55 10             	add    0x10(%ebp),%edx
  800942:	eb 03                	jmp    800947 <memfind+0x13>
  800944:	83 c0 01             	add    $0x1,%eax
  800947:	39 d0                	cmp    %edx,%eax
  800949:	73 04                	jae    80094f <memfind+0x1b>
  80094b:	38 08                	cmp    %cl,(%eax)
  80094d:	75 f5                	jne    800944 <memfind+0x10>
  80094f:	5d                   	pop    %ebp
  800950:	c3                   	ret

00800951 <strtol>:
  800951:	55                   	push   %ebp
  800952:	89 e5                	mov    %esp,%ebp
  800954:	57                   	push   %edi
  800955:	56                   	push   %esi
  800956:	53                   	push   %ebx
  800957:	8b 55 08             	mov    0x8(%ebp),%edx
  80095a:	8b 5d 10             	mov    0x10(%ebp),%ebx
  80095d:	eb 03                	jmp    800962 <strtol+0x11>
  80095f:	83 c2 01             	add    $0x1,%edx
  800962:	0f b6 02             	movzbl (%edx),%eax
  800965:	3c 20                	cmp    $0x20,%al
  800967:	74 f6                	je     80095f <strtol+0xe>
  800969:	3c 09                	cmp    $0x9,%al
  80096b:	74 f2                	je     80095f <strtol+0xe>
  80096d:	3c 2b                	cmp    $0x2b,%al
  80096f:	74 2a                	je     80099b <strtol+0x4a>
  800971:	bf 00 00 00 00       	mov    $0x0,%edi
  800976:	3c 2d                	cmp    $0x2d,%al
  800978:	74 2b                	je     8009a5 <strtol+0x54>
  80097a:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800980:	75 0f                	jne    800991 <strtol+0x40>
  800982:	80 3a 30             	cmpb   $0x30,(%edx)
  800985:	74 28                	je     8009af <strtol+0x5e>
  800987:	85 db                	test   %ebx,%ebx
  800989:	b8 0a 00 00 00       	mov    $0xa,%eax
  80098e:	0f 44 d8             	cmove  %eax,%ebx
  800991:	b9 00 00 00 00       	mov    $0x0,%ecx
  800996:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800999:	eb 46                	jmp    8009e1 <strtol+0x90>
  80099b:	83 c2 01             	add    $0x1,%edx
  80099e:	bf 00 00 00 00       	mov    $0x0,%edi
  8009a3:	eb d5                	jmp    80097a <strtol+0x29>
  8009a5:	83 c2 01             	add    $0x1,%edx
  8009a8:	bf 01 00 00 00       	mov    $0x1,%edi
  8009ad:	eb cb                	jmp    80097a <strtol+0x29>
  8009af:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  8009b3:	74 0e                	je     8009c3 <strtol+0x72>
  8009b5:	85 db                	test   %ebx,%ebx
  8009b7:	75 d8                	jne    800991 <strtol+0x40>
  8009b9:	83 c2 01             	add    $0x1,%edx
  8009bc:	bb 08 00 00 00       	mov    $0x8,%ebx
  8009c1:	eb ce                	jmp    800991 <strtol+0x40>
  8009c3:	83 c2 02             	add    $0x2,%edx
  8009c6:	bb 10 00 00 00       	mov    $0x10,%ebx
  8009cb:	eb c4                	jmp    800991 <strtol+0x40>
  8009cd:	0f be c0             	movsbl %al,%eax
  8009d0:	83 e8 30             	sub    $0x30,%eax
  8009d3:	3b 45 10             	cmp    0x10(%ebp),%eax
  8009d6:	7d 3a                	jge    800a12 <strtol+0xc1>
  8009d8:	83 c2 01             	add    $0x1,%edx
  8009db:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  8009df:	01 c1                	add    %eax,%ecx
  8009e1:	0f b6 02             	movzbl (%edx),%eax
  8009e4:	8d 70 d0             	lea    -0x30(%eax),%esi
  8009e7:	89 f3                	mov    %esi,%ebx
  8009e9:	80 fb 09             	cmp    $0x9,%bl
  8009ec:	76 df                	jbe    8009cd <strtol+0x7c>
  8009ee:	8d 70 9f             	lea    -0x61(%eax),%esi
  8009f1:	89 f3                	mov    %esi,%ebx
  8009f3:	80 fb 19             	cmp    $0x19,%bl
  8009f6:	77 08                	ja     800a00 <strtol+0xaf>
  8009f8:	0f be c0             	movsbl %al,%eax
  8009fb:	83 e8 57             	sub    $0x57,%eax
  8009fe:	eb d3                	jmp    8009d3 <strtol+0x82>
  800a00:	8d 70 bf             	lea    -0x41(%eax),%esi
  800a03:	89 f3                	mov    %esi,%ebx
  800a05:	80 fb 19             	cmp    $0x19,%bl
  800a08:	77 08                	ja     800a12 <strtol+0xc1>
  800a0a:	0f be c0             	movsbl %al,%eax
  800a0d:	83 e8 37             	sub    $0x37,%eax
  800a10:	eb c1                	jmp    8009d3 <strtol+0x82>
  800a12:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800a16:	74 05                	je     800a1d <strtol+0xcc>
  800a18:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a1b:	89 10                	mov    %edx,(%eax)
  800a1d:	89 c8                	mov    %ecx,%eax
  800a1f:	f7 d8                	neg    %eax
  800a21:	85 ff                	test   %edi,%edi
  800a23:	0f 45 c8             	cmovne %eax,%ecx
  800a26:	89 c8                	mov    %ecx,%eax
  800a28:	5b                   	pop    %ebx
  800a29:	5e                   	pop    %esi
  800a2a:	5f                   	pop    %edi
  800a2b:	5d                   	pop    %ebp
  800a2c:	c3                   	ret

00800a2d <syscall>:
  800a2d:	55                   	push   %ebp
  800a2e:	89 e5                	mov    %esp,%ebp
  800a30:	57                   	push   %edi
  800a31:	56                   	push   %esi
  800a32:	53                   	push   %ebx
  800a33:	83 ec 1c             	sub    $0x1c,%esp
  800a36:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a39:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a3c:	89 ca                	mov    %ecx,%edx
  800a3e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a41:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a44:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a47:	8b 75 14             	mov    0x14(%ebp),%esi
  800a4a:	cd 30                	int    $0x30
  800a4c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800a50:	74 04                	je     800a56 <syscall+0x29>
  800a52:	85 c0                	test   %eax,%eax
  800a54:	7f 08                	jg     800a5e <syscall+0x31>
  800a56:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800a59:	5b                   	pop    %ebx
  800a5a:	5e                   	pop    %esi
  800a5b:	5f                   	pop    %edi
  800a5c:	5d                   	pop    %ebp
  800a5d:	c3                   	ret
  800a5e:	83 ec 0c             	sub    $0xc,%esp
  800a61:	50                   	push   %eax
  800a62:	ff 75 e0             	push   -0x20(%ebp)
  800a65:	68 8a 15 80 00       	push   $0x80158a
  800a6a:	6a 1e                	push   $0x1e
  800a6c:	68 a7 15 80 00       	push   $0x8015a7
  800a71:	e8 12 07 00 00       	call   801188 <_panic>

00800a76 <sys_cputs>:
  800a76:	55                   	push   %ebp
  800a77:	89 e5                	mov    %esp,%ebp
  800a79:	83 ec 08             	sub    $0x8,%esp
  800a7c:	6a 00                	push   $0x0
  800a7e:	6a 00                	push   $0x0
  800a80:	6a 00                	push   $0x0
  800a82:	ff 75 0c             	push   0xc(%ebp)
  800a85:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a88:	ba 00 00 00 00       	mov    $0x0,%edx
  800a8d:	b8 00 00 00 00       	mov    $0x0,%eax
  800a92:	e8 96 ff ff ff       	call   800a2d <syscall>
  800a97:	83 c4 10             	add    $0x10,%esp
  800a9a:	c9                   	leave
  800a9b:	c3                   	ret

00800a9c <sys_cgetc>:
  800a9c:	55                   	push   %ebp
  800a9d:	89 e5                	mov    %esp,%ebp
  800a9f:	83 ec 08             	sub    $0x8,%esp
  800aa2:	6a 00                	push   $0x0
  800aa4:	6a 00                	push   $0x0
  800aa6:	6a 00                	push   $0x0
  800aa8:	6a 00                	push   $0x0
  800aaa:	b9 00 00 00 00       	mov    $0x0,%ecx
  800aaf:	ba 00 00 00 00       	mov    $0x0,%edx
  800ab4:	b8 01 00 00 00       	mov    $0x1,%eax
  800ab9:	e8 6f ff ff ff       	call   800a2d <syscall>
  800abe:	c9                   	leave
  800abf:	c3                   	ret

00800ac0 <sys_env_destroy>:
  800ac0:	55                   	push   %ebp
  800ac1:	89 e5                	mov    %esp,%ebp
  800ac3:	83 ec 08             	sub    $0x8,%esp
  800ac6:	6a 00                	push   $0x0
  800ac8:	6a 00                	push   $0x0
  800aca:	6a 00                	push   $0x0
  800acc:	6a 00                	push   $0x0
  800ace:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ad1:	ba 01 00 00 00       	mov    $0x1,%edx
  800ad6:	b8 03 00 00 00       	mov    $0x3,%eax
  800adb:	e8 4d ff ff ff       	call   800a2d <syscall>
  800ae0:	c9                   	leave
  800ae1:	c3                   	ret

00800ae2 <sys_getenvid>:
  800ae2:	55                   	push   %ebp
  800ae3:	89 e5                	mov    %esp,%ebp
  800ae5:	83 ec 08             	sub    $0x8,%esp
  800ae8:	6a 00                	push   $0x0
  800aea:	6a 00                	push   $0x0
  800aec:	6a 00                	push   $0x0
  800aee:	6a 00                	push   $0x0
  800af0:	b9 00 00 00 00       	mov    $0x0,%ecx
  800af5:	ba 00 00 00 00       	mov    $0x0,%edx
  800afa:	b8 02 00 00 00       	mov    $0x2,%eax
  800aff:	e8 29 ff ff ff       	call   800a2d <syscall>
  800b04:	c9                   	leave
  800b05:	c3                   	ret

00800b06 <sys_yield>:
  800b06:	55                   	push   %ebp
  800b07:	89 e5                	mov    %esp,%ebp
  800b09:	83 ec 08             	sub    $0x8,%esp
  800b0c:	6a 00                	push   $0x0
  800b0e:	6a 00                	push   $0x0
  800b10:	6a 00                	push   $0x0
  800b12:	6a 00                	push   $0x0
  800b14:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b19:	ba 00 00 00 00       	mov    $0x0,%edx
  800b1e:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b23:	e8 05 ff ff ff       	call   800a2d <syscall>
  800b28:	83 c4 10             	add    $0x10,%esp
  800b2b:	c9                   	leave
  800b2c:	c3                   	ret

00800b2d <sys_page_alloc>:
  800b2d:	55                   	push   %ebp
  800b2e:	89 e5                	mov    %esp,%ebp
  800b30:	83 ec 08             	sub    $0x8,%esp
  800b33:	6a 00                	push   $0x0
  800b35:	6a 00                	push   $0x0
  800b37:	ff 75 10             	push   0x10(%ebp)
  800b3a:	ff 75 0c             	push   0xc(%ebp)
  800b3d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b40:	ba 01 00 00 00       	mov    $0x1,%edx
  800b45:	b8 04 00 00 00       	mov    $0x4,%eax
  800b4a:	e8 de fe ff ff       	call   800a2d <syscall>
  800b4f:	c9                   	leave
  800b50:	c3                   	ret

00800b51 <sys_page_map>:
  800b51:	55                   	push   %ebp
  800b52:	89 e5                	mov    %esp,%ebp
  800b54:	83 ec 08             	sub    $0x8,%esp
  800b57:	ff 75 18             	push   0x18(%ebp)
  800b5a:	ff 75 14             	push   0x14(%ebp)
  800b5d:	ff 75 10             	push   0x10(%ebp)
  800b60:	ff 75 0c             	push   0xc(%ebp)
  800b63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b66:	ba 01 00 00 00       	mov    $0x1,%edx
  800b6b:	b8 05 00 00 00       	mov    $0x5,%eax
  800b70:	e8 b8 fe ff ff       	call   800a2d <syscall>
  800b75:	c9                   	leave
  800b76:	c3                   	ret

00800b77 <sys_page_unmap>:
  800b77:	55                   	push   %ebp
  800b78:	89 e5                	mov    %esp,%ebp
  800b7a:	83 ec 08             	sub    $0x8,%esp
  800b7d:	6a 00                	push   $0x0
  800b7f:	6a 00                	push   $0x0
  800b81:	6a 00                	push   $0x0
  800b83:	ff 75 0c             	push   0xc(%ebp)
  800b86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b89:	ba 01 00 00 00       	mov    $0x1,%edx
  800b8e:	b8 06 00 00 00       	mov    $0x6,%eax
  800b93:	e8 95 fe ff ff       	call   800a2d <syscall>
  800b98:	c9                   	leave
  800b99:	c3                   	ret

00800b9a <sys_env_set_status>:
  800b9a:	55                   	push   %ebp
  800b9b:	89 e5                	mov    %esp,%ebp
  800b9d:	83 ec 08             	sub    $0x8,%esp
  800ba0:	6a 00                	push   $0x0
  800ba2:	6a 00                	push   $0x0
  800ba4:	6a 00                	push   $0x0
  800ba6:	ff 75 0c             	push   0xc(%ebp)
  800ba9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bac:	ba 01 00 00 00       	mov    $0x1,%edx
  800bb1:	b8 08 00 00 00       	mov    $0x8,%eax
  800bb6:	e8 72 fe ff ff       	call   800a2d <syscall>
  800bbb:	c9                   	leave
  800bbc:	c3                   	ret

00800bbd <sys_env_set_pgfault_upcall>:
  800bbd:	55                   	push   %ebp
  800bbe:	89 e5                	mov    %esp,%ebp
  800bc0:	83 ec 08             	sub    $0x8,%esp
  800bc3:	6a 00                	push   $0x0
  800bc5:	6a 00                	push   $0x0
  800bc7:	6a 00                	push   $0x0
  800bc9:	ff 75 0c             	push   0xc(%ebp)
  800bcc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bcf:	ba 01 00 00 00       	mov    $0x1,%edx
  800bd4:	b8 09 00 00 00       	mov    $0x9,%eax
  800bd9:	e8 4f fe ff ff       	call   800a2d <syscall>
  800bde:	c9                   	leave
  800bdf:	c3                   	ret

00800be0 <sys_ipc_try_send>:
  800be0:	55                   	push   %ebp
  800be1:	89 e5                	mov    %esp,%ebp
  800be3:	83 ec 08             	sub    $0x8,%esp
  800be6:	6a 00                	push   $0x0
  800be8:	ff 75 14             	push   0x14(%ebp)
  800beb:	ff 75 10             	push   0x10(%ebp)
  800bee:	ff 75 0c             	push   0xc(%ebp)
  800bf1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bf4:	ba 00 00 00 00       	mov    $0x0,%edx
  800bf9:	b8 0c 00 00 00       	mov    $0xc,%eax
  800bfe:	e8 2a fe ff ff       	call   800a2d <syscall>
  800c03:	c9                   	leave
  800c04:	c3                   	ret

00800c05 <sys_ipc_recv>:
  800c05:	55                   	push   %ebp
  800c06:	89 e5                	mov    %esp,%ebp
  800c08:	83 ec 08             	sub    $0x8,%esp
  800c0b:	6a 00                	push   $0x0
  800c0d:	6a 00                	push   $0x0
  800c0f:	6a 00                	push   $0x0
  800c11:	6a 00                	push   $0x0
  800c13:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c16:	ba 01 00 00 00       	mov    $0x1,%edx
  800c1b:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c20:	e8 08 fe ff ff       	call   800a2d <syscall>
  800c25:	c9                   	leave
  800c26:	c3                   	ret

00800c27 <duppage>:
  800c27:	55                   	push   %ebp
  800c28:	89 e5                	mov    %esp,%ebp
  800c2a:	56                   	push   %esi
  800c2b:	53                   	push   %ebx
  800c2c:	89 c1                	mov    %eax,%ecx
  800c2e:	89 d6                	mov    %edx,%esi
  800c30:	c1 e6 0c             	shl    $0xc,%esi
  800c33:	8b 14 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%edx
  800c3a:	89 d0                	mov    %edx,%eax
  800c3c:	f7 d0                	not    %eax
  800c3e:	a8 05                	test   $0x5,%al
  800c40:	75 5a                	jne    800c9c <duppage+0x75>
  800c42:	89 d0                	mov    %edx,%eax
  800c44:	83 e0 18             	and    $0x18,%eax
  800c47:	83 f8 01             	cmp    $0x1,%eax
  800c4a:	19 c0                	sbb    %eax,%eax
  800c4c:	83 e0 e8             	and    $0xffffffe8,%eax
  800c4f:	83 c0 1d             	add    $0x1d,%eax
  800c52:	f7 c2 02 08 00 00    	test   $0x802,%edx
  800c58:	74 68                	je     800cc2 <duppage+0x9b>
  800c5a:	80 cc 08             	or     $0x8,%ah
  800c5d:	89 c3                	mov    %eax,%ebx
  800c5f:	83 ec 0c             	sub    $0xc,%esp
  800c62:	53                   	push   %ebx
  800c63:	56                   	push   %esi
  800c64:	51                   	push   %ecx
  800c65:	56                   	push   %esi
  800c66:	6a 00                	push   $0x0
  800c68:	e8 e4 fe ff ff       	call   800b51 <sys_page_map>
  800c6d:	83 c4 20             	add    $0x20,%esp
  800c70:	85 c0                	test   %eax,%eax
  800c72:	78 3c                	js     800cb0 <duppage+0x89>
  800c74:	83 ec 0c             	sub    $0xc,%esp
  800c77:	53                   	push   %ebx
  800c78:	56                   	push   %esi
  800c79:	6a 00                	push   $0x0
  800c7b:	56                   	push   %esi
  800c7c:	6a 00                	push   $0x0
  800c7e:	e8 ce fe ff ff       	call   800b51 <sys_page_map>
  800c83:	83 c4 20             	add    $0x20,%esp
  800c86:	85 c0                	test   %eax,%eax
  800c88:	79 4d                	jns    800cd7 <duppage+0xb0>
  800c8a:	50                   	push   %eax
  800c8b:	68 60 18 80 00       	push   $0x801860
  800c90:	6a 57                	push   $0x57
  800c92:	68 b5 15 80 00       	push   $0x8015b5
  800c97:	e8 ec 04 00 00       	call   801188 <_panic>
  800c9c:	83 ec 04             	sub    $0x4,%esp
  800c9f:	68 04 18 80 00       	push   $0x801804
  800ca4:	6a 47                	push   $0x47
  800ca6:	68 b5 15 80 00       	push   $0x8015b5
  800cab:	e8 d8 04 00 00       	call   801188 <_panic>
  800cb0:	50                   	push   %eax
  800cb1:	68 34 18 80 00       	push   $0x801834
  800cb6:	6a 53                	push   $0x53
  800cb8:	68 b5 15 80 00       	push   $0x8015b5
  800cbd:	e8 c6 04 00 00       	call   801188 <_panic>
  800cc2:	83 ec 0c             	sub    $0xc,%esp
  800cc5:	50                   	push   %eax
  800cc6:	56                   	push   %esi
  800cc7:	51                   	push   %ecx
  800cc8:	56                   	push   %esi
  800cc9:	6a 00                	push   $0x0
  800ccb:	e8 81 fe ff ff       	call   800b51 <sys_page_map>
  800cd0:	83 c4 20             	add    $0x20,%esp
  800cd3:	85 c0                	test   %eax,%eax
  800cd5:	78 0c                	js     800ce3 <duppage+0xbc>
  800cd7:	b8 00 00 00 00       	mov    $0x0,%eax
  800cdc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800cdf:	5b                   	pop    %ebx
  800ce0:	5e                   	pop    %esi
  800ce1:	5d                   	pop    %ebp
  800ce2:	c3                   	ret
  800ce3:	50                   	push   %eax
  800ce4:	68 88 18 80 00       	push   $0x801888
  800ce9:	6a 5b                	push   $0x5b
  800ceb:	68 b5 15 80 00       	push   $0x8015b5
  800cf0:	e8 93 04 00 00       	call   801188 <_panic>

00800cf5 <dup_or_share>:
  800cf5:	55                   	push   %ebp
  800cf6:	89 e5                	mov    %esp,%ebp
  800cf8:	57                   	push   %edi
  800cf9:	56                   	push   %esi
  800cfa:	53                   	push   %ebx
  800cfb:	83 ec 0c             	sub    $0xc,%esp
  800cfe:	89 c7                	mov    %eax,%edi
  800d00:	8b 04 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%eax
  800d07:	a8 01                	test   $0x1,%al
  800d09:	74 33                	je     800d3e <dup_or_share+0x49>
  800d0b:	89 d6                	mov    %edx,%esi
  800d0d:	21 c1                	and    %eax,%ecx
  800d0f:	89 cb                	mov    %ecx,%ebx
  800d11:	83 e3 02             	and    $0x2,%ebx
  800d14:	89 da                	mov    %ebx,%edx
  800d16:	83 ca 18             	or     $0x18,%edx
  800d19:	a8 18                	test   $0x18,%al
  800d1b:	0f 45 da             	cmovne %edx,%ebx
  800d1e:	c1 e6 0c             	shl    $0xc,%esi
  800d21:	83 e0 1a             	and    $0x1a,%eax
  800d24:	83 f8 02             	cmp    $0x2,%eax
  800d27:	74 32                	je     800d5b <dup_or_share+0x66>
  800d29:	83 ec 0c             	sub    $0xc,%esp
  800d2c:	53                   	push   %ebx
  800d2d:	56                   	push   %esi
  800d2e:	57                   	push   %edi
  800d2f:	56                   	push   %esi
  800d30:	6a 00                	push   $0x0
  800d32:	e8 1a fe ff ff       	call   800b51 <sys_page_map>
  800d37:	83 c4 20             	add    $0x20,%esp
  800d3a:	85 c0                	test   %eax,%eax
  800d3c:	78 08                	js     800d46 <dup_or_share+0x51>
  800d3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800d41:	5b                   	pop    %ebx
  800d42:	5e                   	pop    %esi
  800d43:	5f                   	pop    %edi
  800d44:	5d                   	pop    %ebp
  800d45:	c3                   	ret
  800d46:	50                   	push   %eax
  800d47:	68 b4 18 80 00       	push   $0x8018b4
  800d4c:	68 84 00 00 00       	push   $0x84
  800d51:	68 b5 15 80 00       	push   $0x8015b5
  800d56:	e8 2d 04 00 00       	call   801188 <_panic>
  800d5b:	83 ec 04             	sub    $0x4,%esp
  800d5e:	53                   	push   %ebx
  800d5f:	56                   	push   %esi
  800d60:	57                   	push   %edi
  800d61:	e8 c7 fd ff ff       	call   800b2d <sys_page_alloc>
  800d66:	83 c4 10             	add    $0x10,%esp
  800d69:	85 c0                	test   %eax,%eax
  800d6b:	78 57                	js     800dc4 <dup_or_share+0xcf>
  800d6d:	83 ec 0c             	sub    $0xc,%esp
  800d70:	53                   	push   %ebx
  800d71:	68 00 00 40 00       	push   $0x400000
  800d76:	6a 00                	push   $0x0
  800d78:	56                   	push   %esi
  800d79:	57                   	push   %edi
  800d7a:	e8 d2 fd ff ff       	call   800b51 <sys_page_map>
  800d7f:	83 c4 20             	add    $0x20,%esp
  800d82:	85 c0                	test   %eax,%eax
  800d84:	78 53                	js     800dd9 <dup_or_share+0xe4>
  800d86:	83 ec 04             	sub    $0x4,%esp
  800d89:	68 00 10 00 00       	push   $0x1000
  800d8e:	56                   	push   %esi
  800d8f:	68 00 00 40 00       	push   $0x400000
  800d94:	e8 ea fa ff ff       	call   800883 <memmove>
  800d99:	83 c4 08             	add    $0x8,%esp
  800d9c:	68 00 00 40 00       	push   $0x400000
  800da1:	6a 00                	push   $0x0
  800da3:	e8 cf fd ff ff       	call   800b77 <sys_page_unmap>
  800da8:	83 c4 10             	add    $0x10,%esp
  800dab:	85 c0                	test   %eax,%eax
  800dad:	79 8f                	jns    800d3e <dup_or_share+0x49>
  800daf:	50                   	push   %eax
  800db0:	68 ff 15 80 00       	push   $0x8015ff
  800db5:	68 8d 00 00 00       	push   $0x8d
  800dba:	68 b5 15 80 00       	push   $0x8015b5
  800dbf:	e8 c4 03 00 00       	call   801188 <_panic>
  800dc4:	50                   	push   %eax
  800dc5:	68 d4 18 80 00       	push   $0x8018d4
  800dca:	68 88 00 00 00       	push   $0x88
  800dcf:	68 b5 15 80 00       	push   $0x8015b5
  800dd4:	e8 af 03 00 00       	call   801188 <_panic>
  800dd9:	50                   	push   %eax
  800dda:	68 b4 18 80 00       	push   $0x8018b4
  800ddf:	68 8a 00 00 00       	push   $0x8a
  800de4:	68 b5 15 80 00       	push   $0x8015b5
  800de9:	e8 9a 03 00 00       	call   801188 <_panic>

00800dee <pgfault>:
  800dee:	55                   	push   %ebp
  800def:	89 e5                	mov    %esp,%ebp
  800df1:	53                   	push   %ebx
  800df2:	83 ec 08             	sub    $0x8,%esp
  800df5:	8b 45 08             	mov    0x8(%ebp),%eax
  800df8:	8b 18                	mov    (%eax),%ebx
  800dfa:	89 d8                	mov    %ebx,%eax
  800dfc:	c1 e8 0c             	shr    $0xc,%eax
  800dff:	8b 04 85 00 00 40 ef 	mov    -0x10c00000(,%eax,4),%eax
  800e06:	6a 07                	push   $0x7
  800e08:	68 00 f0 7f 00       	push   $0x7ff000
  800e0d:	6a 00                	push   $0x0
  800e0f:	e8 19 fd ff ff       	call   800b2d <sys_page_alloc>
  800e14:	83 c4 10             	add    $0x10,%esp
  800e17:	85 c0                	test   %eax,%eax
  800e19:	78 51                	js     800e6c <pgfault+0x7e>
  800e1b:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  800e21:	83 ec 04             	sub    $0x4,%esp
  800e24:	68 00 10 00 00       	push   $0x1000
  800e29:	53                   	push   %ebx
  800e2a:	68 00 f0 7f 00       	push   $0x7ff000
  800e2f:	e8 4f fa ff ff       	call   800883 <memmove>
  800e34:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  800e3b:	53                   	push   %ebx
  800e3c:	6a 00                	push   $0x0
  800e3e:	68 00 f0 7f 00       	push   $0x7ff000
  800e43:	6a 00                	push   $0x0
  800e45:	e8 07 fd ff ff       	call   800b51 <sys_page_map>
  800e4a:	83 c4 20             	add    $0x20,%esp
  800e4d:	85 c0                	test   %eax,%eax
  800e4f:	78 2d                	js     800e7e <pgfault+0x90>
  800e51:	83 ec 08             	sub    $0x8,%esp
  800e54:	68 00 f0 7f 00       	push   $0x7ff000
  800e59:	6a 00                	push   $0x0
  800e5b:	e8 17 fd ff ff       	call   800b77 <sys_page_unmap>
  800e60:	83 c4 10             	add    $0x10,%esp
  800e63:	85 c0                	test   %eax,%eax
  800e65:	78 29                	js     800e90 <pgfault+0xa2>
  800e67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800e6a:	c9                   	leave
  800e6b:	c3                   	ret
  800e6c:	50                   	push   %eax
  800e6d:	68 c0 15 80 00       	push   $0x8015c0
  800e72:	6a 27                	push   $0x27
  800e74:	68 b5 15 80 00       	push   $0x8015b5
  800e79:	e8 0a 03 00 00       	call   801188 <_panic>
  800e7e:	50                   	push   %eax
  800e7f:	68 dc 15 80 00       	push   $0x8015dc
  800e84:	6a 2c                	push   $0x2c
  800e86:	68 b5 15 80 00       	push   $0x8015b5
  800e8b:	e8 f8 02 00 00       	call   801188 <_panic>
  800e90:	50                   	push   %eax
  800e91:	68 f6 15 80 00       	push   $0x8015f6
  800e96:	6a 2f                	push   $0x2f
  800e98:	68 b5 15 80 00       	push   $0x8015b5
  800e9d:	e8 e6 02 00 00       	call   801188 <_panic>

00800ea2 <fork_v0>:
  800ea2:	55                   	push   %ebp
  800ea3:	89 e5                	mov    %esp,%ebp
  800ea5:	56                   	push   %esi
  800ea6:	53                   	push   %ebx
  800ea7:	b8 07 00 00 00       	mov    $0x7,%eax
  800eac:	cd 30                	int    $0x30
  800eae:	89 c6                	mov    %eax,%esi
  800eb0:	85 c0                	test   %eax,%eax
  800eb2:	78 23                	js     800ed7 <fork_v0+0x35>
  800eb4:	bb 00 00 00 00       	mov    $0x0,%ebx
  800eb9:	75 3c                	jne    800ef7 <fork_v0+0x55>
  800ebb:	e8 22 fc ff ff       	call   800ae2 <sys_getenvid>
  800ec0:	25 ff 03 00 00       	and    $0x3ff,%eax
  800ec5:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800ecb:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800ed0:	a3 04 20 80 00       	mov    %eax,0x802004
  800ed5:	eb 54                	jmp    800f2b <fork_v0+0x89>
  800ed7:	50                   	push   %eax
  800ed8:	68 12 16 80 00       	push   $0x801612
  800edd:	68 a2 00 00 00       	push   $0xa2
  800ee2:	68 b5 15 80 00       	push   $0x8015b5
  800ee7:	e8 9c 02 00 00       	call   801188 <_panic>
  800eec:	83 c3 01             	add    $0x1,%ebx
  800eef:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800ef5:	74 22                	je     800f19 <fork_v0+0x77>
  800ef7:	89 d8                	mov    %ebx,%eax
  800ef9:	c1 e8 0a             	shr    $0xa,%eax
  800efc:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800f03:	f7 d0                	not    %eax
  800f05:	a8 05                	test   $0x5,%al
  800f07:	75 e3                	jne    800eec <fork_v0+0x4a>
  800f09:	b9 07 00 00 00       	mov    $0x7,%ecx
  800f0e:	89 da                	mov    %ebx,%edx
  800f10:	89 f0                	mov    %esi,%eax
  800f12:	e8 de fd ff ff       	call   800cf5 <dup_or_share>
  800f17:	eb d3                	jmp    800eec <fork_v0+0x4a>
  800f19:	83 ec 08             	sub    $0x8,%esp
  800f1c:	6a 02                	push   $0x2
  800f1e:	56                   	push   %esi
  800f1f:	e8 76 fc ff ff       	call   800b9a <sys_env_set_status>
  800f24:	83 c4 10             	add    $0x10,%esp
  800f27:	85 c0                	test   %eax,%eax
  800f29:	78 09                	js     800f34 <fork_v0+0x92>
  800f2b:	89 f0                	mov    %esi,%eax
  800f2d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800f30:	5b                   	pop    %ebx
  800f31:	5e                   	pop    %esi
  800f32:	5d                   	pop    %ebp
  800f33:	c3                   	ret
  800f34:	50                   	push   %eax
  800f35:	68 22 16 80 00       	push   $0x801622
  800f3a:	68 b8 00 00 00       	push   $0xb8
  800f3f:	68 b5 15 80 00       	push   $0x8015b5
  800f44:	e8 3f 02 00 00       	call   801188 <_panic>

00800f49 <fork>:
  800f49:	55                   	push   %ebp
  800f4a:	89 e5                	mov    %esp,%ebp
  800f4c:	56                   	push   %esi
  800f4d:	53                   	push   %ebx
  800f4e:	83 ec 0c             	sub    $0xc,%esp
  800f51:	68 ee 0d 80 00       	push   $0x800dee
  800f56:	e8 73 02 00 00       	call   8011ce <set_pgfault_handler>
  800f5b:	b8 07 00 00 00       	mov    $0x7,%eax
  800f60:	cd 30                	int    $0x30
  800f62:	89 c6                	mov    %eax,%esi
  800f64:	83 c4 10             	add    $0x10,%esp
  800f67:	85 c0                	test   %eax,%eax
  800f69:	78 26                	js     800f91 <fork+0x48>
  800f6b:	bb 00 00 00 00       	mov    $0x0,%ebx
  800f70:	75 47                	jne    800fb9 <fork+0x70>
  800f72:	e8 6b fb ff ff       	call   800ae2 <sys_getenvid>
  800f77:	25 ff 03 00 00       	and    $0x3ff,%eax
  800f7c:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800f82:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800f87:	a3 04 20 80 00       	mov    %eax,0x802004
  800f8c:	e9 94 00 00 00       	jmp    801025 <fork+0xdc>
  800f91:	50                   	push   %eax
  800f92:	68 12 16 80 00       	push   $0x801612
  800f97:	68 d5 00 00 00       	push   $0xd5
  800f9c:	68 b5 15 80 00       	push   $0x8015b5
  800fa1:	e8 e2 01 00 00       	call   801188 <_panic>
  800fa6:	83 c3 01             	add    $0x1,%ebx
  800fa9:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800faf:	74 32                	je     800fe3 <fork+0x9a>
  800fb1:	81 fb ff eb 0e 00    	cmp    $0xeebff,%ebx
  800fb7:	74 ed                	je     800fa6 <fork+0x5d>
  800fb9:	89 d8                	mov    %ebx,%eax
  800fbb:	c1 e8 0a             	shr    $0xa,%eax
  800fbe:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800fc5:	f7 d0                	not    %eax
  800fc7:	a8 05                	test   $0x5,%al
  800fc9:	75 db                	jne    800fa6 <fork+0x5d>
  800fcb:	8b 04 9d 00 00 40 ef 	mov    -0x10c00000(,%ebx,4),%eax
  800fd2:	f7 d0                	not    %eax
  800fd4:	a8 05                	test   $0x5,%al
  800fd6:	75 ce                	jne    800fa6 <fork+0x5d>
  800fd8:	89 da                	mov    %ebx,%edx
  800fda:	89 f0                	mov    %esi,%eax
  800fdc:	e8 46 fc ff ff       	call   800c27 <duppage>
  800fe1:	eb c3                	jmp    800fa6 <fork+0x5d>
  800fe3:	83 ec 04             	sub    $0x4,%esp
  800fe6:	6a 07                	push   $0x7
  800fe8:	68 00 f0 bf ee       	push   $0xeebff000
  800fed:	56                   	push   %esi
  800fee:	e8 3a fb ff ff       	call   800b2d <sys_page_alloc>
  800ff3:	83 c4 10             	add    $0x10,%esp
  800ff6:	85 c0                	test   %eax,%eax
  800ff8:	78 34                	js     80102e <fork+0xe5>
  800ffa:	a1 04 20 80 00       	mov    0x802004,%eax
  800fff:	8b 40 64             	mov    0x64(%eax),%eax
  801002:	83 ec 08             	sub    $0x8,%esp
  801005:	50                   	push   %eax
  801006:	56                   	push   %esi
  801007:	e8 b1 fb ff ff       	call   800bbd <sys_env_set_pgfault_upcall>
  80100c:	83 c4 10             	add    $0x10,%esp
  80100f:	85 c0                	test   %eax,%eax
  801011:	78 30                	js     801043 <fork+0xfa>
  801013:	83 ec 08             	sub    $0x8,%esp
  801016:	6a 02                	push   $0x2
  801018:	56                   	push   %esi
  801019:	e8 7c fb ff ff       	call   800b9a <sys_env_set_status>
  80101e:	83 c4 10             	add    $0x10,%esp
  801021:	85 c0                	test   %eax,%eax
  801023:	78 33                	js     801058 <fork+0x10f>
  801025:	89 f0                	mov    %esi,%eax
  801027:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80102a:	5b                   	pop    %ebx
  80102b:	5e                   	pop    %esi
  80102c:	5d                   	pop    %ebp
  80102d:	c3                   	ret
  80102e:	50                   	push   %eax
  80102f:	68 f8 18 80 00       	push   $0x8018f8
  801034:	68 f2 00 00 00       	push   $0xf2
  801039:	68 b5 15 80 00       	push   $0x8015b5
  80103e:	e8 45 01 00 00       	call   801188 <_panic>
  801043:	50                   	push   %eax
  801044:	68 24 19 80 00       	push   $0x801924
  801049:	68 f5 00 00 00       	push   $0xf5
  80104e:	68 b5 15 80 00       	push   $0x8015b5
  801053:	e8 30 01 00 00       	call   801188 <_panic>
  801058:	50                   	push   %eax
  801059:	68 22 16 80 00       	push   $0x801622
  80105e:	68 f8 00 00 00       	push   $0xf8
  801063:	68 b5 15 80 00       	push   $0x8015b5
  801068:	e8 1b 01 00 00       	call   801188 <_panic>

0080106d <sfork>:
  80106d:	55                   	push   %ebp
  80106e:	89 e5                	mov    %esp,%ebp
  801070:	83 ec 0c             	sub    $0xc,%esp
  801073:	68 39 16 80 00       	push   $0x801639
  801078:	68 01 01 00 00       	push   $0x101
  80107d:	68 b5 15 80 00       	push   $0x8015b5
  801082:	e8 01 01 00 00       	call   801188 <_panic>

00801087 <ipc_recv>:
  801087:	55                   	push   %ebp
  801088:	89 e5                	mov    %esp,%ebp
  80108a:	56                   	push   %esi
  80108b:	53                   	push   %ebx
  80108c:	8b 75 08             	mov    0x8(%ebp),%esi
  80108f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  801092:	83 ec 0c             	sub    $0xc,%esp
  801095:	ff 75 0c             	push   0xc(%ebp)
  801098:	e8 68 fb ff ff       	call   800c05 <sys_ipc_recv>
  80109d:	83 c4 10             	add    $0x10,%esp
  8010a0:	85 f6                	test   %esi,%esi
  8010a2:	74 14                	je     8010b8 <ipc_recv+0x31>
  8010a4:	ba 00 00 00 00       	mov    $0x0,%edx
  8010a9:	85 c0                	test   %eax,%eax
  8010ab:	75 09                	jne    8010b6 <ipc_recv+0x2f>
  8010ad:	8b 15 04 20 80 00    	mov    0x802004,%edx
  8010b3:	8b 52 74             	mov    0x74(%edx),%edx
  8010b6:	89 16                	mov    %edx,(%esi)
  8010b8:	85 db                	test   %ebx,%ebx
  8010ba:	74 25                	je     8010e1 <ipc_recv+0x5a>
  8010bc:	85 c0                	test   %eax,%eax
  8010be:	74 0d                	je     8010cd <ipc_recv+0x46>
  8010c0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8010c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8010c9:	5b                   	pop    %ebx
  8010ca:	5e                   	pop    %esi
  8010cb:	5d                   	pop    %ebp
  8010cc:	c3                   	ret
  8010cd:	a1 04 20 80 00       	mov    0x802004,%eax
  8010d2:	8b 40 78             	mov    0x78(%eax),%eax
  8010d5:	89 03                	mov    %eax,(%ebx)
  8010d7:	a1 04 20 80 00       	mov    0x802004,%eax
  8010dc:	8b 40 70             	mov    0x70(%eax),%eax
  8010df:	eb e5                	jmp    8010c6 <ipc_recv+0x3f>
  8010e1:	85 c0                	test   %eax,%eax
  8010e3:	75 e1                	jne    8010c6 <ipc_recv+0x3f>
  8010e5:	eb f0                	jmp    8010d7 <ipc_recv+0x50>

008010e7 <ipc_send>:
  8010e7:	55                   	push   %ebp
  8010e8:	89 e5                	mov    %esp,%ebp
  8010ea:	57                   	push   %edi
  8010eb:	56                   	push   %esi
  8010ec:	53                   	push   %ebx
  8010ed:	83 ec 0c             	sub    $0xc,%esp
  8010f0:	8b 75 0c             	mov    0xc(%ebp),%esi
  8010f3:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8010f6:	8b 7d 14             	mov    0x14(%ebp),%edi
  8010f9:	85 db                	test   %ebx,%ebx
  8010fb:	b8 00 00 c0 ee       	mov    $0xeec00000,%eax
  801100:	0f 44 d8             	cmove  %eax,%ebx
  801103:	57                   	push   %edi
  801104:	53                   	push   %ebx
  801105:	56                   	push   %esi
  801106:	ff 75 08             	push   0x8(%ebp)
  801109:	e8 d2 fa ff ff       	call   800be0 <sys_ipc_try_send>
  80110e:	83 c4 10             	add    $0x10,%esp
  801111:	eb 13                	jmp    801126 <ipc_send+0x3f>
  801113:	e8 ee f9 ff ff       	call   800b06 <sys_yield>
  801118:	57                   	push   %edi
  801119:	53                   	push   %ebx
  80111a:	56                   	push   %esi
  80111b:	ff 75 08             	push   0x8(%ebp)
  80111e:	e8 bd fa ff ff       	call   800be0 <sys_ipc_try_send>
  801123:	83 c4 10             	add    $0x10,%esp
  801126:	83 f8 f9             	cmp    $0xfffffff9,%eax
  801129:	74 e8                	je     801113 <ipc_send+0x2c>
  80112b:	85 c0                	test   %eax,%eax
  80112d:	78 08                	js     801137 <ipc_send+0x50>
  80112f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  801132:	5b                   	pop    %ebx
  801133:	5e                   	pop    %esi
  801134:	5f                   	pop    %edi
  801135:	5d                   	pop    %ebp
  801136:	c3                   	ret
  801137:	50                   	push   %eax
  801138:	68 4f 16 80 00       	push   $0x80164f
  80113d:	6a 3b                	push   $0x3b
  80113f:	68 5c 16 80 00       	push   $0x80165c
  801144:	e8 3f 00 00 00       	call   801188 <_panic>

00801149 <ipc_find_env>:
  801149:	55                   	push   %ebp
  80114a:	89 e5                	mov    %esp,%ebp
  80114c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80114f:	b8 00 00 00 00       	mov    $0x0,%eax
  801154:	69 d0 84 00 00 00    	imul   $0x84,%eax,%edx
  80115a:	81 c2 00 00 c0 ee    	add    $0xeec00000,%edx
  801160:	8b 52 50             	mov    0x50(%edx),%edx
  801163:	39 ca                	cmp    %ecx,%edx
  801165:	74 11                	je     801178 <ipc_find_env+0x2f>
  801167:	83 c0 01             	add    $0x1,%eax
  80116a:	3d 00 04 00 00       	cmp    $0x400,%eax
  80116f:	75 e3                	jne    801154 <ipc_find_env+0xb>
  801171:	b8 00 00 00 00       	mov    $0x0,%eax
  801176:	eb 0e                	jmp    801186 <ipc_find_env+0x3d>
  801178:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  80117e:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  801183:	8b 40 48             	mov    0x48(%eax),%eax
  801186:	5d                   	pop    %ebp
  801187:	c3                   	ret

00801188 <_panic>:
  801188:	55                   	push   %ebp
  801189:	89 e5                	mov    %esp,%ebp
  80118b:	56                   	push   %esi
  80118c:	53                   	push   %ebx
  80118d:	8d 5d 14             	lea    0x14(%ebp),%ebx
  801190:	8b 35 00 20 80 00    	mov    0x802000,%esi
  801196:	e8 47 f9 ff ff       	call   800ae2 <sys_getenvid>
  80119b:	83 ec 0c             	sub    $0xc,%esp
  80119e:	ff 75 0c             	push   0xc(%ebp)
  8011a1:	ff 75 08             	push   0x8(%ebp)
  8011a4:	56                   	push   %esi
  8011a5:	50                   	push   %eax
  8011a6:	68 58 19 80 00       	push   $0x801958
  8011ab:	e8 04 f0 ff ff       	call   8001b4 <cprintf>
  8011b0:	83 c4 18             	add    $0x18,%esp
  8011b3:	53                   	push   %ebx
  8011b4:	ff 75 10             	push   0x10(%ebp)
  8011b7:	e8 a7 ef ff ff       	call   800163 <vcprintf>
  8011bc:	c7 04 24 c7 14 80 00 	movl   $0x8014c7,(%esp)
  8011c3:	e8 ec ef ff ff       	call   8001b4 <cprintf>
  8011c8:	83 c4 10             	add    $0x10,%esp
  8011cb:	cc                   	int3
  8011cc:	eb fd                	jmp    8011cb <_panic+0x43>

008011ce <set_pgfault_handler>:
  8011ce:	55                   	push   %ebp
  8011cf:	89 e5                	mov    %esp,%ebp
  8011d1:	83 ec 08             	sub    $0x8,%esp
  8011d4:	83 3d 08 20 80 00 00 	cmpl   $0x0,0x802008
  8011db:	74 0a                	je     8011e7 <set_pgfault_handler+0x19>
  8011dd:	8b 45 08             	mov    0x8(%ebp),%eax
  8011e0:	a3 08 20 80 00       	mov    %eax,0x802008
  8011e5:	c9                   	leave
  8011e6:	c3                   	ret
  8011e7:	83 ec 04             	sub    $0x4,%esp
  8011ea:	6a 07                	push   $0x7
  8011ec:	68 00 f0 bf ee       	push   $0xeebff000
  8011f1:	6a 00                	push   $0x0
  8011f3:	e8 35 f9 ff ff       	call   800b2d <sys_page_alloc>
  8011f8:	83 c4 10             	add    $0x10,%esp
  8011fb:	85 c0                	test   %eax,%eax
  8011fd:	78 e6                	js     8011e5 <set_pgfault_handler+0x17>
  8011ff:	83 ec 08             	sub    $0x8,%esp
  801202:	68 17 12 80 00       	push   $0x801217
  801207:	6a 00                	push   $0x0
  801209:	e8 af f9 ff ff       	call   800bbd <sys_env_set_pgfault_upcall>
  80120e:	83 c4 10             	add    $0x10,%esp
  801211:	85 c0                	test   %eax,%eax
  801213:	79 c8                	jns    8011dd <set_pgfault_handler+0xf>
  801215:	eb ce                	jmp    8011e5 <set_pgfault_handler+0x17>

00801217 <_pgfault_upcall>:
  801217:	54                   	push   %esp
  801218:	a1 08 20 80 00       	mov    0x802008,%eax
  80121d:	ff d0                	call   *%eax
  80121f:	83 c4 04             	add    $0x4,%esp
  801222:	8b 44 24 28          	mov    0x28(%esp),%eax
  801226:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  80122a:	83 eb 04             	sub    $0x4,%ebx
  80122d:	89 03                	mov    %eax,(%ebx)
  80122f:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  801233:	58                   	pop    %eax
  801234:	58                   	pop    %eax
  801235:	61                   	popa
  801236:	83 c4 04             	add    $0x4,%esp
  801239:	9d                   	popf
  80123a:	5c                   	pop    %esp
  80123b:	c3                   	ret
  80123c:	66 90                	xchg   %ax,%ax
  80123e:	66 90                	xchg   %ax,%ax

00801240 <__udivdi3>:
  801240:	f3 0f 1e fb          	endbr32
  801244:	55                   	push   %ebp
  801245:	57                   	push   %edi
  801246:	56                   	push   %esi
  801247:	53                   	push   %ebx
  801248:	83 ec 1c             	sub    $0x1c,%esp
  80124b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  80124f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  801253:	8b 74 24 34          	mov    0x34(%esp),%esi
  801257:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  80125b:	85 c0                	test   %eax,%eax
  80125d:	75 19                	jne    801278 <__udivdi3+0x38>
  80125f:	39 de                	cmp    %ebx,%esi
  801261:	73 4d                	jae    8012b0 <__udivdi3+0x70>
  801263:	31 ff                	xor    %edi,%edi
  801265:	89 e8                	mov    %ebp,%eax
  801267:	89 f2                	mov    %esi,%edx
  801269:	f7 f3                	div    %ebx
  80126b:	89 fa                	mov    %edi,%edx
  80126d:	83 c4 1c             	add    $0x1c,%esp
  801270:	5b                   	pop    %ebx
  801271:	5e                   	pop    %esi
  801272:	5f                   	pop    %edi
  801273:	5d                   	pop    %ebp
  801274:	c3                   	ret
  801275:	8d 76 00             	lea    0x0(%esi),%esi
  801278:	39 c6                	cmp    %eax,%esi
  80127a:	73 14                	jae    801290 <__udivdi3+0x50>
  80127c:	31 ff                	xor    %edi,%edi
  80127e:	31 c0                	xor    %eax,%eax
  801280:	89 fa                	mov    %edi,%edx
  801282:	83 c4 1c             	add    $0x1c,%esp
  801285:	5b                   	pop    %ebx
  801286:	5e                   	pop    %esi
  801287:	5f                   	pop    %edi
  801288:	5d                   	pop    %ebp
  801289:	c3                   	ret
  80128a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  801290:	0f bd f8             	bsr    %eax,%edi
  801293:	83 f7 1f             	xor    $0x1f,%edi
  801296:	75 48                	jne    8012e0 <__udivdi3+0xa0>
  801298:	39 f0                	cmp    %esi,%eax
  80129a:	72 06                	jb     8012a2 <__udivdi3+0x62>
  80129c:	31 c0                	xor    %eax,%eax
  80129e:	39 dd                	cmp    %ebx,%ebp
  8012a0:	72 de                	jb     801280 <__udivdi3+0x40>
  8012a2:	b8 01 00 00 00       	mov    $0x1,%eax
  8012a7:	eb d7                	jmp    801280 <__udivdi3+0x40>
  8012a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8012b0:	89 d9                	mov    %ebx,%ecx
  8012b2:	85 db                	test   %ebx,%ebx
  8012b4:	75 0b                	jne    8012c1 <__udivdi3+0x81>
  8012b6:	b8 01 00 00 00       	mov    $0x1,%eax
  8012bb:	31 d2                	xor    %edx,%edx
  8012bd:	f7 f3                	div    %ebx
  8012bf:	89 c1                	mov    %eax,%ecx
  8012c1:	31 d2                	xor    %edx,%edx
  8012c3:	89 f0                	mov    %esi,%eax
  8012c5:	f7 f1                	div    %ecx
  8012c7:	89 c6                	mov    %eax,%esi
  8012c9:	89 e8                	mov    %ebp,%eax
  8012cb:	89 f7                	mov    %esi,%edi
  8012cd:	f7 f1                	div    %ecx
  8012cf:	89 fa                	mov    %edi,%edx
  8012d1:	83 c4 1c             	add    $0x1c,%esp
  8012d4:	5b                   	pop    %ebx
  8012d5:	5e                   	pop    %esi
  8012d6:	5f                   	pop    %edi
  8012d7:	5d                   	pop    %ebp
  8012d8:	c3                   	ret
  8012d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8012e0:	89 f9                	mov    %edi,%ecx
  8012e2:	ba 20 00 00 00       	mov    $0x20,%edx
  8012e7:	29 fa                	sub    %edi,%edx
  8012e9:	d3 e0                	shl    %cl,%eax
  8012eb:	89 44 24 08          	mov    %eax,0x8(%esp)
  8012ef:	89 d1                	mov    %edx,%ecx
  8012f1:	89 d8                	mov    %ebx,%eax
  8012f3:	d3 e8                	shr    %cl,%eax
  8012f5:	89 c1                	mov    %eax,%ecx
  8012f7:	8b 44 24 08          	mov    0x8(%esp),%eax
  8012fb:	09 c1                	or     %eax,%ecx
  8012fd:	89 f0                	mov    %esi,%eax
  8012ff:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  801303:	89 f9                	mov    %edi,%ecx
  801305:	d3 e3                	shl    %cl,%ebx
  801307:	89 d1                	mov    %edx,%ecx
  801309:	d3 e8                	shr    %cl,%eax
  80130b:	89 f9                	mov    %edi,%ecx
  80130d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  801311:	89 eb                	mov    %ebp,%ebx
  801313:	d3 e6                	shl    %cl,%esi
  801315:	89 d1                	mov    %edx,%ecx
  801317:	d3 eb                	shr    %cl,%ebx
  801319:	09 f3                	or     %esi,%ebx
  80131b:	89 c6                	mov    %eax,%esi
  80131d:	89 f2                	mov    %esi,%edx
  80131f:	89 d8                	mov    %ebx,%eax
  801321:	f7 74 24 08          	divl   0x8(%esp)
  801325:	89 d6                	mov    %edx,%esi
  801327:	89 c3                	mov    %eax,%ebx
  801329:	f7 64 24 0c          	mull   0xc(%esp)
  80132d:	39 d6                	cmp    %edx,%esi
  80132f:	72 1f                	jb     801350 <__udivdi3+0x110>
  801331:	89 f9                	mov    %edi,%ecx
  801333:	d3 e5                	shl    %cl,%ebp
  801335:	39 c5                	cmp    %eax,%ebp
  801337:	73 04                	jae    80133d <__udivdi3+0xfd>
  801339:	39 d6                	cmp    %edx,%esi
  80133b:	74 13                	je     801350 <__udivdi3+0x110>
  80133d:	89 d8                	mov    %ebx,%eax
  80133f:	31 ff                	xor    %edi,%edi
  801341:	e9 3a ff ff ff       	jmp    801280 <__udivdi3+0x40>
  801346:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80134d:	00 
  80134e:	66 90                	xchg   %ax,%ax
  801350:	8d 43 ff             	lea    -0x1(%ebx),%eax
  801353:	31 ff                	xor    %edi,%edi
  801355:	e9 26 ff ff ff       	jmp    801280 <__udivdi3+0x40>
  80135a:	66 90                	xchg   %ax,%ax
  80135c:	66 90                	xchg   %ax,%ax
  80135e:	66 90                	xchg   %ax,%ax

00801360 <__umoddi3>:
  801360:	f3 0f 1e fb          	endbr32
  801364:	55                   	push   %ebp
  801365:	57                   	push   %edi
  801366:	56                   	push   %esi
  801367:	53                   	push   %ebx
  801368:	83 ec 1c             	sub    $0x1c,%esp
  80136b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  80136f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  801373:	8b 74 24 30          	mov    0x30(%esp),%esi
  801377:	8b 7c 24 38          	mov    0x38(%esp),%edi
  80137b:	89 da                	mov    %ebx,%edx
  80137d:	85 c0                	test   %eax,%eax
  80137f:	75 17                	jne    801398 <__umoddi3+0x38>
  801381:	39 fb                	cmp    %edi,%ebx
  801383:	73 53                	jae    8013d8 <__umoddi3+0x78>
  801385:	89 f0                	mov    %esi,%eax
  801387:	f7 f7                	div    %edi
  801389:	89 d0                	mov    %edx,%eax
  80138b:	31 d2                	xor    %edx,%edx
  80138d:	83 c4 1c             	add    $0x1c,%esp
  801390:	5b                   	pop    %ebx
  801391:	5e                   	pop    %esi
  801392:	5f                   	pop    %edi
  801393:	5d                   	pop    %ebp
  801394:	c3                   	ret
  801395:	8d 76 00             	lea    0x0(%esi),%esi
  801398:	89 f1                	mov    %esi,%ecx
  80139a:	39 c3                	cmp    %eax,%ebx
  80139c:	73 12                	jae    8013b0 <__umoddi3+0x50>
  80139e:	89 f0                	mov    %esi,%eax
  8013a0:	83 c4 1c             	add    $0x1c,%esp
  8013a3:	5b                   	pop    %ebx
  8013a4:	5e                   	pop    %esi
  8013a5:	5f                   	pop    %edi
  8013a6:	5d                   	pop    %ebp
  8013a7:	c3                   	ret
  8013a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8013af:	00 
  8013b0:	0f bd e8             	bsr    %eax,%ebp
  8013b3:	83 f5 1f             	xor    $0x1f,%ebp
  8013b6:	75 48                	jne    801400 <__umoddi3+0xa0>
  8013b8:	39 d8                	cmp    %ebx,%eax
  8013ba:	0f 82 d0 00 00 00    	jb     801490 <__umoddi3+0x130>
  8013c0:	39 fe                	cmp    %edi,%esi
  8013c2:	0f 83 c8 00 00 00    	jae    801490 <__umoddi3+0x130>
  8013c8:	89 c8                	mov    %ecx,%eax
  8013ca:	83 c4 1c             	add    $0x1c,%esp
  8013cd:	5b                   	pop    %ebx
  8013ce:	5e                   	pop    %esi
  8013cf:	5f                   	pop    %edi
  8013d0:	5d                   	pop    %ebp
  8013d1:	c3                   	ret
  8013d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8013d8:	89 f9                	mov    %edi,%ecx
  8013da:	85 ff                	test   %edi,%edi
  8013dc:	75 0b                	jne    8013e9 <__umoddi3+0x89>
  8013de:	b8 01 00 00 00       	mov    $0x1,%eax
  8013e3:	31 d2                	xor    %edx,%edx
  8013e5:	f7 f7                	div    %edi
  8013e7:	89 c1                	mov    %eax,%ecx
  8013e9:	89 d8                	mov    %ebx,%eax
  8013eb:	31 d2                	xor    %edx,%edx
  8013ed:	f7 f1                	div    %ecx
  8013ef:	89 f0                	mov    %esi,%eax
  8013f1:	f7 f1                	div    %ecx
  8013f3:	89 d0                	mov    %edx,%eax
  8013f5:	31 d2                	xor    %edx,%edx
  8013f7:	eb 94                	jmp    80138d <__umoddi3+0x2d>
  8013f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801400:	89 e9                	mov    %ebp,%ecx
  801402:	ba 20 00 00 00       	mov    $0x20,%edx
  801407:	29 ea                	sub    %ebp,%edx
  801409:	d3 e0                	shl    %cl,%eax
  80140b:	89 44 24 08          	mov    %eax,0x8(%esp)
  80140f:	89 d1                	mov    %edx,%ecx
  801411:	89 f8                	mov    %edi,%eax
  801413:	d3 e8                	shr    %cl,%eax
  801415:	89 54 24 04          	mov    %edx,0x4(%esp)
  801419:	8b 54 24 04          	mov    0x4(%esp),%edx
  80141d:	89 c1                	mov    %eax,%ecx
  80141f:	8b 44 24 08          	mov    0x8(%esp),%eax
  801423:	09 c1                	or     %eax,%ecx
  801425:	89 d8                	mov    %ebx,%eax
  801427:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  80142b:	89 e9                	mov    %ebp,%ecx
  80142d:	d3 e7                	shl    %cl,%edi
  80142f:	89 d1                	mov    %edx,%ecx
  801431:	d3 e8                	shr    %cl,%eax
  801433:	89 e9                	mov    %ebp,%ecx
  801435:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  801439:	d3 e3                	shl    %cl,%ebx
  80143b:	89 c7                	mov    %eax,%edi
  80143d:	89 d1                	mov    %edx,%ecx
  80143f:	89 f0                	mov    %esi,%eax
  801441:	d3 e8                	shr    %cl,%eax
  801443:	89 fa                	mov    %edi,%edx
  801445:	89 e9                	mov    %ebp,%ecx
  801447:	09 d8                	or     %ebx,%eax
  801449:	d3 e6                	shl    %cl,%esi
  80144b:	f7 74 24 08          	divl   0x8(%esp)
  80144f:	89 d3                	mov    %edx,%ebx
  801451:	f7 64 24 0c          	mull   0xc(%esp)
  801455:	89 c7                	mov    %eax,%edi
  801457:	89 d1                	mov    %edx,%ecx
  801459:	39 d3                	cmp    %edx,%ebx
  80145b:	72 06                	jb     801463 <__umoddi3+0x103>
  80145d:	75 10                	jne    80146f <__umoddi3+0x10f>
  80145f:	39 c6                	cmp    %eax,%esi
  801461:	73 0c                	jae    80146f <__umoddi3+0x10f>
  801463:	2b 44 24 0c          	sub    0xc(%esp),%eax
  801467:	1b 54 24 08          	sbb    0x8(%esp),%edx
  80146b:	89 d1                	mov    %edx,%ecx
  80146d:	89 c7                	mov    %eax,%edi
  80146f:	89 f2                	mov    %esi,%edx
  801471:	29 fa                	sub    %edi,%edx
  801473:	19 cb                	sbb    %ecx,%ebx
  801475:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  80147a:	89 d8                	mov    %ebx,%eax
  80147c:	d3 e0                	shl    %cl,%eax
  80147e:	89 e9                	mov    %ebp,%ecx
  801480:	d3 ea                	shr    %cl,%edx
  801482:	d3 eb                	shr    %cl,%ebx
  801484:	09 d0                	or     %edx,%eax
  801486:	89 da                	mov    %ebx,%edx
  801488:	83 c4 1c             	add    $0x1c,%esp
  80148b:	5b                   	pop    %ebx
  80148c:	5e                   	pop    %esi
  80148d:	5f                   	pop    %edi
  80148e:	5d                   	pop    %ebp
  80148f:	c3                   	ret
  801490:	89 da                	mov    %ebx,%edx
  801492:	89 f1                	mov    %esi,%ecx
  801494:	29 f9                	sub    %edi,%ecx
  801496:	19 c2                	sbb    %eax,%edx
  801498:	89 c8                	mov    %ecx,%eax
  80149a:	e9 2b ff ff ff       	jmp    8013ca <__umoddi3+0x6a>
