
obj/user/testbss:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 ab 00 00 00       	call   8000dc <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 14             	sub    $0x14,%esp
  800039:	68 00 0f 80 00       	push   $0x800f00
  80003e:	e8 d3 01 00 00       	call   800216 <cprintf>
  800043:	83 c4 10             	add    $0x10,%esp
  800046:	b8 00 00 00 00       	mov    $0x0,%eax
  80004b:	83 3c 85 20 20 80 00 	cmpl   $0x0,0x802020(,%eax,4)
  800052:	00 
  800053:	75 63                	jne    8000b8 <umain+0x85>
  800055:	83 c0 01             	add    $0x1,%eax
  800058:	3d 00 00 10 00       	cmp    $0x100000,%eax
  80005d:	75 ec                	jne    80004b <umain+0x18>
  80005f:	b8 00 00 00 00       	mov    $0x0,%eax
  800064:	89 04 85 20 20 80 00 	mov    %eax,0x802020(,%eax,4)
  80006b:	83 c0 01             	add    $0x1,%eax
  80006e:	3d 00 00 10 00       	cmp    $0x100000,%eax
  800073:	75 ef                	jne    800064 <umain+0x31>
  800075:	b8 00 00 00 00       	mov    $0x0,%eax
  80007a:	39 04 85 20 20 80 00 	cmp    %eax,0x802020(,%eax,4)
  800081:	75 47                	jne    8000ca <umain+0x97>
  800083:	83 c0 01             	add    $0x1,%eax
  800086:	3d 00 00 10 00       	cmp    $0x100000,%eax
  80008b:	75 ed                	jne    80007a <umain+0x47>
  80008d:	83 ec 0c             	sub    $0xc,%esp
  800090:	68 48 0f 80 00       	push   $0x800f48
  800095:	e8 7c 01 00 00       	call   800216 <cprintf>
  80009a:	c7 05 20 30 c0 00 00 	movl   $0x0,0xc03020
  8000a1:	00 00 00 
  8000a4:	83 c4 0c             	add    $0xc,%esp
  8000a7:	68 cb 0f 80 00       	push   $0x800fcb
  8000ac:	6a 1a                	push   $0x1a
  8000ae:	68 bc 0f 80 00       	push   $0x800fbc
  8000b3:	e8 83 00 00 00       	call   80013b <_panic>
  8000b8:	50                   	push   %eax
  8000b9:	68 9f 0f 80 00       	push   $0x800f9f
  8000be:	6a 11                	push   $0x11
  8000c0:	68 bc 0f 80 00       	push   $0x800fbc
  8000c5:	e8 71 00 00 00       	call   80013b <_panic>
  8000ca:	50                   	push   %eax
  8000cb:	68 20 0f 80 00       	push   $0x800f20
  8000d0:	6a 16                	push   $0x16
  8000d2:	68 bc 0f 80 00       	push   $0x800fbc
  8000d7:	e8 5f 00 00 00       	call   80013b <_panic>

008000dc <libmain>:
  8000dc:	55                   	push   %ebp
  8000dd:	89 e5                	mov    %esp,%ebp
  8000df:	56                   	push   %esi
  8000e0:	53                   	push   %ebx
  8000e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000e4:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000e7:	e8 58 0a 00 00       	call   800b44 <sys_getenvid>
  8000ec:	85 c0                	test   %eax,%eax
  8000ee:	78 15                	js     800105 <libmain+0x29>
  8000f0:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000f5:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8000fb:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800100:	a3 20 20 c0 00       	mov    %eax,0xc02020
  800105:	85 db                	test   %ebx,%ebx
  800107:	7e 07                	jle    800110 <libmain+0x34>
  800109:	8b 06                	mov    (%esi),%eax
  80010b:	a3 00 20 80 00       	mov    %eax,0x802000
  800110:	83 ec 08             	sub    $0x8,%esp
  800113:	56                   	push   %esi
  800114:	53                   	push   %ebx
  800115:	e8 19 ff ff ff       	call   800033 <umain>
  80011a:	e8 0a 00 00 00       	call   800129 <exit>
  80011f:	83 c4 10             	add    $0x10,%esp
  800122:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800125:	5b                   	pop    %ebx
  800126:	5e                   	pop    %esi
  800127:	5d                   	pop    %ebp
  800128:	c3                   	ret

00800129 <exit>:
  800129:	55                   	push   %ebp
  80012a:	89 e5                	mov    %esp,%ebp
  80012c:	83 ec 14             	sub    $0x14,%esp
  80012f:	6a 00                	push   $0x0
  800131:	e8 ec 09 00 00       	call   800b22 <sys_env_destroy>
  800136:	83 c4 10             	add    $0x10,%esp
  800139:	c9                   	leave
  80013a:	c3                   	ret

0080013b <_panic>:
  80013b:	55                   	push   %ebp
  80013c:	89 e5                	mov    %esp,%ebp
  80013e:	56                   	push   %esi
  80013f:	53                   	push   %ebx
  800140:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800143:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800149:	e8 f6 09 00 00       	call   800b44 <sys_getenvid>
  80014e:	83 ec 0c             	sub    $0xc,%esp
  800151:	ff 75 0c             	push   0xc(%ebp)
  800154:	ff 75 08             	push   0x8(%ebp)
  800157:	56                   	push   %esi
  800158:	50                   	push   %eax
  800159:	68 7c 0f 80 00       	push   $0x800f7c
  80015e:	e8 b3 00 00 00       	call   800216 <cprintf>
  800163:	83 c4 18             	add    $0x18,%esp
  800166:	53                   	push   %ebx
  800167:	ff 75 10             	push   0x10(%ebp)
  80016a:	e8 56 00 00 00       	call   8001c5 <vcprintf>
  80016f:	c7 04 24 ba 0f 80 00 	movl   $0x800fba,(%esp)
  800176:	e8 9b 00 00 00       	call   800216 <cprintf>
  80017b:	83 c4 10             	add    $0x10,%esp
  80017e:	cc                   	int3
  80017f:	eb fd                	jmp    80017e <_panic+0x43>

00800181 <putch>:
  800181:	55                   	push   %ebp
  800182:	89 e5                	mov    %esp,%ebp
  800184:	53                   	push   %ebx
  800185:	83 ec 04             	sub    $0x4,%esp
  800188:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80018b:	8b 13                	mov    (%ebx),%edx
  80018d:	8d 42 01             	lea    0x1(%edx),%eax
  800190:	89 03                	mov    %eax,(%ebx)
  800192:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800195:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800199:	3d ff 00 00 00       	cmp    $0xff,%eax
  80019e:	74 09                	je     8001a9 <putch+0x28>
  8001a0:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8001a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8001a7:	c9                   	leave
  8001a8:	c3                   	ret
  8001a9:	83 ec 08             	sub    $0x8,%esp
  8001ac:	68 ff 00 00 00       	push   $0xff
  8001b1:	8d 43 08             	lea    0x8(%ebx),%eax
  8001b4:	50                   	push   %eax
  8001b5:	e8 1e 09 00 00       	call   800ad8 <sys_cputs>
  8001ba:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8001c0:	83 c4 10             	add    $0x10,%esp
  8001c3:	eb db                	jmp    8001a0 <putch+0x1f>

008001c5 <vcprintf>:
  8001c5:	55                   	push   %ebp
  8001c6:	89 e5                	mov    %esp,%ebp
  8001c8:	81 ec 18 01 00 00    	sub    $0x118,%esp
  8001ce:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  8001d5:	00 00 00 
  8001d8:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  8001df:	00 00 00 
  8001e2:	ff 75 0c             	push   0xc(%ebp)
  8001e5:	ff 75 08             	push   0x8(%ebp)
  8001e8:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  8001ee:	50                   	push   %eax
  8001ef:	68 81 01 80 00       	push   $0x800181
  8001f4:	e8 74 01 00 00       	call   80036d <vprintfmt>
  8001f9:	83 c4 08             	add    $0x8,%esp
  8001fc:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800202:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800208:	50                   	push   %eax
  800209:	e8 ca 08 00 00       	call   800ad8 <sys_cputs>
  80020e:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800214:	c9                   	leave
  800215:	c3                   	ret

00800216 <cprintf>:
  800216:	55                   	push   %ebp
  800217:	89 e5                	mov    %esp,%ebp
  800219:	83 ec 10             	sub    $0x10,%esp
  80021c:	8d 45 0c             	lea    0xc(%ebp),%eax
  80021f:	50                   	push   %eax
  800220:	ff 75 08             	push   0x8(%ebp)
  800223:	e8 9d ff ff ff       	call   8001c5 <vcprintf>
  800228:	c9                   	leave
  800229:	c3                   	ret

0080022a <printnum>:
  80022a:	55                   	push   %ebp
  80022b:	89 e5                	mov    %esp,%ebp
  80022d:	57                   	push   %edi
  80022e:	56                   	push   %esi
  80022f:	53                   	push   %ebx
  800230:	83 ec 1c             	sub    $0x1c,%esp
  800233:	89 c7                	mov    %eax,%edi
  800235:	89 d6                	mov    %edx,%esi
  800237:	8b 45 08             	mov    0x8(%ebp),%eax
  80023a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80023d:	89 d1                	mov    %edx,%ecx
  80023f:	89 c2                	mov    %eax,%edx
  800241:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800244:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800247:	8b 45 10             	mov    0x10(%ebp),%eax
  80024a:	8b 5d 14             	mov    0x14(%ebp),%ebx
  80024d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800250:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800257:	39 c2                	cmp    %eax,%edx
  800259:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  80025c:	72 3e                	jb     80029c <printnum+0x72>
  80025e:	83 ec 0c             	sub    $0xc,%esp
  800261:	ff 75 18             	push   0x18(%ebp)
  800264:	83 eb 01             	sub    $0x1,%ebx
  800267:	53                   	push   %ebx
  800268:	50                   	push   %eax
  800269:	83 ec 08             	sub    $0x8,%esp
  80026c:	ff 75 e4             	push   -0x1c(%ebp)
  80026f:	ff 75 e0             	push   -0x20(%ebp)
  800272:	ff 75 dc             	push   -0x24(%ebp)
  800275:	ff 75 d8             	push   -0x28(%ebp)
  800278:	e8 13 0a 00 00       	call   800c90 <__udivdi3>
  80027d:	83 c4 18             	add    $0x18,%esp
  800280:	52                   	push   %edx
  800281:	50                   	push   %eax
  800282:	89 f2                	mov    %esi,%edx
  800284:	89 f8                	mov    %edi,%eax
  800286:	e8 9f ff ff ff       	call   80022a <printnum>
  80028b:	83 c4 20             	add    $0x20,%esp
  80028e:	eb 13                	jmp    8002a3 <printnum+0x79>
  800290:	83 ec 08             	sub    $0x8,%esp
  800293:	56                   	push   %esi
  800294:	ff 75 18             	push   0x18(%ebp)
  800297:	ff d7                	call   *%edi
  800299:	83 c4 10             	add    $0x10,%esp
  80029c:	83 eb 01             	sub    $0x1,%ebx
  80029f:	85 db                	test   %ebx,%ebx
  8002a1:	7f ed                	jg     800290 <printnum+0x66>
  8002a3:	83 ec 08             	sub    $0x8,%esp
  8002a6:	56                   	push   %esi
  8002a7:	83 ec 04             	sub    $0x4,%esp
  8002aa:	ff 75 e4             	push   -0x1c(%ebp)
  8002ad:	ff 75 e0             	push   -0x20(%ebp)
  8002b0:	ff 75 dc             	push   -0x24(%ebp)
  8002b3:	ff 75 d8             	push   -0x28(%ebp)
  8002b6:	e8 f5 0a 00 00       	call   800db0 <__umoddi3>
  8002bb:	83 c4 14             	add    $0x14,%esp
  8002be:	0f be 80 ec 0f 80 00 	movsbl 0x800fec(%eax),%eax
  8002c5:	50                   	push   %eax
  8002c6:	ff d7                	call   *%edi
  8002c8:	83 c4 10             	add    $0x10,%esp
  8002cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002ce:	5b                   	pop    %ebx
  8002cf:	5e                   	pop    %esi
  8002d0:	5f                   	pop    %edi
  8002d1:	5d                   	pop    %ebp
  8002d2:	c3                   	ret

008002d3 <getuint>:
  8002d3:	83 fa 01             	cmp    $0x1,%edx
  8002d6:	7f 13                	jg     8002eb <getuint+0x18>
  8002d8:	85 d2                	test   %edx,%edx
  8002da:	74 1c                	je     8002f8 <getuint+0x25>
  8002dc:	8b 10                	mov    (%eax),%edx
  8002de:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002e1:	89 08                	mov    %ecx,(%eax)
  8002e3:	8b 02                	mov    (%edx),%eax
  8002e5:	ba 00 00 00 00       	mov    $0x0,%edx
  8002ea:	c3                   	ret
  8002eb:	8b 10                	mov    (%eax),%edx
  8002ed:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002f0:	89 08                	mov    %ecx,(%eax)
  8002f2:	8b 02                	mov    (%edx),%eax
  8002f4:	8b 52 04             	mov    0x4(%edx),%edx
  8002f7:	c3                   	ret
  8002f8:	8b 10                	mov    (%eax),%edx
  8002fa:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002fd:	89 08                	mov    %ecx,(%eax)
  8002ff:	8b 02                	mov    (%edx),%eax
  800301:	ba 00 00 00 00       	mov    $0x0,%edx
  800306:	c3                   	ret

00800307 <getint>:
  800307:	83 fa 01             	cmp    $0x1,%edx
  80030a:	7f 0f                	jg     80031b <getint+0x14>
  80030c:	85 d2                	test   %edx,%edx
  80030e:	74 18                	je     800328 <getint+0x21>
  800310:	8b 10                	mov    (%eax),%edx
  800312:	8d 4a 04             	lea    0x4(%edx),%ecx
  800315:	89 08                	mov    %ecx,(%eax)
  800317:	8b 02                	mov    (%edx),%eax
  800319:	99                   	cltd
  80031a:	c3                   	ret
  80031b:	8b 10                	mov    (%eax),%edx
  80031d:	8d 4a 08             	lea    0x8(%edx),%ecx
  800320:	89 08                	mov    %ecx,(%eax)
  800322:	8b 02                	mov    (%edx),%eax
  800324:	8b 52 04             	mov    0x4(%edx),%edx
  800327:	c3                   	ret
  800328:	8b 10                	mov    (%eax),%edx
  80032a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80032d:	89 08                	mov    %ecx,(%eax)
  80032f:	8b 02                	mov    (%edx),%eax
  800331:	99                   	cltd
  800332:	c3                   	ret

00800333 <sprintputch>:
  800333:	55                   	push   %ebp
  800334:	89 e5                	mov    %esp,%ebp
  800336:	8b 45 0c             	mov    0xc(%ebp),%eax
  800339:	83 40 08 01          	addl   $0x1,0x8(%eax)
  80033d:	8b 10                	mov    (%eax),%edx
  80033f:	3b 50 04             	cmp    0x4(%eax),%edx
  800342:	73 0a                	jae    80034e <sprintputch+0x1b>
  800344:	8d 4a 01             	lea    0x1(%edx),%ecx
  800347:	89 08                	mov    %ecx,(%eax)
  800349:	8b 45 08             	mov    0x8(%ebp),%eax
  80034c:	88 02                	mov    %al,(%edx)
  80034e:	5d                   	pop    %ebp
  80034f:	c3                   	ret

00800350 <printfmt>:
  800350:	55                   	push   %ebp
  800351:	89 e5                	mov    %esp,%ebp
  800353:	83 ec 08             	sub    $0x8,%esp
  800356:	8d 45 14             	lea    0x14(%ebp),%eax
  800359:	50                   	push   %eax
  80035a:	ff 75 10             	push   0x10(%ebp)
  80035d:	ff 75 0c             	push   0xc(%ebp)
  800360:	ff 75 08             	push   0x8(%ebp)
  800363:	e8 05 00 00 00       	call   80036d <vprintfmt>
  800368:	83 c4 10             	add    $0x10,%esp
  80036b:	c9                   	leave
  80036c:	c3                   	ret

0080036d <vprintfmt>:
  80036d:	55                   	push   %ebp
  80036e:	89 e5                	mov    %esp,%ebp
  800370:	57                   	push   %edi
  800371:	56                   	push   %esi
  800372:	53                   	push   %ebx
  800373:	83 ec 2c             	sub    $0x2c,%esp
  800376:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800379:	8b 75 0c             	mov    0xc(%ebp),%esi
  80037c:	8b 7d 10             	mov    0x10(%ebp),%edi
  80037f:	eb 0a                	jmp    80038b <vprintfmt+0x1e>
  800381:	83 ec 08             	sub    $0x8,%esp
  800384:	56                   	push   %esi
  800385:	50                   	push   %eax
  800386:	ff d3                	call   *%ebx
  800388:	83 c4 10             	add    $0x10,%esp
  80038b:	83 c7 01             	add    $0x1,%edi
  80038e:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800392:	83 f8 25             	cmp    $0x25,%eax
  800395:	74 0c                	je     8003a3 <vprintfmt+0x36>
  800397:	85 c0                	test   %eax,%eax
  800399:	75 e6                	jne    800381 <vprintfmt+0x14>
  80039b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80039e:	5b                   	pop    %ebx
  80039f:	5e                   	pop    %esi
  8003a0:	5f                   	pop    %edi
  8003a1:	5d                   	pop    %ebp
  8003a2:	c3                   	ret
  8003a3:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8003a7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  8003ae:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003b5:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  8003bc:	b9 00 00 00 00       	mov    $0x0,%ecx
  8003c1:	8d 47 01             	lea    0x1(%edi),%eax
  8003c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8003c7:	0f b6 17             	movzbl (%edi),%edx
  8003ca:	8d 42 dd             	lea    -0x23(%edx),%eax
  8003cd:	3c 55                	cmp    $0x55,%al
  8003cf:	0f 87 c3 02 00 00    	ja     800698 <vprintfmt+0x32b>
  8003d5:	0f b6 c0             	movzbl %al,%eax
  8003d8:	ff 24 85 e0 10 80 00 	jmp    *0x8010e0(,%eax,4)
  8003df:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003e2:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  8003e6:	eb d9                	jmp    8003c1 <vprintfmt+0x54>
  8003e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003eb:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  8003ef:	eb d0                	jmp    8003c1 <vprintfmt+0x54>
  8003f1:	0f b6 d2             	movzbl %dl,%edx
  8003f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8003fc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  8003ff:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800402:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800406:	0f be 17             	movsbl (%edi),%edx
  800409:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80040c:	83 f9 09             	cmp    $0x9,%ecx
  80040f:	77 52                	ja     800463 <vprintfmt+0xf6>
  800411:	83 c7 01             	add    $0x1,%edi
  800414:	eb e9                	jmp    8003ff <vprintfmt+0x92>
  800416:	8b 45 14             	mov    0x14(%ebp),%eax
  800419:	8d 50 04             	lea    0x4(%eax),%edx
  80041c:	89 55 14             	mov    %edx,0x14(%ebp)
  80041f:	8b 00                	mov    (%eax),%eax
  800421:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800424:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800427:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80042b:	79 94                	jns    8003c1 <vprintfmt+0x54>
  80042d:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800430:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800433:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80043a:	eb 85                	jmp    8003c1 <vprintfmt+0x54>
  80043c:	8b 55 e0             	mov    -0x20(%ebp),%edx
  80043f:	85 d2                	test   %edx,%edx
  800441:	b8 00 00 00 00       	mov    $0x0,%eax
  800446:	0f 49 c2             	cmovns %edx,%eax
  800449:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80044c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80044f:	e9 6d ff ff ff       	jmp    8003c1 <vprintfmt+0x54>
  800454:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800457:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  80045e:	e9 5e ff ff ff       	jmp    8003c1 <vprintfmt+0x54>
  800463:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  800466:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800469:	eb bc                	jmp    800427 <vprintfmt+0xba>
  80046b:	83 c1 01             	add    $0x1,%ecx
  80046e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800471:	e9 4b ff ff ff       	jmp    8003c1 <vprintfmt+0x54>
  800476:	8b 45 14             	mov    0x14(%ebp),%eax
  800479:	8d 50 04             	lea    0x4(%eax),%edx
  80047c:	89 55 14             	mov    %edx,0x14(%ebp)
  80047f:	83 ec 08             	sub    $0x8,%esp
  800482:	56                   	push   %esi
  800483:	ff 30                	push   (%eax)
  800485:	ff d3                	call   *%ebx
  800487:	83 c4 10             	add    $0x10,%esp
  80048a:	e9 a0 01 00 00       	jmp    80062f <vprintfmt+0x2c2>
  80048f:	8b 45 14             	mov    0x14(%ebp),%eax
  800492:	8d 50 04             	lea    0x4(%eax),%edx
  800495:	89 55 14             	mov    %edx,0x14(%ebp)
  800498:	8b 10                	mov    (%eax),%edx
  80049a:	89 d0                	mov    %edx,%eax
  80049c:	f7 d8                	neg    %eax
  80049e:	0f 48 c2             	cmovs  %edx,%eax
  8004a1:	83 f8 08             	cmp    $0x8,%eax
  8004a4:	7f 20                	jg     8004c6 <vprintfmt+0x159>
  8004a6:	8b 14 85 40 12 80 00 	mov    0x801240(,%eax,4),%edx
  8004ad:	85 d2                	test   %edx,%edx
  8004af:	74 15                	je     8004c6 <vprintfmt+0x159>
  8004b1:	52                   	push   %edx
  8004b2:	68 0d 10 80 00       	push   $0x80100d
  8004b7:	56                   	push   %esi
  8004b8:	53                   	push   %ebx
  8004b9:	e8 92 fe ff ff       	call   800350 <printfmt>
  8004be:	83 c4 10             	add    $0x10,%esp
  8004c1:	e9 69 01 00 00       	jmp    80062f <vprintfmt+0x2c2>
  8004c6:	50                   	push   %eax
  8004c7:	68 04 10 80 00       	push   $0x801004
  8004cc:	56                   	push   %esi
  8004cd:	53                   	push   %ebx
  8004ce:	e8 7d fe ff ff       	call   800350 <printfmt>
  8004d3:	83 c4 10             	add    $0x10,%esp
  8004d6:	e9 54 01 00 00       	jmp    80062f <vprintfmt+0x2c2>
  8004db:	8b 45 14             	mov    0x14(%ebp),%eax
  8004de:	8d 50 04             	lea    0x4(%eax),%edx
  8004e1:	89 55 14             	mov    %edx,0x14(%ebp)
  8004e4:	8b 08                	mov    (%eax),%ecx
  8004e6:	85 c9                	test   %ecx,%ecx
  8004e8:	b8 fd 0f 80 00       	mov    $0x800ffd,%eax
  8004ed:	0f 45 c1             	cmovne %ecx,%eax
  8004f0:	89 45 cc             	mov    %eax,-0x34(%ebp)
  8004f3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8004f7:	7e 06                	jle    8004ff <vprintfmt+0x192>
  8004f9:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  8004fd:	75 0b                	jne    80050a <vprintfmt+0x19d>
  8004ff:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800502:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800505:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800508:	eb 5c                	jmp    800566 <vprintfmt+0x1f9>
  80050a:	83 ec 08             	sub    $0x8,%esp
  80050d:	ff 75 d0             	push   -0x30(%ebp)
  800510:	ff 75 cc             	push   -0x34(%ebp)
  800513:	e8 20 02 00 00       	call   800738 <strnlen>
  800518:	89 c2                	mov    %eax,%edx
  80051a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80051d:	29 d0                	sub    %edx,%eax
  80051f:	83 c4 10             	add    $0x10,%esp
  800522:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800526:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800529:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80052c:	89 c3                	mov    %eax,%ebx
  80052e:	eb 0e                	jmp    80053e <vprintfmt+0x1d1>
  800530:	83 ec 08             	sub    $0x8,%esp
  800533:	56                   	push   %esi
  800534:	57                   	push   %edi
  800535:	ff 55 08             	call   *0x8(%ebp)
  800538:	83 eb 01             	sub    $0x1,%ebx
  80053b:	83 c4 10             	add    $0x10,%esp
  80053e:	85 db                	test   %ebx,%ebx
  800540:	7f ee                	jg     800530 <vprintfmt+0x1c3>
  800542:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800545:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800548:	85 c0                	test   %eax,%eax
  80054a:	ba 00 00 00 00       	mov    $0x0,%edx
  80054f:	0f 49 d0             	cmovns %eax,%edx
  800552:	29 d0                	sub    %edx,%eax
  800554:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800557:	eb a6                	jmp    8004ff <vprintfmt+0x192>
  800559:	83 ec 08             	sub    $0x8,%esp
  80055c:	56                   	push   %esi
  80055d:	52                   	push   %edx
  80055e:	ff 55 08             	call   *0x8(%ebp)
  800561:	83 c4 10             	add    $0x10,%esp
  800564:	89 d9                	mov    %ebx,%ecx
  800566:	8d 59 01             	lea    0x1(%ecx),%ebx
  800569:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  80056d:	0f be d0             	movsbl %al,%edx
  800570:	85 d2                	test   %edx,%edx
  800572:	74 28                	je     80059c <vprintfmt+0x22f>
  800574:	85 ff                	test   %edi,%edi
  800576:	78 05                	js     80057d <vprintfmt+0x210>
  800578:	83 ef 01             	sub    $0x1,%edi
  80057b:	78 2e                	js     8005ab <vprintfmt+0x23e>
  80057d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800581:	74 d6                	je     800559 <vprintfmt+0x1ec>
  800583:	0f be c0             	movsbl %al,%eax
  800586:	83 e8 20             	sub    $0x20,%eax
  800589:	83 f8 5e             	cmp    $0x5e,%eax
  80058c:	76 cb                	jbe    800559 <vprintfmt+0x1ec>
  80058e:	83 ec 08             	sub    $0x8,%esp
  800591:	56                   	push   %esi
  800592:	6a 3f                	push   $0x3f
  800594:	ff 55 08             	call   *0x8(%ebp)
  800597:	83 c4 10             	add    $0x10,%esp
  80059a:	eb c8                	jmp    800564 <vprintfmt+0x1f7>
  80059c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80059f:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8005a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8005a5:	01 c7                	add    %eax,%edi
  8005a7:	29 cf                	sub    %ecx,%edi
  8005a9:	eb 13                	jmp    8005be <vprintfmt+0x251>
  8005ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8005ae:	eb ef                	jmp    80059f <vprintfmt+0x232>
  8005b0:	83 ec 08             	sub    $0x8,%esp
  8005b3:	56                   	push   %esi
  8005b4:	6a 20                	push   $0x20
  8005b6:	ff d3                	call   *%ebx
  8005b8:	83 ef 01             	sub    $0x1,%edi
  8005bb:	83 c4 10             	add    $0x10,%esp
  8005be:	85 ff                	test   %edi,%edi
  8005c0:	7f ee                	jg     8005b0 <vprintfmt+0x243>
  8005c2:	eb 6b                	jmp    80062f <vprintfmt+0x2c2>
  8005c4:	89 ca                	mov    %ecx,%edx
  8005c6:	8d 45 14             	lea    0x14(%ebp),%eax
  8005c9:	e8 39 fd ff ff       	call   800307 <getint>
  8005ce:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8005d1:	89 55 dc             	mov    %edx,-0x24(%ebp)
  8005d4:	85 d2                	test   %edx,%edx
  8005d6:	78 0b                	js     8005e3 <vprintfmt+0x276>
  8005d8:	89 d1                	mov    %edx,%ecx
  8005da:	89 c2                	mov    %eax,%edx
  8005dc:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005e1:	eb 32                	jmp    800615 <vprintfmt+0x2a8>
  8005e3:	83 ec 08             	sub    $0x8,%esp
  8005e6:	56                   	push   %esi
  8005e7:	6a 2d                	push   $0x2d
  8005e9:	ff d3                	call   *%ebx
  8005eb:	8b 55 d8             	mov    -0x28(%ebp),%edx
  8005ee:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  8005f1:	f7 da                	neg    %edx
  8005f3:	83 d1 00             	adc    $0x0,%ecx
  8005f6:	f7 d9                	neg    %ecx
  8005f8:	83 c4 10             	add    $0x10,%esp
  8005fb:	bf 0a 00 00 00       	mov    $0xa,%edi
  800600:	eb 13                	jmp    800615 <vprintfmt+0x2a8>
  800602:	89 ca                	mov    %ecx,%edx
  800604:	8d 45 14             	lea    0x14(%ebp),%eax
  800607:	e8 c7 fc ff ff       	call   8002d3 <getuint>
  80060c:	89 d1                	mov    %edx,%ecx
  80060e:	89 c2                	mov    %eax,%edx
  800610:	bf 0a 00 00 00       	mov    $0xa,%edi
  800615:	83 ec 0c             	sub    $0xc,%esp
  800618:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80061c:	50                   	push   %eax
  80061d:	ff 75 e0             	push   -0x20(%ebp)
  800620:	57                   	push   %edi
  800621:	51                   	push   %ecx
  800622:	52                   	push   %edx
  800623:	89 f2                	mov    %esi,%edx
  800625:	89 d8                	mov    %ebx,%eax
  800627:	e8 fe fb ff ff       	call   80022a <printnum>
  80062c:	83 c4 20             	add    $0x20,%esp
  80062f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800632:	e9 54 fd ff ff       	jmp    80038b <vprintfmt+0x1e>
  800637:	89 ca                	mov    %ecx,%edx
  800639:	8d 45 14             	lea    0x14(%ebp),%eax
  80063c:	e8 92 fc ff ff       	call   8002d3 <getuint>
  800641:	89 d1                	mov    %edx,%ecx
  800643:	89 c2                	mov    %eax,%edx
  800645:	bf 08 00 00 00       	mov    $0x8,%edi
  80064a:	eb c9                	jmp    800615 <vprintfmt+0x2a8>
  80064c:	83 ec 08             	sub    $0x8,%esp
  80064f:	56                   	push   %esi
  800650:	6a 30                	push   $0x30
  800652:	ff d3                	call   *%ebx
  800654:	83 c4 08             	add    $0x8,%esp
  800657:	56                   	push   %esi
  800658:	6a 78                	push   $0x78
  80065a:	ff d3                	call   *%ebx
  80065c:	8b 45 14             	mov    0x14(%ebp),%eax
  80065f:	8d 50 04             	lea    0x4(%eax),%edx
  800662:	89 55 14             	mov    %edx,0x14(%ebp)
  800665:	8b 10                	mov    (%eax),%edx
  800667:	b9 00 00 00 00       	mov    $0x0,%ecx
  80066c:	83 c4 10             	add    $0x10,%esp
  80066f:	bf 10 00 00 00       	mov    $0x10,%edi
  800674:	eb 9f                	jmp    800615 <vprintfmt+0x2a8>
  800676:	89 ca                	mov    %ecx,%edx
  800678:	8d 45 14             	lea    0x14(%ebp),%eax
  80067b:	e8 53 fc ff ff       	call   8002d3 <getuint>
  800680:	89 d1                	mov    %edx,%ecx
  800682:	89 c2                	mov    %eax,%edx
  800684:	bf 10 00 00 00       	mov    $0x10,%edi
  800689:	eb 8a                	jmp    800615 <vprintfmt+0x2a8>
  80068b:	83 ec 08             	sub    $0x8,%esp
  80068e:	56                   	push   %esi
  80068f:	6a 25                	push   $0x25
  800691:	ff d3                	call   *%ebx
  800693:	83 c4 10             	add    $0x10,%esp
  800696:	eb 97                	jmp    80062f <vprintfmt+0x2c2>
  800698:	83 ec 08             	sub    $0x8,%esp
  80069b:	56                   	push   %esi
  80069c:	6a 25                	push   $0x25
  80069e:	ff d3                	call   *%ebx
  8006a0:	83 c4 10             	add    $0x10,%esp
  8006a3:	89 f8                	mov    %edi,%eax
  8006a5:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  8006a9:	74 05                	je     8006b0 <vprintfmt+0x343>
  8006ab:	83 e8 01             	sub    $0x1,%eax
  8006ae:	eb f5                	jmp    8006a5 <vprintfmt+0x338>
  8006b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8006b3:	e9 77 ff ff ff       	jmp    80062f <vprintfmt+0x2c2>

008006b8 <vsnprintf>:
  8006b8:	55                   	push   %ebp
  8006b9:	89 e5                	mov    %esp,%ebp
  8006bb:	83 ec 18             	sub    $0x18,%esp
  8006be:	8b 45 08             	mov    0x8(%ebp),%eax
  8006c1:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  8006c7:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  8006cb:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  8006ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  8006d5:	85 c0                	test   %eax,%eax
  8006d7:	74 26                	je     8006ff <vsnprintf+0x47>
  8006d9:	85 d2                	test   %edx,%edx
  8006db:	7e 22                	jle    8006ff <vsnprintf+0x47>
  8006dd:	ff 75 14             	push   0x14(%ebp)
  8006e0:	ff 75 10             	push   0x10(%ebp)
  8006e3:	8d 45 ec             	lea    -0x14(%ebp),%eax
  8006e6:	50                   	push   %eax
  8006e7:	68 33 03 80 00       	push   $0x800333
  8006ec:	e8 7c fc ff ff       	call   80036d <vprintfmt>
  8006f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  8006f4:	c6 00 00             	movb   $0x0,(%eax)
  8006f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  8006fa:	83 c4 10             	add    $0x10,%esp
  8006fd:	c9                   	leave
  8006fe:	c3                   	ret
  8006ff:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800704:	eb f7                	jmp    8006fd <vsnprintf+0x45>

00800706 <snprintf>:
  800706:	55                   	push   %ebp
  800707:	89 e5                	mov    %esp,%ebp
  800709:	83 ec 08             	sub    $0x8,%esp
  80070c:	8d 45 14             	lea    0x14(%ebp),%eax
  80070f:	50                   	push   %eax
  800710:	ff 75 10             	push   0x10(%ebp)
  800713:	ff 75 0c             	push   0xc(%ebp)
  800716:	ff 75 08             	push   0x8(%ebp)
  800719:	e8 9a ff ff ff       	call   8006b8 <vsnprintf>
  80071e:	c9                   	leave
  80071f:	c3                   	ret

00800720 <strlen>:
  800720:	55                   	push   %ebp
  800721:	89 e5                	mov    %esp,%ebp
  800723:	8b 55 08             	mov    0x8(%ebp),%edx
  800726:	b8 00 00 00 00       	mov    $0x0,%eax
  80072b:	eb 03                	jmp    800730 <strlen+0x10>
  80072d:	83 c0 01             	add    $0x1,%eax
  800730:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800734:	75 f7                	jne    80072d <strlen+0xd>
  800736:	5d                   	pop    %ebp
  800737:	c3                   	ret

00800738 <strnlen>:
  800738:	55                   	push   %ebp
  800739:	89 e5                	mov    %esp,%ebp
  80073b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80073e:	8b 55 0c             	mov    0xc(%ebp),%edx
  800741:	b8 00 00 00 00       	mov    $0x0,%eax
  800746:	eb 03                	jmp    80074b <strnlen+0x13>
  800748:	83 c0 01             	add    $0x1,%eax
  80074b:	39 d0                	cmp    %edx,%eax
  80074d:	74 08                	je     800757 <strnlen+0x1f>
  80074f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  800753:	75 f3                	jne    800748 <strnlen+0x10>
  800755:	89 c2                	mov    %eax,%edx
  800757:	89 d0                	mov    %edx,%eax
  800759:	5d                   	pop    %ebp
  80075a:	c3                   	ret

0080075b <strcpy>:
  80075b:	55                   	push   %ebp
  80075c:	89 e5                	mov    %esp,%ebp
  80075e:	53                   	push   %ebx
  80075f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800762:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800765:	b8 00 00 00 00       	mov    $0x0,%eax
  80076a:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  80076e:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  800771:	83 c0 01             	add    $0x1,%eax
  800774:	84 d2                	test   %dl,%dl
  800776:	75 f2                	jne    80076a <strcpy+0xf>
  800778:	89 c8                	mov    %ecx,%eax
  80077a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80077d:	c9                   	leave
  80077e:	c3                   	ret

0080077f <strcat>:
  80077f:	55                   	push   %ebp
  800780:	89 e5                	mov    %esp,%ebp
  800782:	53                   	push   %ebx
  800783:	83 ec 10             	sub    $0x10,%esp
  800786:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800789:	53                   	push   %ebx
  80078a:	e8 91 ff ff ff       	call   800720 <strlen>
  80078f:	83 c4 08             	add    $0x8,%esp
  800792:	ff 75 0c             	push   0xc(%ebp)
  800795:	01 d8                	add    %ebx,%eax
  800797:	50                   	push   %eax
  800798:	e8 be ff ff ff       	call   80075b <strcpy>
  80079d:	89 d8                	mov    %ebx,%eax
  80079f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007a2:	c9                   	leave
  8007a3:	c3                   	ret

008007a4 <strncpy>:
  8007a4:	55                   	push   %ebp
  8007a5:	89 e5                	mov    %esp,%ebp
  8007a7:	56                   	push   %esi
  8007a8:	53                   	push   %ebx
  8007a9:	8b 75 08             	mov    0x8(%ebp),%esi
  8007ac:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007af:	89 f3                	mov    %esi,%ebx
  8007b1:	03 5d 10             	add    0x10(%ebp),%ebx
  8007b4:	89 f0                	mov    %esi,%eax
  8007b6:	eb 0f                	jmp    8007c7 <strncpy+0x23>
  8007b8:	83 c0 01             	add    $0x1,%eax
  8007bb:	0f b6 0a             	movzbl (%edx),%ecx
  8007be:	88 48 ff             	mov    %cl,-0x1(%eax)
  8007c1:	80 f9 01             	cmp    $0x1,%cl
  8007c4:	83 da ff             	sbb    $0xffffffff,%edx
  8007c7:	39 d8                	cmp    %ebx,%eax
  8007c9:	75 ed                	jne    8007b8 <strncpy+0x14>
  8007cb:	89 f0                	mov    %esi,%eax
  8007cd:	5b                   	pop    %ebx
  8007ce:	5e                   	pop    %esi
  8007cf:	5d                   	pop    %ebp
  8007d0:	c3                   	ret

008007d1 <strlcpy>:
  8007d1:	55                   	push   %ebp
  8007d2:	89 e5                	mov    %esp,%ebp
  8007d4:	56                   	push   %esi
  8007d5:	53                   	push   %ebx
  8007d6:	8b 75 08             	mov    0x8(%ebp),%esi
  8007d9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007dc:	8b 55 10             	mov    0x10(%ebp),%edx
  8007df:	89 f0                	mov    %esi,%eax
  8007e1:	85 d2                	test   %edx,%edx
  8007e3:	74 21                	je     800806 <strlcpy+0x35>
  8007e5:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  8007e9:	89 f2                	mov    %esi,%edx
  8007eb:	eb 09                	jmp    8007f6 <strlcpy+0x25>
  8007ed:	83 c1 01             	add    $0x1,%ecx
  8007f0:	83 c2 01             	add    $0x1,%edx
  8007f3:	88 5a ff             	mov    %bl,-0x1(%edx)
  8007f6:	39 c2                	cmp    %eax,%edx
  8007f8:	74 09                	je     800803 <strlcpy+0x32>
  8007fa:	0f b6 19             	movzbl (%ecx),%ebx
  8007fd:	84 db                	test   %bl,%bl
  8007ff:	75 ec                	jne    8007ed <strlcpy+0x1c>
  800801:	89 d0                	mov    %edx,%eax
  800803:	c6 00 00             	movb   $0x0,(%eax)
  800806:	29 f0                	sub    %esi,%eax
  800808:	5b                   	pop    %ebx
  800809:	5e                   	pop    %esi
  80080a:	5d                   	pop    %ebp
  80080b:	c3                   	ret

0080080c <strcmp>:
  80080c:	55                   	push   %ebp
  80080d:	89 e5                	mov    %esp,%ebp
  80080f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800812:	8b 55 0c             	mov    0xc(%ebp),%edx
  800815:	eb 06                	jmp    80081d <strcmp+0x11>
  800817:	83 c1 01             	add    $0x1,%ecx
  80081a:	83 c2 01             	add    $0x1,%edx
  80081d:	0f b6 01             	movzbl (%ecx),%eax
  800820:	84 c0                	test   %al,%al
  800822:	74 04                	je     800828 <strcmp+0x1c>
  800824:	3a 02                	cmp    (%edx),%al
  800826:	74 ef                	je     800817 <strcmp+0xb>
  800828:	0f b6 c0             	movzbl %al,%eax
  80082b:	0f b6 12             	movzbl (%edx),%edx
  80082e:	29 d0                	sub    %edx,%eax
  800830:	5d                   	pop    %ebp
  800831:	c3                   	ret

00800832 <strncmp>:
  800832:	55                   	push   %ebp
  800833:	89 e5                	mov    %esp,%ebp
  800835:	53                   	push   %ebx
  800836:	8b 45 08             	mov    0x8(%ebp),%eax
  800839:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80083c:	8b 55 10             	mov    0x10(%ebp),%edx
  80083f:	eb 09                	jmp    80084a <strncmp+0x18>
  800841:	83 ea 01             	sub    $0x1,%edx
  800844:	83 c0 01             	add    $0x1,%eax
  800847:	83 c1 01             	add    $0x1,%ecx
  80084a:	85 d2                	test   %edx,%edx
  80084c:	74 18                	je     800866 <strncmp+0x34>
  80084e:	0f b6 18             	movzbl (%eax),%ebx
  800851:	84 db                	test   %bl,%bl
  800853:	74 04                	je     800859 <strncmp+0x27>
  800855:	3a 19                	cmp    (%ecx),%bl
  800857:	74 e8                	je     800841 <strncmp+0xf>
  800859:	0f b6 00             	movzbl (%eax),%eax
  80085c:	0f b6 11             	movzbl (%ecx),%edx
  80085f:	29 d0                	sub    %edx,%eax
  800861:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800864:	c9                   	leave
  800865:	c3                   	ret
  800866:	b8 00 00 00 00       	mov    $0x0,%eax
  80086b:	eb f4                	jmp    800861 <strncmp+0x2f>

0080086d <strchr>:
  80086d:	55                   	push   %ebp
  80086e:	89 e5                	mov    %esp,%ebp
  800870:	8b 45 08             	mov    0x8(%ebp),%eax
  800873:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800877:	eb 03                	jmp    80087c <strchr+0xf>
  800879:	83 c0 01             	add    $0x1,%eax
  80087c:	0f b6 10             	movzbl (%eax),%edx
  80087f:	84 d2                	test   %dl,%dl
  800881:	74 06                	je     800889 <strchr+0x1c>
  800883:	38 ca                	cmp    %cl,%dl
  800885:	75 f2                	jne    800879 <strchr+0xc>
  800887:	eb 05                	jmp    80088e <strchr+0x21>
  800889:	b8 00 00 00 00       	mov    $0x0,%eax
  80088e:	5d                   	pop    %ebp
  80088f:	c3                   	ret

00800890 <strfind>:
  800890:	55                   	push   %ebp
  800891:	89 e5                	mov    %esp,%ebp
  800893:	8b 45 08             	mov    0x8(%ebp),%eax
  800896:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  80089a:	0f b6 10             	movzbl (%eax),%edx
  80089d:	38 ca                	cmp    %cl,%dl
  80089f:	74 09                	je     8008aa <strfind+0x1a>
  8008a1:	84 d2                	test   %dl,%dl
  8008a3:	74 05                	je     8008aa <strfind+0x1a>
  8008a5:	83 c0 01             	add    $0x1,%eax
  8008a8:	eb f0                	jmp    80089a <strfind+0xa>
  8008aa:	5d                   	pop    %ebp
  8008ab:	c3                   	ret

008008ac <memset>:
  8008ac:	55                   	push   %ebp
  8008ad:	89 e5                	mov    %esp,%ebp
  8008af:	57                   	push   %edi
  8008b0:	8b 55 08             	mov    0x8(%ebp),%edx
  8008b3:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8008b6:	85 c9                	test   %ecx,%ecx
  8008b8:	74 24                	je     8008de <memset+0x32>
  8008ba:	89 d0                	mov    %edx,%eax
  8008bc:	09 c8                	or     %ecx,%eax
  8008be:	a8 03                	test   $0x3,%al
  8008c0:	75 14                	jne    8008d6 <memset+0x2a>
  8008c2:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  8008c6:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  8008cc:	c1 e9 02             	shr    $0x2,%ecx
  8008cf:	89 d7                	mov    %edx,%edi
  8008d1:	fc                   	cld
  8008d2:	f3 ab                	rep stos %eax,%es:(%edi)
  8008d4:	eb 08                	jmp    8008de <memset+0x32>
  8008d6:	89 d7                	mov    %edx,%edi
  8008d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  8008db:	fc                   	cld
  8008dc:	f3 aa                	rep stos %al,%es:(%edi)
  8008de:	89 d0                	mov    %edx,%eax
  8008e0:	8b 7d fc             	mov    -0x4(%ebp),%edi
  8008e3:	c9                   	leave
  8008e4:	c3                   	ret

008008e5 <memmove>:
  8008e5:	55                   	push   %ebp
  8008e6:	89 e5                	mov    %esp,%ebp
  8008e8:	57                   	push   %edi
  8008e9:	56                   	push   %esi
  8008ea:	8b 45 08             	mov    0x8(%ebp),%eax
  8008ed:	8b 75 0c             	mov    0xc(%ebp),%esi
  8008f0:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8008f3:	39 c6                	cmp    %eax,%esi
  8008f5:	73 32                	jae    800929 <memmove+0x44>
  8008f7:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  8008fa:	39 d0                	cmp    %edx,%eax
  8008fc:	73 2b                	jae    800929 <memmove+0x44>
  8008fe:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800901:	89 fe                	mov    %edi,%esi
  800903:	09 ce                	or     %ecx,%esi
  800905:	09 d6                	or     %edx,%esi
  800907:	f7 c6 03 00 00 00    	test   $0x3,%esi
  80090d:	75 0e                	jne    80091d <memmove+0x38>
  80090f:	83 ef 04             	sub    $0x4,%edi
  800912:	8d 72 fc             	lea    -0x4(%edx),%esi
  800915:	c1 e9 02             	shr    $0x2,%ecx
  800918:	fd                   	std
  800919:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80091b:	eb 09                	jmp    800926 <memmove+0x41>
  80091d:	83 ef 01             	sub    $0x1,%edi
  800920:	8d 72 ff             	lea    -0x1(%edx),%esi
  800923:	fd                   	std
  800924:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800926:	fc                   	cld
  800927:	eb 1a                	jmp    800943 <memmove+0x5e>
  800929:	89 c2                	mov    %eax,%edx
  80092b:	09 ca                	or     %ecx,%edx
  80092d:	09 f2                	or     %esi,%edx
  80092f:	f6 c2 03             	test   $0x3,%dl
  800932:	75 0a                	jne    80093e <memmove+0x59>
  800934:	c1 e9 02             	shr    $0x2,%ecx
  800937:	89 c7                	mov    %eax,%edi
  800939:	fc                   	cld
  80093a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80093c:	eb 05                	jmp    800943 <memmove+0x5e>
  80093e:	89 c7                	mov    %eax,%edi
  800940:	fc                   	cld
  800941:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800943:	5e                   	pop    %esi
  800944:	5f                   	pop    %edi
  800945:	5d                   	pop    %ebp
  800946:	c3                   	ret

00800947 <memcpy>:
  800947:	55                   	push   %ebp
  800948:	89 e5                	mov    %esp,%ebp
  80094a:	83 ec 0c             	sub    $0xc,%esp
  80094d:	ff 75 10             	push   0x10(%ebp)
  800950:	ff 75 0c             	push   0xc(%ebp)
  800953:	ff 75 08             	push   0x8(%ebp)
  800956:	e8 8a ff ff ff       	call   8008e5 <memmove>
  80095b:	c9                   	leave
  80095c:	c3                   	ret

0080095d <memcmp>:
  80095d:	55                   	push   %ebp
  80095e:	89 e5                	mov    %esp,%ebp
  800960:	56                   	push   %esi
  800961:	53                   	push   %ebx
  800962:	8b 45 08             	mov    0x8(%ebp),%eax
  800965:	8b 55 0c             	mov    0xc(%ebp),%edx
  800968:	89 c6                	mov    %eax,%esi
  80096a:	03 75 10             	add    0x10(%ebp),%esi
  80096d:	eb 06                	jmp    800975 <memcmp+0x18>
  80096f:	83 c0 01             	add    $0x1,%eax
  800972:	83 c2 01             	add    $0x1,%edx
  800975:	39 f0                	cmp    %esi,%eax
  800977:	74 14                	je     80098d <memcmp+0x30>
  800979:	0f b6 08             	movzbl (%eax),%ecx
  80097c:	0f b6 1a             	movzbl (%edx),%ebx
  80097f:	38 d9                	cmp    %bl,%cl
  800981:	74 ec                	je     80096f <memcmp+0x12>
  800983:	0f b6 c1             	movzbl %cl,%eax
  800986:	0f b6 db             	movzbl %bl,%ebx
  800989:	29 d8                	sub    %ebx,%eax
  80098b:	eb 05                	jmp    800992 <memcmp+0x35>
  80098d:	b8 00 00 00 00       	mov    $0x0,%eax
  800992:	5b                   	pop    %ebx
  800993:	5e                   	pop    %esi
  800994:	5d                   	pop    %ebp
  800995:	c3                   	ret

00800996 <memfind>:
  800996:	55                   	push   %ebp
  800997:	89 e5                	mov    %esp,%ebp
  800999:	8b 45 08             	mov    0x8(%ebp),%eax
  80099c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80099f:	89 c2                	mov    %eax,%edx
  8009a1:	03 55 10             	add    0x10(%ebp),%edx
  8009a4:	eb 03                	jmp    8009a9 <memfind+0x13>
  8009a6:	83 c0 01             	add    $0x1,%eax
  8009a9:	39 d0                	cmp    %edx,%eax
  8009ab:	73 04                	jae    8009b1 <memfind+0x1b>
  8009ad:	38 08                	cmp    %cl,(%eax)
  8009af:	75 f5                	jne    8009a6 <memfind+0x10>
  8009b1:	5d                   	pop    %ebp
  8009b2:	c3                   	ret

008009b3 <strtol>:
  8009b3:	55                   	push   %ebp
  8009b4:	89 e5                	mov    %esp,%ebp
  8009b6:	57                   	push   %edi
  8009b7:	56                   	push   %esi
  8009b8:	53                   	push   %ebx
  8009b9:	8b 55 08             	mov    0x8(%ebp),%edx
  8009bc:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8009bf:	eb 03                	jmp    8009c4 <strtol+0x11>
  8009c1:	83 c2 01             	add    $0x1,%edx
  8009c4:	0f b6 02             	movzbl (%edx),%eax
  8009c7:	3c 20                	cmp    $0x20,%al
  8009c9:	74 f6                	je     8009c1 <strtol+0xe>
  8009cb:	3c 09                	cmp    $0x9,%al
  8009cd:	74 f2                	je     8009c1 <strtol+0xe>
  8009cf:	3c 2b                	cmp    $0x2b,%al
  8009d1:	74 2a                	je     8009fd <strtol+0x4a>
  8009d3:	bf 00 00 00 00       	mov    $0x0,%edi
  8009d8:	3c 2d                	cmp    $0x2d,%al
  8009da:	74 2b                	je     800a07 <strtol+0x54>
  8009dc:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  8009e2:	75 0f                	jne    8009f3 <strtol+0x40>
  8009e4:	80 3a 30             	cmpb   $0x30,(%edx)
  8009e7:	74 28                	je     800a11 <strtol+0x5e>
  8009e9:	85 db                	test   %ebx,%ebx
  8009eb:	b8 0a 00 00 00       	mov    $0xa,%eax
  8009f0:	0f 44 d8             	cmove  %eax,%ebx
  8009f3:	b9 00 00 00 00       	mov    $0x0,%ecx
  8009f8:	89 5d 10             	mov    %ebx,0x10(%ebp)
  8009fb:	eb 46                	jmp    800a43 <strtol+0x90>
  8009fd:	83 c2 01             	add    $0x1,%edx
  800a00:	bf 00 00 00 00       	mov    $0x0,%edi
  800a05:	eb d5                	jmp    8009dc <strtol+0x29>
  800a07:	83 c2 01             	add    $0x1,%edx
  800a0a:	bf 01 00 00 00       	mov    $0x1,%edi
  800a0f:	eb cb                	jmp    8009dc <strtol+0x29>
  800a11:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800a15:	74 0e                	je     800a25 <strtol+0x72>
  800a17:	85 db                	test   %ebx,%ebx
  800a19:	75 d8                	jne    8009f3 <strtol+0x40>
  800a1b:	83 c2 01             	add    $0x1,%edx
  800a1e:	bb 08 00 00 00       	mov    $0x8,%ebx
  800a23:	eb ce                	jmp    8009f3 <strtol+0x40>
  800a25:	83 c2 02             	add    $0x2,%edx
  800a28:	bb 10 00 00 00       	mov    $0x10,%ebx
  800a2d:	eb c4                	jmp    8009f3 <strtol+0x40>
  800a2f:	0f be c0             	movsbl %al,%eax
  800a32:	83 e8 30             	sub    $0x30,%eax
  800a35:	3b 45 10             	cmp    0x10(%ebp),%eax
  800a38:	7d 3a                	jge    800a74 <strtol+0xc1>
  800a3a:	83 c2 01             	add    $0x1,%edx
  800a3d:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800a41:	01 c1                	add    %eax,%ecx
  800a43:	0f b6 02             	movzbl (%edx),%eax
  800a46:	8d 70 d0             	lea    -0x30(%eax),%esi
  800a49:	89 f3                	mov    %esi,%ebx
  800a4b:	80 fb 09             	cmp    $0x9,%bl
  800a4e:	76 df                	jbe    800a2f <strtol+0x7c>
  800a50:	8d 70 9f             	lea    -0x61(%eax),%esi
  800a53:	89 f3                	mov    %esi,%ebx
  800a55:	80 fb 19             	cmp    $0x19,%bl
  800a58:	77 08                	ja     800a62 <strtol+0xaf>
  800a5a:	0f be c0             	movsbl %al,%eax
  800a5d:	83 e8 57             	sub    $0x57,%eax
  800a60:	eb d3                	jmp    800a35 <strtol+0x82>
  800a62:	8d 70 bf             	lea    -0x41(%eax),%esi
  800a65:	89 f3                	mov    %esi,%ebx
  800a67:	80 fb 19             	cmp    $0x19,%bl
  800a6a:	77 08                	ja     800a74 <strtol+0xc1>
  800a6c:	0f be c0             	movsbl %al,%eax
  800a6f:	83 e8 37             	sub    $0x37,%eax
  800a72:	eb c1                	jmp    800a35 <strtol+0x82>
  800a74:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800a78:	74 05                	je     800a7f <strtol+0xcc>
  800a7a:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a7d:	89 10                	mov    %edx,(%eax)
  800a7f:	89 c8                	mov    %ecx,%eax
  800a81:	f7 d8                	neg    %eax
  800a83:	85 ff                	test   %edi,%edi
  800a85:	0f 45 c8             	cmovne %eax,%ecx
  800a88:	89 c8                	mov    %ecx,%eax
  800a8a:	5b                   	pop    %ebx
  800a8b:	5e                   	pop    %esi
  800a8c:	5f                   	pop    %edi
  800a8d:	5d                   	pop    %ebp
  800a8e:	c3                   	ret

00800a8f <syscall>:
  800a8f:	55                   	push   %ebp
  800a90:	89 e5                	mov    %esp,%ebp
  800a92:	57                   	push   %edi
  800a93:	56                   	push   %esi
  800a94:	53                   	push   %ebx
  800a95:	83 ec 1c             	sub    $0x1c,%esp
  800a98:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a9b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a9e:	89 ca                	mov    %ecx,%edx
  800aa0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800aa3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800aa6:	8b 7d 10             	mov    0x10(%ebp),%edi
  800aa9:	8b 75 14             	mov    0x14(%ebp),%esi
  800aac:	cd 30                	int    $0x30
  800aae:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800ab2:	74 04                	je     800ab8 <syscall+0x29>
  800ab4:	85 c0                	test   %eax,%eax
  800ab6:	7f 08                	jg     800ac0 <syscall+0x31>
  800ab8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800abb:	5b                   	pop    %ebx
  800abc:	5e                   	pop    %esi
  800abd:	5f                   	pop    %edi
  800abe:	5d                   	pop    %ebp
  800abf:	c3                   	ret
  800ac0:	83 ec 0c             	sub    $0xc,%esp
  800ac3:	50                   	push   %eax
  800ac4:	ff 75 e0             	push   -0x20(%ebp)
  800ac7:	68 a3 10 80 00       	push   $0x8010a3
  800acc:	6a 1e                	push   $0x1e
  800ace:	68 c0 10 80 00       	push   $0x8010c0
  800ad3:	e8 63 f6 ff ff       	call   80013b <_panic>

00800ad8 <sys_cputs>:
  800ad8:	55                   	push   %ebp
  800ad9:	89 e5                	mov    %esp,%ebp
  800adb:	83 ec 08             	sub    $0x8,%esp
  800ade:	6a 00                	push   $0x0
  800ae0:	6a 00                	push   $0x0
  800ae2:	6a 00                	push   $0x0
  800ae4:	ff 75 0c             	push   0xc(%ebp)
  800ae7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800aea:	ba 00 00 00 00       	mov    $0x0,%edx
  800aef:	b8 00 00 00 00       	mov    $0x0,%eax
  800af4:	e8 96 ff ff ff       	call   800a8f <syscall>
  800af9:	83 c4 10             	add    $0x10,%esp
  800afc:	c9                   	leave
  800afd:	c3                   	ret

00800afe <sys_cgetc>:
  800afe:	55                   	push   %ebp
  800aff:	89 e5                	mov    %esp,%ebp
  800b01:	83 ec 08             	sub    $0x8,%esp
  800b04:	6a 00                	push   $0x0
  800b06:	6a 00                	push   $0x0
  800b08:	6a 00                	push   $0x0
  800b0a:	6a 00                	push   $0x0
  800b0c:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b11:	ba 00 00 00 00       	mov    $0x0,%edx
  800b16:	b8 01 00 00 00       	mov    $0x1,%eax
  800b1b:	e8 6f ff ff ff       	call   800a8f <syscall>
  800b20:	c9                   	leave
  800b21:	c3                   	ret

00800b22 <sys_env_destroy>:
  800b22:	55                   	push   %ebp
  800b23:	89 e5                	mov    %esp,%ebp
  800b25:	83 ec 08             	sub    $0x8,%esp
  800b28:	6a 00                	push   $0x0
  800b2a:	6a 00                	push   $0x0
  800b2c:	6a 00                	push   $0x0
  800b2e:	6a 00                	push   $0x0
  800b30:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b33:	ba 01 00 00 00       	mov    $0x1,%edx
  800b38:	b8 03 00 00 00       	mov    $0x3,%eax
  800b3d:	e8 4d ff ff ff       	call   800a8f <syscall>
  800b42:	c9                   	leave
  800b43:	c3                   	ret

00800b44 <sys_getenvid>:
  800b44:	55                   	push   %ebp
  800b45:	89 e5                	mov    %esp,%ebp
  800b47:	83 ec 08             	sub    $0x8,%esp
  800b4a:	6a 00                	push   $0x0
  800b4c:	6a 00                	push   $0x0
  800b4e:	6a 00                	push   $0x0
  800b50:	6a 00                	push   $0x0
  800b52:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b57:	ba 00 00 00 00       	mov    $0x0,%edx
  800b5c:	b8 02 00 00 00       	mov    $0x2,%eax
  800b61:	e8 29 ff ff ff       	call   800a8f <syscall>
  800b66:	c9                   	leave
  800b67:	c3                   	ret

00800b68 <sys_yield>:
  800b68:	55                   	push   %ebp
  800b69:	89 e5                	mov    %esp,%ebp
  800b6b:	83 ec 08             	sub    $0x8,%esp
  800b6e:	6a 00                	push   $0x0
  800b70:	6a 00                	push   $0x0
  800b72:	6a 00                	push   $0x0
  800b74:	6a 00                	push   $0x0
  800b76:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b7b:	ba 00 00 00 00       	mov    $0x0,%edx
  800b80:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b85:	e8 05 ff ff ff       	call   800a8f <syscall>
  800b8a:	83 c4 10             	add    $0x10,%esp
  800b8d:	c9                   	leave
  800b8e:	c3                   	ret

00800b8f <sys_page_alloc>:
  800b8f:	55                   	push   %ebp
  800b90:	89 e5                	mov    %esp,%ebp
  800b92:	83 ec 08             	sub    $0x8,%esp
  800b95:	6a 00                	push   $0x0
  800b97:	6a 00                	push   $0x0
  800b99:	ff 75 10             	push   0x10(%ebp)
  800b9c:	ff 75 0c             	push   0xc(%ebp)
  800b9f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ba2:	ba 01 00 00 00       	mov    $0x1,%edx
  800ba7:	b8 04 00 00 00       	mov    $0x4,%eax
  800bac:	e8 de fe ff ff       	call   800a8f <syscall>
  800bb1:	c9                   	leave
  800bb2:	c3                   	ret

00800bb3 <sys_page_map>:
  800bb3:	55                   	push   %ebp
  800bb4:	89 e5                	mov    %esp,%ebp
  800bb6:	83 ec 08             	sub    $0x8,%esp
  800bb9:	ff 75 18             	push   0x18(%ebp)
  800bbc:	ff 75 14             	push   0x14(%ebp)
  800bbf:	ff 75 10             	push   0x10(%ebp)
  800bc2:	ff 75 0c             	push   0xc(%ebp)
  800bc5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bc8:	ba 01 00 00 00       	mov    $0x1,%edx
  800bcd:	b8 05 00 00 00       	mov    $0x5,%eax
  800bd2:	e8 b8 fe ff ff       	call   800a8f <syscall>
  800bd7:	c9                   	leave
  800bd8:	c3                   	ret

00800bd9 <sys_page_unmap>:
  800bd9:	55                   	push   %ebp
  800bda:	89 e5                	mov    %esp,%ebp
  800bdc:	83 ec 08             	sub    $0x8,%esp
  800bdf:	6a 00                	push   $0x0
  800be1:	6a 00                	push   $0x0
  800be3:	6a 00                	push   $0x0
  800be5:	ff 75 0c             	push   0xc(%ebp)
  800be8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800beb:	ba 01 00 00 00       	mov    $0x1,%edx
  800bf0:	b8 06 00 00 00       	mov    $0x6,%eax
  800bf5:	e8 95 fe ff ff       	call   800a8f <syscall>
  800bfa:	c9                   	leave
  800bfb:	c3                   	ret

00800bfc <sys_env_set_status>:
  800bfc:	55                   	push   %ebp
  800bfd:	89 e5                	mov    %esp,%ebp
  800bff:	83 ec 08             	sub    $0x8,%esp
  800c02:	6a 00                	push   $0x0
  800c04:	6a 00                	push   $0x0
  800c06:	6a 00                	push   $0x0
  800c08:	ff 75 0c             	push   0xc(%ebp)
  800c0b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c0e:	ba 01 00 00 00       	mov    $0x1,%edx
  800c13:	b8 08 00 00 00       	mov    $0x8,%eax
  800c18:	e8 72 fe ff ff       	call   800a8f <syscall>
  800c1d:	c9                   	leave
  800c1e:	c3                   	ret

00800c1f <sys_env_set_pgfault_upcall>:
  800c1f:	55                   	push   %ebp
  800c20:	89 e5                	mov    %esp,%ebp
  800c22:	83 ec 08             	sub    $0x8,%esp
  800c25:	6a 00                	push   $0x0
  800c27:	6a 00                	push   $0x0
  800c29:	6a 00                	push   $0x0
  800c2b:	ff 75 0c             	push   0xc(%ebp)
  800c2e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c31:	ba 01 00 00 00       	mov    $0x1,%edx
  800c36:	b8 09 00 00 00       	mov    $0x9,%eax
  800c3b:	e8 4f fe ff ff       	call   800a8f <syscall>
  800c40:	c9                   	leave
  800c41:	c3                   	ret

00800c42 <sys_ipc_try_send>:
  800c42:	55                   	push   %ebp
  800c43:	89 e5                	mov    %esp,%ebp
  800c45:	83 ec 08             	sub    $0x8,%esp
  800c48:	6a 00                	push   $0x0
  800c4a:	ff 75 14             	push   0x14(%ebp)
  800c4d:	ff 75 10             	push   0x10(%ebp)
  800c50:	ff 75 0c             	push   0xc(%ebp)
  800c53:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c56:	ba 00 00 00 00       	mov    $0x0,%edx
  800c5b:	b8 0c 00 00 00       	mov    $0xc,%eax
  800c60:	e8 2a fe ff ff       	call   800a8f <syscall>
  800c65:	c9                   	leave
  800c66:	c3                   	ret

00800c67 <sys_ipc_recv>:
  800c67:	55                   	push   %ebp
  800c68:	89 e5                	mov    %esp,%ebp
  800c6a:	83 ec 08             	sub    $0x8,%esp
  800c6d:	6a 00                	push   $0x0
  800c6f:	6a 00                	push   $0x0
  800c71:	6a 00                	push   $0x0
  800c73:	6a 00                	push   $0x0
  800c75:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c78:	ba 01 00 00 00       	mov    $0x1,%edx
  800c7d:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c82:	e8 08 fe ff ff       	call   800a8f <syscall>
  800c87:	c9                   	leave
  800c88:	c3                   	ret
  800c89:	66 90                	xchg   %ax,%ax
  800c8b:	66 90                	xchg   %ax,%ax
  800c8d:	66 90                	xchg   %ax,%ax
  800c8f:	90                   	nop

00800c90 <__udivdi3>:
  800c90:	f3 0f 1e fb          	endbr32
  800c94:	55                   	push   %ebp
  800c95:	57                   	push   %edi
  800c96:	56                   	push   %esi
  800c97:	53                   	push   %ebx
  800c98:	83 ec 1c             	sub    $0x1c,%esp
  800c9b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800c9f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800ca3:	8b 74 24 34          	mov    0x34(%esp),%esi
  800ca7:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800cab:	85 c0                	test   %eax,%eax
  800cad:	75 19                	jne    800cc8 <__udivdi3+0x38>
  800caf:	39 de                	cmp    %ebx,%esi
  800cb1:	73 4d                	jae    800d00 <__udivdi3+0x70>
  800cb3:	31 ff                	xor    %edi,%edi
  800cb5:	89 e8                	mov    %ebp,%eax
  800cb7:	89 f2                	mov    %esi,%edx
  800cb9:	f7 f3                	div    %ebx
  800cbb:	89 fa                	mov    %edi,%edx
  800cbd:	83 c4 1c             	add    $0x1c,%esp
  800cc0:	5b                   	pop    %ebx
  800cc1:	5e                   	pop    %esi
  800cc2:	5f                   	pop    %edi
  800cc3:	5d                   	pop    %ebp
  800cc4:	c3                   	ret
  800cc5:	8d 76 00             	lea    0x0(%esi),%esi
  800cc8:	39 c6                	cmp    %eax,%esi
  800cca:	73 14                	jae    800ce0 <__udivdi3+0x50>
  800ccc:	31 ff                	xor    %edi,%edi
  800cce:	31 c0                	xor    %eax,%eax
  800cd0:	89 fa                	mov    %edi,%edx
  800cd2:	83 c4 1c             	add    $0x1c,%esp
  800cd5:	5b                   	pop    %ebx
  800cd6:	5e                   	pop    %esi
  800cd7:	5f                   	pop    %edi
  800cd8:	5d                   	pop    %ebp
  800cd9:	c3                   	ret
  800cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800ce0:	0f bd f8             	bsr    %eax,%edi
  800ce3:	83 f7 1f             	xor    $0x1f,%edi
  800ce6:	75 48                	jne    800d30 <__udivdi3+0xa0>
  800ce8:	39 f0                	cmp    %esi,%eax
  800cea:	72 06                	jb     800cf2 <__udivdi3+0x62>
  800cec:	31 c0                	xor    %eax,%eax
  800cee:	39 dd                	cmp    %ebx,%ebp
  800cf0:	72 de                	jb     800cd0 <__udivdi3+0x40>
  800cf2:	b8 01 00 00 00       	mov    $0x1,%eax
  800cf7:	eb d7                	jmp    800cd0 <__udivdi3+0x40>
  800cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d00:	89 d9                	mov    %ebx,%ecx
  800d02:	85 db                	test   %ebx,%ebx
  800d04:	75 0b                	jne    800d11 <__udivdi3+0x81>
  800d06:	b8 01 00 00 00       	mov    $0x1,%eax
  800d0b:	31 d2                	xor    %edx,%edx
  800d0d:	f7 f3                	div    %ebx
  800d0f:	89 c1                	mov    %eax,%ecx
  800d11:	31 d2                	xor    %edx,%edx
  800d13:	89 f0                	mov    %esi,%eax
  800d15:	f7 f1                	div    %ecx
  800d17:	89 c6                	mov    %eax,%esi
  800d19:	89 e8                	mov    %ebp,%eax
  800d1b:	89 f7                	mov    %esi,%edi
  800d1d:	f7 f1                	div    %ecx
  800d1f:	89 fa                	mov    %edi,%edx
  800d21:	83 c4 1c             	add    $0x1c,%esp
  800d24:	5b                   	pop    %ebx
  800d25:	5e                   	pop    %esi
  800d26:	5f                   	pop    %edi
  800d27:	5d                   	pop    %ebp
  800d28:	c3                   	ret
  800d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d30:	89 f9                	mov    %edi,%ecx
  800d32:	ba 20 00 00 00       	mov    $0x20,%edx
  800d37:	29 fa                	sub    %edi,%edx
  800d39:	d3 e0                	shl    %cl,%eax
  800d3b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800d3f:	89 d1                	mov    %edx,%ecx
  800d41:	89 d8                	mov    %ebx,%eax
  800d43:	d3 e8                	shr    %cl,%eax
  800d45:	89 c1                	mov    %eax,%ecx
  800d47:	8b 44 24 08          	mov    0x8(%esp),%eax
  800d4b:	09 c1                	or     %eax,%ecx
  800d4d:	89 f0                	mov    %esi,%eax
  800d4f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800d53:	89 f9                	mov    %edi,%ecx
  800d55:	d3 e3                	shl    %cl,%ebx
  800d57:	89 d1                	mov    %edx,%ecx
  800d59:	d3 e8                	shr    %cl,%eax
  800d5b:	89 f9                	mov    %edi,%ecx
  800d5d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800d61:	89 eb                	mov    %ebp,%ebx
  800d63:	d3 e6                	shl    %cl,%esi
  800d65:	89 d1                	mov    %edx,%ecx
  800d67:	d3 eb                	shr    %cl,%ebx
  800d69:	09 f3                	or     %esi,%ebx
  800d6b:	89 c6                	mov    %eax,%esi
  800d6d:	89 f2                	mov    %esi,%edx
  800d6f:	89 d8                	mov    %ebx,%eax
  800d71:	f7 74 24 08          	divl   0x8(%esp)
  800d75:	89 d6                	mov    %edx,%esi
  800d77:	89 c3                	mov    %eax,%ebx
  800d79:	f7 64 24 0c          	mull   0xc(%esp)
  800d7d:	39 d6                	cmp    %edx,%esi
  800d7f:	72 1f                	jb     800da0 <__udivdi3+0x110>
  800d81:	89 f9                	mov    %edi,%ecx
  800d83:	d3 e5                	shl    %cl,%ebp
  800d85:	39 c5                	cmp    %eax,%ebp
  800d87:	73 04                	jae    800d8d <__udivdi3+0xfd>
  800d89:	39 d6                	cmp    %edx,%esi
  800d8b:	74 13                	je     800da0 <__udivdi3+0x110>
  800d8d:	89 d8                	mov    %ebx,%eax
  800d8f:	31 ff                	xor    %edi,%edi
  800d91:	e9 3a ff ff ff       	jmp    800cd0 <__udivdi3+0x40>
  800d96:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d9d:	00 
  800d9e:	66 90                	xchg   %ax,%ax
  800da0:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800da3:	31 ff                	xor    %edi,%edi
  800da5:	e9 26 ff ff ff       	jmp    800cd0 <__udivdi3+0x40>
  800daa:	66 90                	xchg   %ax,%ax
  800dac:	66 90                	xchg   %ax,%ax
  800dae:	66 90                	xchg   %ax,%ax

00800db0 <__umoddi3>:
  800db0:	f3 0f 1e fb          	endbr32
  800db4:	55                   	push   %ebp
  800db5:	57                   	push   %edi
  800db6:	56                   	push   %esi
  800db7:	53                   	push   %ebx
  800db8:	83 ec 1c             	sub    $0x1c,%esp
  800dbb:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800dbf:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800dc3:	8b 74 24 30          	mov    0x30(%esp),%esi
  800dc7:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800dcb:	89 da                	mov    %ebx,%edx
  800dcd:	85 c0                	test   %eax,%eax
  800dcf:	75 17                	jne    800de8 <__umoddi3+0x38>
  800dd1:	39 fb                	cmp    %edi,%ebx
  800dd3:	73 53                	jae    800e28 <__umoddi3+0x78>
  800dd5:	89 f0                	mov    %esi,%eax
  800dd7:	f7 f7                	div    %edi
  800dd9:	89 d0                	mov    %edx,%eax
  800ddb:	31 d2                	xor    %edx,%edx
  800ddd:	83 c4 1c             	add    $0x1c,%esp
  800de0:	5b                   	pop    %ebx
  800de1:	5e                   	pop    %esi
  800de2:	5f                   	pop    %edi
  800de3:	5d                   	pop    %ebp
  800de4:	c3                   	ret
  800de5:	8d 76 00             	lea    0x0(%esi),%esi
  800de8:	89 f1                	mov    %esi,%ecx
  800dea:	39 c3                	cmp    %eax,%ebx
  800dec:	73 12                	jae    800e00 <__umoddi3+0x50>
  800dee:	89 f0                	mov    %esi,%eax
  800df0:	83 c4 1c             	add    $0x1c,%esp
  800df3:	5b                   	pop    %ebx
  800df4:	5e                   	pop    %esi
  800df5:	5f                   	pop    %edi
  800df6:	5d                   	pop    %ebp
  800df7:	c3                   	ret
  800df8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800dff:	00 
  800e00:	0f bd e8             	bsr    %eax,%ebp
  800e03:	83 f5 1f             	xor    $0x1f,%ebp
  800e06:	75 48                	jne    800e50 <__umoddi3+0xa0>
  800e08:	39 d8                	cmp    %ebx,%eax
  800e0a:	0f 82 d0 00 00 00    	jb     800ee0 <__umoddi3+0x130>
  800e10:	39 fe                	cmp    %edi,%esi
  800e12:	0f 83 c8 00 00 00    	jae    800ee0 <__umoddi3+0x130>
  800e18:	89 c8                	mov    %ecx,%eax
  800e1a:	83 c4 1c             	add    $0x1c,%esp
  800e1d:	5b                   	pop    %ebx
  800e1e:	5e                   	pop    %esi
  800e1f:	5f                   	pop    %edi
  800e20:	5d                   	pop    %ebp
  800e21:	c3                   	ret
  800e22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800e28:	89 f9                	mov    %edi,%ecx
  800e2a:	85 ff                	test   %edi,%edi
  800e2c:	75 0b                	jne    800e39 <__umoddi3+0x89>
  800e2e:	b8 01 00 00 00       	mov    $0x1,%eax
  800e33:	31 d2                	xor    %edx,%edx
  800e35:	f7 f7                	div    %edi
  800e37:	89 c1                	mov    %eax,%ecx
  800e39:	89 d8                	mov    %ebx,%eax
  800e3b:	31 d2                	xor    %edx,%edx
  800e3d:	f7 f1                	div    %ecx
  800e3f:	89 f0                	mov    %esi,%eax
  800e41:	f7 f1                	div    %ecx
  800e43:	89 d0                	mov    %edx,%eax
  800e45:	31 d2                	xor    %edx,%edx
  800e47:	eb 94                	jmp    800ddd <__umoddi3+0x2d>
  800e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800e50:	89 e9                	mov    %ebp,%ecx
  800e52:	ba 20 00 00 00       	mov    $0x20,%edx
  800e57:	29 ea                	sub    %ebp,%edx
  800e59:	d3 e0                	shl    %cl,%eax
  800e5b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800e5f:	89 d1                	mov    %edx,%ecx
  800e61:	89 f8                	mov    %edi,%eax
  800e63:	d3 e8                	shr    %cl,%eax
  800e65:	89 54 24 04          	mov    %edx,0x4(%esp)
  800e69:	8b 54 24 04          	mov    0x4(%esp),%edx
  800e6d:	89 c1                	mov    %eax,%ecx
  800e6f:	8b 44 24 08          	mov    0x8(%esp),%eax
  800e73:	09 c1                	or     %eax,%ecx
  800e75:	89 d8                	mov    %ebx,%eax
  800e77:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800e7b:	89 e9                	mov    %ebp,%ecx
  800e7d:	d3 e7                	shl    %cl,%edi
  800e7f:	89 d1                	mov    %edx,%ecx
  800e81:	d3 e8                	shr    %cl,%eax
  800e83:	89 e9                	mov    %ebp,%ecx
  800e85:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800e89:	d3 e3                	shl    %cl,%ebx
  800e8b:	89 c7                	mov    %eax,%edi
  800e8d:	89 d1                	mov    %edx,%ecx
  800e8f:	89 f0                	mov    %esi,%eax
  800e91:	d3 e8                	shr    %cl,%eax
  800e93:	89 fa                	mov    %edi,%edx
  800e95:	89 e9                	mov    %ebp,%ecx
  800e97:	09 d8                	or     %ebx,%eax
  800e99:	d3 e6                	shl    %cl,%esi
  800e9b:	f7 74 24 08          	divl   0x8(%esp)
  800e9f:	89 d3                	mov    %edx,%ebx
  800ea1:	f7 64 24 0c          	mull   0xc(%esp)
  800ea5:	89 c7                	mov    %eax,%edi
  800ea7:	89 d1                	mov    %edx,%ecx
  800ea9:	39 d3                	cmp    %edx,%ebx
  800eab:	72 06                	jb     800eb3 <__umoddi3+0x103>
  800ead:	75 10                	jne    800ebf <__umoddi3+0x10f>
  800eaf:	39 c6                	cmp    %eax,%esi
  800eb1:	73 0c                	jae    800ebf <__umoddi3+0x10f>
  800eb3:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800eb7:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800ebb:	89 d1                	mov    %edx,%ecx
  800ebd:	89 c7                	mov    %eax,%edi
  800ebf:	89 f2                	mov    %esi,%edx
  800ec1:	29 fa                	sub    %edi,%edx
  800ec3:	19 cb                	sbb    %ecx,%ebx
  800ec5:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800eca:	89 d8                	mov    %ebx,%eax
  800ecc:	d3 e0                	shl    %cl,%eax
  800ece:	89 e9                	mov    %ebp,%ecx
  800ed0:	d3 ea                	shr    %cl,%edx
  800ed2:	d3 eb                	shr    %cl,%ebx
  800ed4:	09 d0                	or     %edx,%eax
  800ed6:	89 da                	mov    %ebx,%edx
  800ed8:	83 c4 1c             	add    $0x1c,%esp
  800edb:	5b                   	pop    %ebx
  800edc:	5e                   	pop    %esi
  800edd:	5f                   	pop    %edi
  800ede:	5d                   	pop    %ebp
  800edf:	c3                   	ret
  800ee0:	89 da                	mov    %ebx,%edx
  800ee2:	89 f1                	mov    %esi,%ecx
  800ee4:	29 f9                	sub    %edi,%ecx
  800ee6:	19 c2                	sbb    %eax,%edx
  800ee8:	89 c8                	mov    %ecx,%eax
  800eea:	e9 2b ff ff ff       	jmp    800e1a <__umoddi3+0x6a>
