
obj/user/faultalloc:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 99 00 00 00       	call   8000ca <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <handler>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	53                   	push   %ebx
  800037:	83 ec 0c             	sub    $0xc,%esp
  80003a:	8b 45 08             	mov    0x8(%ebp),%eax
  80003d:	8b 18                	mov    (%eax),%ebx
  80003f:	53                   	push   %ebx
  800040:	68 60 0f 80 00       	push   $0x800f60
  800045:	e8 ba 01 00 00       	call   800204 <cprintf>
  80004a:	83 c4 0c             	add    $0xc,%esp
  80004d:	6a 07                	push   $0x7
  80004f:	89 d8                	mov    %ebx,%eax
  800051:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  800056:	50                   	push   %eax
  800057:	6a 00                	push   $0x0
  800059:	e8 1f 0b 00 00       	call   800b7d <sys_page_alloc>
  80005e:	83 c4 10             	add    $0x10,%esp
  800061:	85 c0                	test   %eax,%eax
  800063:	78 16                	js     80007b <handler+0x48>
  800065:	53                   	push   %ebx
  800066:	68 98 10 80 00       	push   $0x801098
  80006b:	6a 64                	push   $0x64
  80006d:	53                   	push   %ebx
  80006e:	e8 81 06 00 00       	call   8006f4 <snprintf>
  800073:	83 c4 10             	add    $0x10,%esp
  800076:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800079:	c9                   	leave
  80007a:	c3                   	ret
  80007b:	83 ec 0c             	sub    $0xc,%esp
  80007e:	50                   	push   %eax
  80007f:	53                   	push   %ebx
  800080:	68 6c 10 80 00       	push   $0x80106c
  800085:	6a 0e                	push   $0xe
  800087:	68 6a 0f 80 00       	push   $0x800f6a
  80008c:	e8 98 00 00 00       	call   800129 <_panic>

00800091 <umain>:
  800091:	55                   	push   %ebp
  800092:	89 e5                	mov    %esp,%ebp
  800094:	83 ec 14             	sub    $0x14,%esp
  800097:	68 33 00 80 00       	push   $0x800033
  80009c:	e8 d6 0b 00 00       	call   800c77 <set_pgfault_handler>
  8000a1:	83 c4 08             	add    $0x8,%esp
  8000a4:	68 ef be ad de       	push   $0xdeadbeef
  8000a9:	68 7c 0f 80 00       	push   $0x800f7c
  8000ae:	e8 51 01 00 00       	call   800204 <cprintf>
  8000b3:	83 c4 08             	add    $0x8,%esp
  8000b6:	68 fe bf fe ca       	push   $0xcafebffe
  8000bb:	68 7c 0f 80 00       	push   $0x800f7c
  8000c0:	e8 3f 01 00 00       	call   800204 <cprintf>
  8000c5:	83 c4 10             	add    $0x10,%esp
  8000c8:	c9                   	leave
  8000c9:	c3                   	ret

008000ca <libmain>:
  8000ca:	55                   	push   %ebp
  8000cb:	89 e5                	mov    %esp,%ebp
  8000cd:	56                   	push   %esi
  8000ce:	53                   	push   %ebx
  8000cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000d2:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000d5:	e8 58 0a 00 00       	call   800b32 <sys_getenvid>
  8000da:	85 c0                	test   %eax,%eax
  8000dc:	78 15                	js     8000f3 <libmain+0x29>
  8000de:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000e3:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8000e9:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8000ee:	a3 04 20 80 00       	mov    %eax,0x802004
  8000f3:	85 db                	test   %ebx,%ebx
  8000f5:	7e 07                	jle    8000fe <libmain+0x34>
  8000f7:	8b 06                	mov    (%esi),%eax
  8000f9:	a3 00 20 80 00       	mov    %eax,0x802000
  8000fe:	83 ec 08             	sub    $0x8,%esp
  800101:	56                   	push   %esi
  800102:	53                   	push   %ebx
  800103:	e8 89 ff ff ff       	call   800091 <umain>
  800108:	e8 0a 00 00 00       	call   800117 <exit>
  80010d:	83 c4 10             	add    $0x10,%esp
  800110:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800113:	5b                   	pop    %ebx
  800114:	5e                   	pop    %esi
  800115:	5d                   	pop    %ebp
  800116:	c3                   	ret

00800117 <exit>:
  800117:	55                   	push   %ebp
  800118:	89 e5                	mov    %esp,%ebp
  80011a:	83 ec 14             	sub    $0x14,%esp
  80011d:	6a 00                	push   $0x0
  80011f:	e8 ec 09 00 00       	call   800b10 <sys_env_destroy>
  800124:	83 c4 10             	add    $0x10,%esp
  800127:	c9                   	leave
  800128:	c3                   	ret

00800129 <_panic>:
  800129:	55                   	push   %ebp
  80012a:	89 e5                	mov    %esp,%ebp
  80012c:	56                   	push   %esi
  80012d:	53                   	push   %ebx
  80012e:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800131:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800137:	e8 f6 09 00 00       	call   800b32 <sys_getenvid>
  80013c:	83 ec 0c             	sub    $0xc,%esp
  80013f:	ff 75 0c             	push   0xc(%ebp)
  800142:	ff 75 08             	push   0x8(%ebp)
  800145:	56                   	push   %esi
  800146:	50                   	push   %eax
  800147:	68 bc 10 80 00       	push   $0x8010bc
  80014c:	e8 b3 00 00 00       	call   800204 <cprintf>
  800151:	83 c4 18             	add    $0x18,%esp
  800154:	53                   	push   %ebx
  800155:	ff 75 10             	push   0x10(%ebp)
  800158:	e8 56 00 00 00       	call   8001b3 <vcprintf>
  80015d:	c7 04 24 7e 0f 80 00 	movl   $0x800f7e,(%esp)
  800164:	e8 9b 00 00 00       	call   800204 <cprintf>
  800169:	83 c4 10             	add    $0x10,%esp
  80016c:	cc                   	int3
  80016d:	eb fd                	jmp    80016c <_panic+0x43>

0080016f <putch>:
  80016f:	55                   	push   %ebp
  800170:	89 e5                	mov    %esp,%ebp
  800172:	53                   	push   %ebx
  800173:	83 ec 04             	sub    $0x4,%esp
  800176:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800179:	8b 13                	mov    (%ebx),%edx
  80017b:	8d 42 01             	lea    0x1(%edx),%eax
  80017e:	89 03                	mov    %eax,(%ebx)
  800180:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800183:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800187:	3d ff 00 00 00       	cmp    $0xff,%eax
  80018c:	74 09                	je     800197 <putch+0x28>
  80018e:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800192:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800195:	c9                   	leave
  800196:	c3                   	ret
  800197:	83 ec 08             	sub    $0x8,%esp
  80019a:	68 ff 00 00 00       	push   $0xff
  80019f:	8d 43 08             	lea    0x8(%ebx),%eax
  8001a2:	50                   	push   %eax
  8001a3:	e8 1e 09 00 00       	call   800ac6 <sys_cputs>
  8001a8:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8001ae:	83 c4 10             	add    $0x10,%esp
  8001b1:	eb db                	jmp    80018e <putch+0x1f>

008001b3 <vcprintf>:
  8001b3:	55                   	push   %ebp
  8001b4:	89 e5                	mov    %esp,%ebp
  8001b6:	81 ec 18 01 00 00    	sub    $0x118,%esp
  8001bc:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  8001c3:	00 00 00 
  8001c6:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  8001cd:	00 00 00 
  8001d0:	ff 75 0c             	push   0xc(%ebp)
  8001d3:	ff 75 08             	push   0x8(%ebp)
  8001d6:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  8001dc:	50                   	push   %eax
  8001dd:	68 6f 01 80 00       	push   $0x80016f
  8001e2:	e8 74 01 00 00       	call   80035b <vprintfmt>
  8001e7:	83 c4 08             	add    $0x8,%esp
  8001ea:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  8001f0:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  8001f6:	50                   	push   %eax
  8001f7:	e8 ca 08 00 00       	call   800ac6 <sys_cputs>
  8001fc:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800202:	c9                   	leave
  800203:	c3                   	ret

00800204 <cprintf>:
  800204:	55                   	push   %ebp
  800205:	89 e5                	mov    %esp,%ebp
  800207:	83 ec 10             	sub    $0x10,%esp
  80020a:	8d 45 0c             	lea    0xc(%ebp),%eax
  80020d:	50                   	push   %eax
  80020e:	ff 75 08             	push   0x8(%ebp)
  800211:	e8 9d ff ff ff       	call   8001b3 <vcprintf>
  800216:	c9                   	leave
  800217:	c3                   	ret

00800218 <printnum>:
  800218:	55                   	push   %ebp
  800219:	89 e5                	mov    %esp,%ebp
  80021b:	57                   	push   %edi
  80021c:	56                   	push   %esi
  80021d:	53                   	push   %ebx
  80021e:	83 ec 1c             	sub    $0x1c,%esp
  800221:	89 c7                	mov    %eax,%edi
  800223:	89 d6                	mov    %edx,%esi
  800225:	8b 45 08             	mov    0x8(%ebp),%eax
  800228:	8b 55 0c             	mov    0xc(%ebp),%edx
  80022b:	89 d1                	mov    %edx,%ecx
  80022d:	89 c2                	mov    %eax,%edx
  80022f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800232:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800235:	8b 45 10             	mov    0x10(%ebp),%eax
  800238:	8b 5d 14             	mov    0x14(%ebp),%ebx
  80023b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80023e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800245:	39 c2                	cmp    %eax,%edx
  800247:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  80024a:	72 3e                	jb     80028a <printnum+0x72>
  80024c:	83 ec 0c             	sub    $0xc,%esp
  80024f:	ff 75 18             	push   0x18(%ebp)
  800252:	83 eb 01             	sub    $0x1,%ebx
  800255:	53                   	push   %ebx
  800256:	50                   	push   %eax
  800257:	83 ec 08             	sub    $0x8,%esp
  80025a:	ff 75 e4             	push   -0x1c(%ebp)
  80025d:	ff 75 e0             	push   -0x20(%ebp)
  800260:	ff 75 dc             	push   -0x24(%ebp)
  800263:	ff 75 d8             	push   -0x28(%ebp)
  800266:	e8 85 0a 00 00       	call   800cf0 <__udivdi3>
  80026b:	83 c4 18             	add    $0x18,%esp
  80026e:	52                   	push   %edx
  80026f:	50                   	push   %eax
  800270:	89 f2                	mov    %esi,%edx
  800272:	89 f8                	mov    %edi,%eax
  800274:	e8 9f ff ff ff       	call   800218 <printnum>
  800279:	83 c4 20             	add    $0x20,%esp
  80027c:	eb 13                	jmp    800291 <printnum+0x79>
  80027e:	83 ec 08             	sub    $0x8,%esp
  800281:	56                   	push   %esi
  800282:	ff 75 18             	push   0x18(%ebp)
  800285:	ff d7                	call   *%edi
  800287:	83 c4 10             	add    $0x10,%esp
  80028a:	83 eb 01             	sub    $0x1,%ebx
  80028d:	85 db                	test   %ebx,%ebx
  80028f:	7f ed                	jg     80027e <printnum+0x66>
  800291:	83 ec 08             	sub    $0x8,%esp
  800294:	56                   	push   %esi
  800295:	83 ec 04             	sub    $0x4,%esp
  800298:	ff 75 e4             	push   -0x1c(%ebp)
  80029b:	ff 75 e0             	push   -0x20(%ebp)
  80029e:	ff 75 dc             	push   -0x24(%ebp)
  8002a1:	ff 75 d8             	push   -0x28(%ebp)
  8002a4:	e8 67 0b 00 00       	call   800e10 <__umoddi3>
  8002a9:	83 c4 14             	add    $0x14,%esp
  8002ac:	0f be 80 8a 0f 80 00 	movsbl 0x800f8a(%eax),%eax
  8002b3:	50                   	push   %eax
  8002b4:	ff d7                	call   *%edi
  8002b6:	83 c4 10             	add    $0x10,%esp
  8002b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002bc:	5b                   	pop    %ebx
  8002bd:	5e                   	pop    %esi
  8002be:	5f                   	pop    %edi
  8002bf:	5d                   	pop    %ebp
  8002c0:	c3                   	ret

008002c1 <getuint>:
  8002c1:	83 fa 01             	cmp    $0x1,%edx
  8002c4:	7f 13                	jg     8002d9 <getuint+0x18>
  8002c6:	85 d2                	test   %edx,%edx
  8002c8:	74 1c                	je     8002e6 <getuint+0x25>
  8002ca:	8b 10                	mov    (%eax),%edx
  8002cc:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002cf:	89 08                	mov    %ecx,(%eax)
  8002d1:	8b 02                	mov    (%edx),%eax
  8002d3:	ba 00 00 00 00       	mov    $0x0,%edx
  8002d8:	c3                   	ret
  8002d9:	8b 10                	mov    (%eax),%edx
  8002db:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002de:	89 08                	mov    %ecx,(%eax)
  8002e0:	8b 02                	mov    (%edx),%eax
  8002e2:	8b 52 04             	mov    0x4(%edx),%edx
  8002e5:	c3                   	ret
  8002e6:	8b 10                	mov    (%eax),%edx
  8002e8:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002eb:	89 08                	mov    %ecx,(%eax)
  8002ed:	8b 02                	mov    (%edx),%eax
  8002ef:	ba 00 00 00 00       	mov    $0x0,%edx
  8002f4:	c3                   	ret

008002f5 <getint>:
  8002f5:	83 fa 01             	cmp    $0x1,%edx
  8002f8:	7f 0f                	jg     800309 <getint+0x14>
  8002fa:	85 d2                	test   %edx,%edx
  8002fc:	74 18                	je     800316 <getint+0x21>
  8002fe:	8b 10                	mov    (%eax),%edx
  800300:	8d 4a 04             	lea    0x4(%edx),%ecx
  800303:	89 08                	mov    %ecx,(%eax)
  800305:	8b 02                	mov    (%edx),%eax
  800307:	99                   	cltd
  800308:	c3                   	ret
  800309:	8b 10                	mov    (%eax),%edx
  80030b:	8d 4a 08             	lea    0x8(%edx),%ecx
  80030e:	89 08                	mov    %ecx,(%eax)
  800310:	8b 02                	mov    (%edx),%eax
  800312:	8b 52 04             	mov    0x4(%edx),%edx
  800315:	c3                   	ret
  800316:	8b 10                	mov    (%eax),%edx
  800318:	8d 4a 04             	lea    0x4(%edx),%ecx
  80031b:	89 08                	mov    %ecx,(%eax)
  80031d:	8b 02                	mov    (%edx),%eax
  80031f:	99                   	cltd
  800320:	c3                   	ret

00800321 <sprintputch>:
  800321:	55                   	push   %ebp
  800322:	89 e5                	mov    %esp,%ebp
  800324:	8b 45 0c             	mov    0xc(%ebp),%eax
  800327:	83 40 08 01          	addl   $0x1,0x8(%eax)
  80032b:	8b 10                	mov    (%eax),%edx
  80032d:	3b 50 04             	cmp    0x4(%eax),%edx
  800330:	73 0a                	jae    80033c <sprintputch+0x1b>
  800332:	8d 4a 01             	lea    0x1(%edx),%ecx
  800335:	89 08                	mov    %ecx,(%eax)
  800337:	8b 45 08             	mov    0x8(%ebp),%eax
  80033a:	88 02                	mov    %al,(%edx)
  80033c:	5d                   	pop    %ebp
  80033d:	c3                   	ret

0080033e <printfmt>:
  80033e:	55                   	push   %ebp
  80033f:	89 e5                	mov    %esp,%ebp
  800341:	83 ec 08             	sub    $0x8,%esp
  800344:	8d 45 14             	lea    0x14(%ebp),%eax
  800347:	50                   	push   %eax
  800348:	ff 75 10             	push   0x10(%ebp)
  80034b:	ff 75 0c             	push   0xc(%ebp)
  80034e:	ff 75 08             	push   0x8(%ebp)
  800351:	e8 05 00 00 00       	call   80035b <vprintfmt>
  800356:	83 c4 10             	add    $0x10,%esp
  800359:	c9                   	leave
  80035a:	c3                   	ret

0080035b <vprintfmt>:
  80035b:	55                   	push   %ebp
  80035c:	89 e5                	mov    %esp,%ebp
  80035e:	57                   	push   %edi
  80035f:	56                   	push   %esi
  800360:	53                   	push   %ebx
  800361:	83 ec 2c             	sub    $0x2c,%esp
  800364:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800367:	8b 75 0c             	mov    0xc(%ebp),%esi
  80036a:	8b 7d 10             	mov    0x10(%ebp),%edi
  80036d:	eb 0a                	jmp    800379 <vprintfmt+0x1e>
  80036f:	83 ec 08             	sub    $0x8,%esp
  800372:	56                   	push   %esi
  800373:	50                   	push   %eax
  800374:	ff d3                	call   *%ebx
  800376:	83 c4 10             	add    $0x10,%esp
  800379:	83 c7 01             	add    $0x1,%edi
  80037c:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800380:	83 f8 25             	cmp    $0x25,%eax
  800383:	74 0c                	je     800391 <vprintfmt+0x36>
  800385:	85 c0                	test   %eax,%eax
  800387:	75 e6                	jne    80036f <vprintfmt+0x14>
  800389:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80038c:	5b                   	pop    %ebx
  80038d:	5e                   	pop    %esi
  80038e:	5f                   	pop    %edi
  80038f:	5d                   	pop    %ebp
  800390:	c3                   	ret
  800391:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800395:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80039c:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003a3:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  8003aa:	b9 00 00 00 00       	mov    $0x0,%ecx
  8003af:	8d 47 01             	lea    0x1(%edi),%eax
  8003b2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8003b5:	0f b6 17             	movzbl (%edi),%edx
  8003b8:	8d 42 dd             	lea    -0x23(%edx),%eax
  8003bb:	3c 55                	cmp    $0x55,%al
  8003bd:	0f 87 c3 02 00 00    	ja     800686 <vprintfmt+0x32b>
  8003c3:	0f b6 c0             	movzbl %al,%eax
  8003c6:	ff 24 85 e0 10 80 00 	jmp    *0x8010e0(,%eax,4)
  8003cd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003d0:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  8003d4:	eb d9                	jmp    8003af <vprintfmt+0x54>
  8003d6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003d9:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  8003dd:	eb d0                	jmp    8003af <vprintfmt+0x54>
  8003df:	0f b6 d2             	movzbl %dl,%edx
  8003e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8003ea:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  8003ed:	8d 04 80             	lea    (%eax,%eax,4),%eax
  8003f0:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  8003f4:	0f be 17             	movsbl (%edi),%edx
  8003f7:	8d 4a d0             	lea    -0x30(%edx),%ecx
  8003fa:	83 f9 09             	cmp    $0x9,%ecx
  8003fd:	77 52                	ja     800451 <vprintfmt+0xf6>
  8003ff:	83 c7 01             	add    $0x1,%edi
  800402:	eb e9                	jmp    8003ed <vprintfmt+0x92>
  800404:	8b 45 14             	mov    0x14(%ebp),%eax
  800407:	8d 50 04             	lea    0x4(%eax),%edx
  80040a:	89 55 14             	mov    %edx,0x14(%ebp)
  80040d:	8b 00                	mov    (%eax),%eax
  80040f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800412:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800415:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800419:	79 94                	jns    8003af <vprintfmt+0x54>
  80041b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  80041e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800421:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800428:	eb 85                	jmp    8003af <vprintfmt+0x54>
  80042a:	8b 55 e0             	mov    -0x20(%ebp),%edx
  80042d:	85 d2                	test   %edx,%edx
  80042f:	b8 00 00 00 00       	mov    $0x0,%eax
  800434:	0f 49 c2             	cmovns %edx,%eax
  800437:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80043a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80043d:	e9 6d ff ff ff       	jmp    8003af <vprintfmt+0x54>
  800442:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800445:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  80044c:	e9 5e ff ff ff       	jmp    8003af <vprintfmt+0x54>
  800451:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  800454:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800457:	eb bc                	jmp    800415 <vprintfmt+0xba>
  800459:	83 c1 01             	add    $0x1,%ecx
  80045c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80045f:	e9 4b ff ff ff       	jmp    8003af <vprintfmt+0x54>
  800464:	8b 45 14             	mov    0x14(%ebp),%eax
  800467:	8d 50 04             	lea    0x4(%eax),%edx
  80046a:	89 55 14             	mov    %edx,0x14(%ebp)
  80046d:	83 ec 08             	sub    $0x8,%esp
  800470:	56                   	push   %esi
  800471:	ff 30                	push   (%eax)
  800473:	ff d3                	call   *%ebx
  800475:	83 c4 10             	add    $0x10,%esp
  800478:	e9 a0 01 00 00       	jmp    80061d <vprintfmt+0x2c2>
  80047d:	8b 45 14             	mov    0x14(%ebp),%eax
  800480:	8d 50 04             	lea    0x4(%eax),%edx
  800483:	89 55 14             	mov    %edx,0x14(%ebp)
  800486:	8b 10                	mov    (%eax),%edx
  800488:	89 d0                	mov    %edx,%eax
  80048a:	f7 d8                	neg    %eax
  80048c:	0f 48 c2             	cmovs  %edx,%eax
  80048f:	83 f8 08             	cmp    $0x8,%eax
  800492:	7f 20                	jg     8004b4 <vprintfmt+0x159>
  800494:	8b 14 85 40 12 80 00 	mov    0x801240(,%eax,4),%edx
  80049b:	85 d2                	test   %edx,%edx
  80049d:	74 15                	je     8004b4 <vprintfmt+0x159>
  80049f:	52                   	push   %edx
  8004a0:	68 ab 0f 80 00       	push   $0x800fab
  8004a5:	56                   	push   %esi
  8004a6:	53                   	push   %ebx
  8004a7:	e8 92 fe ff ff       	call   80033e <printfmt>
  8004ac:	83 c4 10             	add    $0x10,%esp
  8004af:	e9 69 01 00 00       	jmp    80061d <vprintfmt+0x2c2>
  8004b4:	50                   	push   %eax
  8004b5:	68 a2 0f 80 00       	push   $0x800fa2
  8004ba:	56                   	push   %esi
  8004bb:	53                   	push   %ebx
  8004bc:	e8 7d fe ff ff       	call   80033e <printfmt>
  8004c1:	83 c4 10             	add    $0x10,%esp
  8004c4:	e9 54 01 00 00       	jmp    80061d <vprintfmt+0x2c2>
  8004c9:	8b 45 14             	mov    0x14(%ebp),%eax
  8004cc:	8d 50 04             	lea    0x4(%eax),%edx
  8004cf:	89 55 14             	mov    %edx,0x14(%ebp)
  8004d2:	8b 08                	mov    (%eax),%ecx
  8004d4:	85 c9                	test   %ecx,%ecx
  8004d6:	b8 9b 0f 80 00       	mov    $0x800f9b,%eax
  8004db:	0f 45 c1             	cmovne %ecx,%eax
  8004de:	89 45 cc             	mov    %eax,-0x34(%ebp)
  8004e1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8004e5:	7e 06                	jle    8004ed <vprintfmt+0x192>
  8004e7:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  8004eb:	75 0b                	jne    8004f8 <vprintfmt+0x19d>
  8004ed:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  8004f0:	8b 7d d0             	mov    -0x30(%ebp),%edi
  8004f3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004f6:	eb 5c                	jmp    800554 <vprintfmt+0x1f9>
  8004f8:	83 ec 08             	sub    $0x8,%esp
  8004fb:	ff 75 d0             	push   -0x30(%ebp)
  8004fe:	ff 75 cc             	push   -0x34(%ebp)
  800501:	e8 20 02 00 00       	call   800726 <strnlen>
  800506:	89 c2                	mov    %eax,%edx
  800508:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80050b:	29 d0                	sub    %edx,%eax
  80050d:	83 c4 10             	add    $0x10,%esp
  800510:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800514:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800517:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80051a:	89 c3                	mov    %eax,%ebx
  80051c:	eb 0e                	jmp    80052c <vprintfmt+0x1d1>
  80051e:	83 ec 08             	sub    $0x8,%esp
  800521:	56                   	push   %esi
  800522:	57                   	push   %edi
  800523:	ff 55 08             	call   *0x8(%ebp)
  800526:	83 eb 01             	sub    $0x1,%ebx
  800529:	83 c4 10             	add    $0x10,%esp
  80052c:	85 db                	test   %ebx,%ebx
  80052e:	7f ee                	jg     80051e <vprintfmt+0x1c3>
  800530:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800533:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800536:	85 c0                	test   %eax,%eax
  800538:	ba 00 00 00 00       	mov    $0x0,%edx
  80053d:	0f 49 d0             	cmovns %eax,%edx
  800540:	29 d0                	sub    %edx,%eax
  800542:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800545:	eb a6                	jmp    8004ed <vprintfmt+0x192>
  800547:	83 ec 08             	sub    $0x8,%esp
  80054a:	56                   	push   %esi
  80054b:	52                   	push   %edx
  80054c:	ff 55 08             	call   *0x8(%ebp)
  80054f:	83 c4 10             	add    $0x10,%esp
  800552:	89 d9                	mov    %ebx,%ecx
  800554:	8d 59 01             	lea    0x1(%ecx),%ebx
  800557:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  80055b:	0f be d0             	movsbl %al,%edx
  80055e:	85 d2                	test   %edx,%edx
  800560:	74 28                	je     80058a <vprintfmt+0x22f>
  800562:	85 ff                	test   %edi,%edi
  800564:	78 05                	js     80056b <vprintfmt+0x210>
  800566:	83 ef 01             	sub    $0x1,%edi
  800569:	78 2e                	js     800599 <vprintfmt+0x23e>
  80056b:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  80056f:	74 d6                	je     800547 <vprintfmt+0x1ec>
  800571:	0f be c0             	movsbl %al,%eax
  800574:	83 e8 20             	sub    $0x20,%eax
  800577:	83 f8 5e             	cmp    $0x5e,%eax
  80057a:	76 cb                	jbe    800547 <vprintfmt+0x1ec>
  80057c:	83 ec 08             	sub    $0x8,%esp
  80057f:	56                   	push   %esi
  800580:	6a 3f                	push   $0x3f
  800582:	ff 55 08             	call   *0x8(%ebp)
  800585:	83 c4 10             	add    $0x10,%esp
  800588:	eb c8                	jmp    800552 <vprintfmt+0x1f7>
  80058a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80058d:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800590:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800593:	01 c7                	add    %eax,%edi
  800595:	29 cf                	sub    %ecx,%edi
  800597:	eb 13                	jmp    8005ac <vprintfmt+0x251>
  800599:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80059c:	eb ef                	jmp    80058d <vprintfmt+0x232>
  80059e:	83 ec 08             	sub    $0x8,%esp
  8005a1:	56                   	push   %esi
  8005a2:	6a 20                	push   $0x20
  8005a4:	ff d3                	call   *%ebx
  8005a6:	83 ef 01             	sub    $0x1,%edi
  8005a9:	83 c4 10             	add    $0x10,%esp
  8005ac:	85 ff                	test   %edi,%edi
  8005ae:	7f ee                	jg     80059e <vprintfmt+0x243>
  8005b0:	eb 6b                	jmp    80061d <vprintfmt+0x2c2>
  8005b2:	89 ca                	mov    %ecx,%edx
  8005b4:	8d 45 14             	lea    0x14(%ebp),%eax
  8005b7:	e8 39 fd ff ff       	call   8002f5 <getint>
  8005bc:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8005bf:	89 55 dc             	mov    %edx,-0x24(%ebp)
  8005c2:	85 d2                	test   %edx,%edx
  8005c4:	78 0b                	js     8005d1 <vprintfmt+0x276>
  8005c6:	89 d1                	mov    %edx,%ecx
  8005c8:	89 c2                	mov    %eax,%edx
  8005ca:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005cf:	eb 32                	jmp    800603 <vprintfmt+0x2a8>
  8005d1:	83 ec 08             	sub    $0x8,%esp
  8005d4:	56                   	push   %esi
  8005d5:	6a 2d                	push   $0x2d
  8005d7:	ff d3                	call   *%ebx
  8005d9:	8b 55 d8             	mov    -0x28(%ebp),%edx
  8005dc:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  8005df:	f7 da                	neg    %edx
  8005e1:	83 d1 00             	adc    $0x0,%ecx
  8005e4:	f7 d9                	neg    %ecx
  8005e6:	83 c4 10             	add    $0x10,%esp
  8005e9:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005ee:	eb 13                	jmp    800603 <vprintfmt+0x2a8>
  8005f0:	89 ca                	mov    %ecx,%edx
  8005f2:	8d 45 14             	lea    0x14(%ebp),%eax
  8005f5:	e8 c7 fc ff ff       	call   8002c1 <getuint>
  8005fa:	89 d1                	mov    %edx,%ecx
  8005fc:	89 c2                	mov    %eax,%edx
  8005fe:	bf 0a 00 00 00       	mov    $0xa,%edi
  800603:	83 ec 0c             	sub    $0xc,%esp
  800606:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80060a:	50                   	push   %eax
  80060b:	ff 75 e0             	push   -0x20(%ebp)
  80060e:	57                   	push   %edi
  80060f:	51                   	push   %ecx
  800610:	52                   	push   %edx
  800611:	89 f2                	mov    %esi,%edx
  800613:	89 d8                	mov    %ebx,%eax
  800615:	e8 fe fb ff ff       	call   800218 <printnum>
  80061a:	83 c4 20             	add    $0x20,%esp
  80061d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800620:	e9 54 fd ff ff       	jmp    800379 <vprintfmt+0x1e>
  800625:	89 ca                	mov    %ecx,%edx
  800627:	8d 45 14             	lea    0x14(%ebp),%eax
  80062a:	e8 92 fc ff ff       	call   8002c1 <getuint>
  80062f:	89 d1                	mov    %edx,%ecx
  800631:	89 c2                	mov    %eax,%edx
  800633:	bf 08 00 00 00       	mov    $0x8,%edi
  800638:	eb c9                	jmp    800603 <vprintfmt+0x2a8>
  80063a:	83 ec 08             	sub    $0x8,%esp
  80063d:	56                   	push   %esi
  80063e:	6a 30                	push   $0x30
  800640:	ff d3                	call   *%ebx
  800642:	83 c4 08             	add    $0x8,%esp
  800645:	56                   	push   %esi
  800646:	6a 78                	push   $0x78
  800648:	ff d3                	call   *%ebx
  80064a:	8b 45 14             	mov    0x14(%ebp),%eax
  80064d:	8d 50 04             	lea    0x4(%eax),%edx
  800650:	89 55 14             	mov    %edx,0x14(%ebp)
  800653:	8b 10                	mov    (%eax),%edx
  800655:	b9 00 00 00 00       	mov    $0x0,%ecx
  80065a:	83 c4 10             	add    $0x10,%esp
  80065d:	bf 10 00 00 00       	mov    $0x10,%edi
  800662:	eb 9f                	jmp    800603 <vprintfmt+0x2a8>
  800664:	89 ca                	mov    %ecx,%edx
  800666:	8d 45 14             	lea    0x14(%ebp),%eax
  800669:	e8 53 fc ff ff       	call   8002c1 <getuint>
  80066e:	89 d1                	mov    %edx,%ecx
  800670:	89 c2                	mov    %eax,%edx
  800672:	bf 10 00 00 00       	mov    $0x10,%edi
  800677:	eb 8a                	jmp    800603 <vprintfmt+0x2a8>
  800679:	83 ec 08             	sub    $0x8,%esp
  80067c:	56                   	push   %esi
  80067d:	6a 25                	push   $0x25
  80067f:	ff d3                	call   *%ebx
  800681:	83 c4 10             	add    $0x10,%esp
  800684:	eb 97                	jmp    80061d <vprintfmt+0x2c2>
  800686:	83 ec 08             	sub    $0x8,%esp
  800689:	56                   	push   %esi
  80068a:	6a 25                	push   $0x25
  80068c:	ff d3                	call   *%ebx
  80068e:	83 c4 10             	add    $0x10,%esp
  800691:	89 f8                	mov    %edi,%eax
  800693:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800697:	74 05                	je     80069e <vprintfmt+0x343>
  800699:	83 e8 01             	sub    $0x1,%eax
  80069c:	eb f5                	jmp    800693 <vprintfmt+0x338>
  80069e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8006a1:	e9 77 ff ff ff       	jmp    80061d <vprintfmt+0x2c2>

008006a6 <vsnprintf>:
  8006a6:	55                   	push   %ebp
  8006a7:	89 e5                	mov    %esp,%ebp
  8006a9:	83 ec 18             	sub    $0x18,%esp
  8006ac:	8b 45 08             	mov    0x8(%ebp),%eax
  8006af:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  8006b5:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  8006b9:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  8006bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  8006c3:	85 c0                	test   %eax,%eax
  8006c5:	74 26                	je     8006ed <vsnprintf+0x47>
  8006c7:	85 d2                	test   %edx,%edx
  8006c9:	7e 22                	jle    8006ed <vsnprintf+0x47>
  8006cb:	ff 75 14             	push   0x14(%ebp)
  8006ce:	ff 75 10             	push   0x10(%ebp)
  8006d1:	8d 45 ec             	lea    -0x14(%ebp),%eax
  8006d4:	50                   	push   %eax
  8006d5:	68 21 03 80 00       	push   $0x800321
  8006da:	e8 7c fc ff ff       	call   80035b <vprintfmt>
  8006df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  8006e2:	c6 00 00             	movb   $0x0,(%eax)
  8006e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  8006e8:	83 c4 10             	add    $0x10,%esp
  8006eb:	c9                   	leave
  8006ec:	c3                   	ret
  8006ed:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8006f2:	eb f7                	jmp    8006eb <vsnprintf+0x45>

008006f4 <snprintf>:
  8006f4:	55                   	push   %ebp
  8006f5:	89 e5                	mov    %esp,%ebp
  8006f7:	83 ec 08             	sub    $0x8,%esp
  8006fa:	8d 45 14             	lea    0x14(%ebp),%eax
  8006fd:	50                   	push   %eax
  8006fe:	ff 75 10             	push   0x10(%ebp)
  800701:	ff 75 0c             	push   0xc(%ebp)
  800704:	ff 75 08             	push   0x8(%ebp)
  800707:	e8 9a ff ff ff       	call   8006a6 <vsnprintf>
  80070c:	c9                   	leave
  80070d:	c3                   	ret

0080070e <strlen>:
  80070e:	55                   	push   %ebp
  80070f:	89 e5                	mov    %esp,%ebp
  800711:	8b 55 08             	mov    0x8(%ebp),%edx
  800714:	b8 00 00 00 00       	mov    $0x0,%eax
  800719:	eb 03                	jmp    80071e <strlen+0x10>
  80071b:	83 c0 01             	add    $0x1,%eax
  80071e:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800722:	75 f7                	jne    80071b <strlen+0xd>
  800724:	5d                   	pop    %ebp
  800725:	c3                   	ret

00800726 <strnlen>:
  800726:	55                   	push   %ebp
  800727:	89 e5                	mov    %esp,%ebp
  800729:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80072c:	8b 55 0c             	mov    0xc(%ebp),%edx
  80072f:	b8 00 00 00 00       	mov    $0x0,%eax
  800734:	eb 03                	jmp    800739 <strnlen+0x13>
  800736:	83 c0 01             	add    $0x1,%eax
  800739:	39 d0                	cmp    %edx,%eax
  80073b:	74 08                	je     800745 <strnlen+0x1f>
  80073d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  800741:	75 f3                	jne    800736 <strnlen+0x10>
  800743:	89 c2                	mov    %eax,%edx
  800745:	89 d0                	mov    %edx,%eax
  800747:	5d                   	pop    %ebp
  800748:	c3                   	ret

00800749 <strcpy>:
  800749:	55                   	push   %ebp
  80074a:	89 e5                	mov    %esp,%ebp
  80074c:	53                   	push   %ebx
  80074d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800750:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800753:	b8 00 00 00 00       	mov    $0x0,%eax
  800758:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  80075c:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  80075f:	83 c0 01             	add    $0x1,%eax
  800762:	84 d2                	test   %dl,%dl
  800764:	75 f2                	jne    800758 <strcpy+0xf>
  800766:	89 c8                	mov    %ecx,%eax
  800768:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80076b:	c9                   	leave
  80076c:	c3                   	ret

0080076d <strcat>:
  80076d:	55                   	push   %ebp
  80076e:	89 e5                	mov    %esp,%ebp
  800770:	53                   	push   %ebx
  800771:	83 ec 10             	sub    $0x10,%esp
  800774:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800777:	53                   	push   %ebx
  800778:	e8 91 ff ff ff       	call   80070e <strlen>
  80077d:	83 c4 08             	add    $0x8,%esp
  800780:	ff 75 0c             	push   0xc(%ebp)
  800783:	01 d8                	add    %ebx,%eax
  800785:	50                   	push   %eax
  800786:	e8 be ff ff ff       	call   800749 <strcpy>
  80078b:	89 d8                	mov    %ebx,%eax
  80078d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800790:	c9                   	leave
  800791:	c3                   	ret

00800792 <strncpy>:
  800792:	55                   	push   %ebp
  800793:	89 e5                	mov    %esp,%ebp
  800795:	56                   	push   %esi
  800796:	53                   	push   %ebx
  800797:	8b 75 08             	mov    0x8(%ebp),%esi
  80079a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80079d:	89 f3                	mov    %esi,%ebx
  80079f:	03 5d 10             	add    0x10(%ebp),%ebx
  8007a2:	89 f0                	mov    %esi,%eax
  8007a4:	eb 0f                	jmp    8007b5 <strncpy+0x23>
  8007a6:	83 c0 01             	add    $0x1,%eax
  8007a9:	0f b6 0a             	movzbl (%edx),%ecx
  8007ac:	88 48 ff             	mov    %cl,-0x1(%eax)
  8007af:	80 f9 01             	cmp    $0x1,%cl
  8007b2:	83 da ff             	sbb    $0xffffffff,%edx
  8007b5:	39 d8                	cmp    %ebx,%eax
  8007b7:	75 ed                	jne    8007a6 <strncpy+0x14>
  8007b9:	89 f0                	mov    %esi,%eax
  8007bb:	5b                   	pop    %ebx
  8007bc:	5e                   	pop    %esi
  8007bd:	5d                   	pop    %ebp
  8007be:	c3                   	ret

008007bf <strlcpy>:
  8007bf:	55                   	push   %ebp
  8007c0:	89 e5                	mov    %esp,%ebp
  8007c2:	56                   	push   %esi
  8007c3:	53                   	push   %ebx
  8007c4:	8b 75 08             	mov    0x8(%ebp),%esi
  8007c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007ca:	8b 55 10             	mov    0x10(%ebp),%edx
  8007cd:	89 f0                	mov    %esi,%eax
  8007cf:	85 d2                	test   %edx,%edx
  8007d1:	74 21                	je     8007f4 <strlcpy+0x35>
  8007d3:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  8007d7:	89 f2                	mov    %esi,%edx
  8007d9:	eb 09                	jmp    8007e4 <strlcpy+0x25>
  8007db:	83 c1 01             	add    $0x1,%ecx
  8007de:	83 c2 01             	add    $0x1,%edx
  8007e1:	88 5a ff             	mov    %bl,-0x1(%edx)
  8007e4:	39 c2                	cmp    %eax,%edx
  8007e6:	74 09                	je     8007f1 <strlcpy+0x32>
  8007e8:	0f b6 19             	movzbl (%ecx),%ebx
  8007eb:	84 db                	test   %bl,%bl
  8007ed:	75 ec                	jne    8007db <strlcpy+0x1c>
  8007ef:	89 d0                	mov    %edx,%eax
  8007f1:	c6 00 00             	movb   $0x0,(%eax)
  8007f4:	29 f0                	sub    %esi,%eax
  8007f6:	5b                   	pop    %ebx
  8007f7:	5e                   	pop    %esi
  8007f8:	5d                   	pop    %ebp
  8007f9:	c3                   	ret

008007fa <strcmp>:
  8007fa:	55                   	push   %ebp
  8007fb:	89 e5                	mov    %esp,%ebp
  8007fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800800:	8b 55 0c             	mov    0xc(%ebp),%edx
  800803:	eb 06                	jmp    80080b <strcmp+0x11>
  800805:	83 c1 01             	add    $0x1,%ecx
  800808:	83 c2 01             	add    $0x1,%edx
  80080b:	0f b6 01             	movzbl (%ecx),%eax
  80080e:	84 c0                	test   %al,%al
  800810:	74 04                	je     800816 <strcmp+0x1c>
  800812:	3a 02                	cmp    (%edx),%al
  800814:	74 ef                	je     800805 <strcmp+0xb>
  800816:	0f b6 c0             	movzbl %al,%eax
  800819:	0f b6 12             	movzbl (%edx),%edx
  80081c:	29 d0                	sub    %edx,%eax
  80081e:	5d                   	pop    %ebp
  80081f:	c3                   	ret

00800820 <strncmp>:
  800820:	55                   	push   %ebp
  800821:	89 e5                	mov    %esp,%ebp
  800823:	53                   	push   %ebx
  800824:	8b 45 08             	mov    0x8(%ebp),%eax
  800827:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80082a:	8b 55 10             	mov    0x10(%ebp),%edx
  80082d:	eb 09                	jmp    800838 <strncmp+0x18>
  80082f:	83 ea 01             	sub    $0x1,%edx
  800832:	83 c0 01             	add    $0x1,%eax
  800835:	83 c1 01             	add    $0x1,%ecx
  800838:	85 d2                	test   %edx,%edx
  80083a:	74 18                	je     800854 <strncmp+0x34>
  80083c:	0f b6 18             	movzbl (%eax),%ebx
  80083f:	84 db                	test   %bl,%bl
  800841:	74 04                	je     800847 <strncmp+0x27>
  800843:	3a 19                	cmp    (%ecx),%bl
  800845:	74 e8                	je     80082f <strncmp+0xf>
  800847:	0f b6 00             	movzbl (%eax),%eax
  80084a:	0f b6 11             	movzbl (%ecx),%edx
  80084d:	29 d0                	sub    %edx,%eax
  80084f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800852:	c9                   	leave
  800853:	c3                   	ret
  800854:	b8 00 00 00 00       	mov    $0x0,%eax
  800859:	eb f4                	jmp    80084f <strncmp+0x2f>

0080085b <strchr>:
  80085b:	55                   	push   %ebp
  80085c:	89 e5                	mov    %esp,%ebp
  80085e:	8b 45 08             	mov    0x8(%ebp),%eax
  800861:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800865:	eb 03                	jmp    80086a <strchr+0xf>
  800867:	83 c0 01             	add    $0x1,%eax
  80086a:	0f b6 10             	movzbl (%eax),%edx
  80086d:	84 d2                	test   %dl,%dl
  80086f:	74 06                	je     800877 <strchr+0x1c>
  800871:	38 ca                	cmp    %cl,%dl
  800873:	75 f2                	jne    800867 <strchr+0xc>
  800875:	eb 05                	jmp    80087c <strchr+0x21>
  800877:	b8 00 00 00 00       	mov    $0x0,%eax
  80087c:	5d                   	pop    %ebp
  80087d:	c3                   	ret

0080087e <strfind>:
  80087e:	55                   	push   %ebp
  80087f:	89 e5                	mov    %esp,%ebp
  800881:	8b 45 08             	mov    0x8(%ebp),%eax
  800884:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800888:	0f b6 10             	movzbl (%eax),%edx
  80088b:	38 ca                	cmp    %cl,%dl
  80088d:	74 09                	je     800898 <strfind+0x1a>
  80088f:	84 d2                	test   %dl,%dl
  800891:	74 05                	je     800898 <strfind+0x1a>
  800893:	83 c0 01             	add    $0x1,%eax
  800896:	eb f0                	jmp    800888 <strfind+0xa>
  800898:	5d                   	pop    %ebp
  800899:	c3                   	ret

0080089a <memset>:
  80089a:	55                   	push   %ebp
  80089b:	89 e5                	mov    %esp,%ebp
  80089d:	57                   	push   %edi
  80089e:	8b 55 08             	mov    0x8(%ebp),%edx
  8008a1:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8008a4:	85 c9                	test   %ecx,%ecx
  8008a6:	74 24                	je     8008cc <memset+0x32>
  8008a8:	89 d0                	mov    %edx,%eax
  8008aa:	09 c8                	or     %ecx,%eax
  8008ac:	a8 03                	test   $0x3,%al
  8008ae:	75 14                	jne    8008c4 <memset+0x2a>
  8008b0:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  8008b4:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  8008ba:	c1 e9 02             	shr    $0x2,%ecx
  8008bd:	89 d7                	mov    %edx,%edi
  8008bf:	fc                   	cld
  8008c0:	f3 ab                	rep stos %eax,%es:(%edi)
  8008c2:	eb 08                	jmp    8008cc <memset+0x32>
  8008c4:	89 d7                	mov    %edx,%edi
  8008c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  8008c9:	fc                   	cld
  8008ca:	f3 aa                	rep stos %al,%es:(%edi)
  8008cc:	89 d0                	mov    %edx,%eax
  8008ce:	8b 7d fc             	mov    -0x4(%ebp),%edi
  8008d1:	c9                   	leave
  8008d2:	c3                   	ret

008008d3 <memmove>:
  8008d3:	55                   	push   %ebp
  8008d4:	89 e5                	mov    %esp,%ebp
  8008d6:	57                   	push   %edi
  8008d7:	56                   	push   %esi
  8008d8:	8b 45 08             	mov    0x8(%ebp),%eax
  8008db:	8b 75 0c             	mov    0xc(%ebp),%esi
  8008de:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8008e1:	39 c6                	cmp    %eax,%esi
  8008e3:	73 32                	jae    800917 <memmove+0x44>
  8008e5:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  8008e8:	39 d0                	cmp    %edx,%eax
  8008ea:	73 2b                	jae    800917 <memmove+0x44>
  8008ec:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  8008ef:	89 fe                	mov    %edi,%esi
  8008f1:	09 ce                	or     %ecx,%esi
  8008f3:	09 d6                	or     %edx,%esi
  8008f5:	f7 c6 03 00 00 00    	test   $0x3,%esi
  8008fb:	75 0e                	jne    80090b <memmove+0x38>
  8008fd:	83 ef 04             	sub    $0x4,%edi
  800900:	8d 72 fc             	lea    -0x4(%edx),%esi
  800903:	c1 e9 02             	shr    $0x2,%ecx
  800906:	fd                   	std
  800907:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800909:	eb 09                	jmp    800914 <memmove+0x41>
  80090b:	83 ef 01             	sub    $0x1,%edi
  80090e:	8d 72 ff             	lea    -0x1(%edx),%esi
  800911:	fd                   	std
  800912:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800914:	fc                   	cld
  800915:	eb 1a                	jmp    800931 <memmove+0x5e>
  800917:	89 c2                	mov    %eax,%edx
  800919:	09 ca                	or     %ecx,%edx
  80091b:	09 f2                	or     %esi,%edx
  80091d:	f6 c2 03             	test   $0x3,%dl
  800920:	75 0a                	jne    80092c <memmove+0x59>
  800922:	c1 e9 02             	shr    $0x2,%ecx
  800925:	89 c7                	mov    %eax,%edi
  800927:	fc                   	cld
  800928:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80092a:	eb 05                	jmp    800931 <memmove+0x5e>
  80092c:	89 c7                	mov    %eax,%edi
  80092e:	fc                   	cld
  80092f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800931:	5e                   	pop    %esi
  800932:	5f                   	pop    %edi
  800933:	5d                   	pop    %ebp
  800934:	c3                   	ret

00800935 <memcpy>:
  800935:	55                   	push   %ebp
  800936:	89 e5                	mov    %esp,%ebp
  800938:	83 ec 0c             	sub    $0xc,%esp
  80093b:	ff 75 10             	push   0x10(%ebp)
  80093e:	ff 75 0c             	push   0xc(%ebp)
  800941:	ff 75 08             	push   0x8(%ebp)
  800944:	e8 8a ff ff ff       	call   8008d3 <memmove>
  800949:	c9                   	leave
  80094a:	c3                   	ret

0080094b <memcmp>:
  80094b:	55                   	push   %ebp
  80094c:	89 e5                	mov    %esp,%ebp
  80094e:	56                   	push   %esi
  80094f:	53                   	push   %ebx
  800950:	8b 45 08             	mov    0x8(%ebp),%eax
  800953:	8b 55 0c             	mov    0xc(%ebp),%edx
  800956:	89 c6                	mov    %eax,%esi
  800958:	03 75 10             	add    0x10(%ebp),%esi
  80095b:	eb 06                	jmp    800963 <memcmp+0x18>
  80095d:	83 c0 01             	add    $0x1,%eax
  800960:	83 c2 01             	add    $0x1,%edx
  800963:	39 f0                	cmp    %esi,%eax
  800965:	74 14                	je     80097b <memcmp+0x30>
  800967:	0f b6 08             	movzbl (%eax),%ecx
  80096a:	0f b6 1a             	movzbl (%edx),%ebx
  80096d:	38 d9                	cmp    %bl,%cl
  80096f:	74 ec                	je     80095d <memcmp+0x12>
  800971:	0f b6 c1             	movzbl %cl,%eax
  800974:	0f b6 db             	movzbl %bl,%ebx
  800977:	29 d8                	sub    %ebx,%eax
  800979:	eb 05                	jmp    800980 <memcmp+0x35>
  80097b:	b8 00 00 00 00       	mov    $0x0,%eax
  800980:	5b                   	pop    %ebx
  800981:	5e                   	pop    %esi
  800982:	5d                   	pop    %ebp
  800983:	c3                   	ret

00800984 <memfind>:
  800984:	55                   	push   %ebp
  800985:	89 e5                	mov    %esp,%ebp
  800987:	8b 45 08             	mov    0x8(%ebp),%eax
  80098a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80098d:	89 c2                	mov    %eax,%edx
  80098f:	03 55 10             	add    0x10(%ebp),%edx
  800992:	eb 03                	jmp    800997 <memfind+0x13>
  800994:	83 c0 01             	add    $0x1,%eax
  800997:	39 d0                	cmp    %edx,%eax
  800999:	73 04                	jae    80099f <memfind+0x1b>
  80099b:	38 08                	cmp    %cl,(%eax)
  80099d:	75 f5                	jne    800994 <memfind+0x10>
  80099f:	5d                   	pop    %ebp
  8009a0:	c3                   	ret

008009a1 <strtol>:
  8009a1:	55                   	push   %ebp
  8009a2:	89 e5                	mov    %esp,%ebp
  8009a4:	57                   	push   %edi
  8009a5:	56                   	push   %esi
  8009a6:	53                   	push   %ebx
  8009a7:	8b 55 08             	mov    0x8(%ebp),%edx
  8009aa:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8009ad:	eb 03                	jmp    8009b2 <strtol+0x11>
  8009af:	83 c2 01             	add    $0x1,%edx
  8009b2:	0f b6 02             	movzbl (%edx),%eax
  8009b5:	3c 20                	cmp    $0x20,%al
  8009b7:	74 f6                	je     8009af <strtol+0xe>
  8009b9:	3c 09                	cmp    $0x9,%al
  8009bb:	74 f2                	je     8009af <strtol+0xe>
  8009bd:	3c 2b                	cmp    $0x2b,%al
  8009bf:	74 2a                	je     8009eb <strtol+0x4a>
  8009c1:	bf 00 00 00 00       	mov    $0x0,%edi
  8009c6:	3c 2d                	cmp    $0x2d,%al
  8009c8:	74 2b                	je     8009f5 <strtol+0x54>
  8009ca:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  8009d0:	75 0f                	jne    8009e1 <strtol+0x40>
  8009d2:	80 3a 30             	cmpb   $0x30,(%edx)
  8009d5:	74 28                	je     8009ff <strtol+0x5e>
  8009d7:	85 db                	test   %ebx,%ebx
  8009d9:	b8 0a 00 00 00       	mov    $0xa,%eax
  8009de:	0f 44 d8             	cmove  %eax,%ebx
  8009e1:	b9 00 00 00 00       	mov    $0x0,%ecx
  8009e6:	89 5d 10             	mov    %ebx,0x10(%ebp)
  8009e9:	eb 46                	jmp    800a31 <strtol+0x90>
  8009eb:	83 c2 01             	add    $0x1,%edx
  8009ee:	bf 00 00 00 00       	mov    $0x0,%edi
  8009f3:	eb d5                	jmp    8009ca <strtol+0x29>
  8009f5:	83 c2 01             	add    $0x1,%edx
  8009f8:	bf 01 00 00 00       	mov    $0x1,%edi
  8009fd:	eb cb                	jmp    8009ca <strtol+0x29>
  8009ff:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800a03:	74 0e                	je     800a13 <strtol+0x72>
  800a05:	85 db                	test   %ebx,%ebx
  800a07:	75 d8                	jne    8009e1 <strtol+0x40>
  800a09:	83 c2 01             	add    $0x1,%edx
  800a0c:	bb 08 00 00 00       	mov    $0x8,%ebx
  800a11:	eb ce                	jmp    8009e1 <strtol+0x40>
  800a13:	83 c2 02             	add    $0x2,%edx
  800a16:	bb 10 00 00 00       	mov    $0x10,%ebx
  800a1b:	eb c4                	jmp    8009e1 <strtol+0x40>
  800a1d:	0f be c0             	movsbl %al,%eax
  800a20:	83 e8 30             	sub    $0x30,%eax
  800a23:	3b 45 10             	cmp    0x10(%ebp),%eax
  800a26:	7d 3a                	jge    800a62 <strtol+0xc1>
  800a28:	83 c2 01             	add    $0x1,%edx
  800a2b:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800a2f:	01 c1                	add    %eax,%ecx
  800a31:	0f b6 02             	movzbl (%edx),%eax
  800a34:	8d 70 d0             	lea    -0x30(%eax),%esi
  800a37:	89 f3                	mov    %esi,%ebx
  800a39:	80 fb 09             	cmp    $0x9,%bl
  800a3c:	76 df                	jbe    800a1d <strtol+0x7c>
  800a3e:	8d 70 9f             	lea    -0x61(%eax),%esi
  800a41:	89 f3                	mov    %esi,%ebx
  800a43:	80 fb 19             	cmp    $0x19,%bl
  800a46:	77 08                	ja     800a50 <strtol+0xaf>
  800a48:	0f be c0             	movsbl %al,%eax
  800a4b:	83 e8 57             	sub    $0x57,%eax
  800a4e:	eb d3                	jmp    800a23 <strtol+0x82>
  800a50:	8d 70 bf             	lea    -0x41(%eax),%esi
  800a53:	89 f3                	mov    %esi,%ebx
  800a55:	80 fb 19             	cmp    $0x19,%bl
  800a58:	77 08                	ja     800a62 <strtol+0xc1>
  800a5a:	0f be c0             	movsbl %al,%eax
  800a5d:	83 e8 37             	sub    $0x37,%eax
  800a60:	eb c1                	jmp    800a23 <strtol+0x82>
  800a62:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800a66:	74 05                	je     800a6d <strtol+0xcc>
  800a68:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a6b:	89 10                	mov    %edx,(%eax)
  800a6d:	89 c8                	mov    %ecx,%eax
  800a6f:	f7 d8                	neg    %eax
  800a71:	85 ff                	test   %edi,%edi
  800a73:	0f 45 c8             	cmovne %eax,%ecx
  800a76:	89 c8                	mov    %ecx,%eax
  800a78:	5b                   	pop    %ebx
  800a79:	5e                   	pop    %esi
  800a7a:	5f                   	pop    %edi
  800a7b:	5d                   	pop    %ebp
  800a7c:	c3                   	ret

00800a7d <syscall>:
  800a7d:	55                   	push   %ebp
  800a7e:	89 e5                	mov    %esp,%ebp
  800a80:	57                   	push   %edi
  800a81:	56                   	push   %esi
  800a82:	53                   	push   %ebx
  800a83:	83 ec 1c             	sub    $0x1c,%esp
  800a86:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a89:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a8c:	89 ca                	mov    %ecx,%edx
  800a8e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a91:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a94:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a97:	8b 75 14             	mov    0x14(%ebp),%esi
  800a9a:	cd 30                	int    $0x30
  800a9c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800aa0:	74 04                	je     800aa6 <syscall+0x29>
  800aa2:	85 c0                	test   %eax,%eax
  800aa4:	7f 08                	jg     800aae <syscall+0x31>
  800aa6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800aa9:	5b                   	pop    %ebx
  800aaa:	5e                   	pop    %esi
  800aab:	5f                   	pop    %edi
  800aac:	5d                   	pop    %ebp
  800aad:	c3                   	ret
  800aae:	83 ec 0c             	sub    $0xc,%esp
  800ab1:	50                   	push   %eax
  800ab2:	ff 75 e0             	push   -0x20(%ebp)
  800ab5:	68 41 10 80 00       	push   $0x801041
  800aba:	6a 1e                	push   $0x1e
  800abc:	68 5e 10 80 00       	push   $0x80105e
  800ac1:	e8 63 f6 ff ff       	call   800129 <_panic>

00800ac6 <sys_cputs>:
  800ac6:	55                   	push   %ebp
  800ac7:	89 e5                	mov    %esp,%ebp
  800ac9:	83 ec 08             	sub    $0x8,%esp
  800acc:	6a 00                	push   $0x0
  800ace:	6a 00                	push   $0x0
  800ad0:	6a 00                	push   $0x0
  800ad2:	ff 75 0c             	push   0xc(%ebp)
  800ad5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ad8:	ba 00 00 00 00       	mov    $0x0,%edx
  800add:	b8 00 00 00 00       	mov    $0x0,%eax
  800ae2:	e8 96 ff ff ff       	call   800a7d <syscall>
  800ae7:	83 c4 10             	add    $0x10,%esp
  800aea:	c9                   	leave
  800aeb:	c3                   	ret

00800aec <sys_cgetc>:
  800aec:	55                   	push   %ebp
  800aed:	89 e5                	mov    %esp,%ebp
  800aef:	83 ec 08             	sub    $0x8,%esp
  800af2:	6a 00                	push   $0x0
  800af4:	6a 00                	push   $0x0
  800af6:	6a 00                	push   $0x0
  800af8:	6a 00                	push   $0x0
  800afa:	b9 00 00 00 00       	mov    $0x0,%ecx
  800aff:	ba 00 00 00 00       	mov    $0x0,%edx
  800b04:	b8 01 00 00 00       	mov    $0x1,%eax
  800b09:	e8 6f ff ff ff       	call   800a7d <syscall>
  800b0e:	c9                   	leave
  800b0f:	c3                   	ret

00800b10 <sys_env_destroy>:
  800b10:	55                   	push   %ebp
  800b11:	89 e5                	mov    %esp,%ebp
  800b13:	83 ec 08             	sub    $0x8,%esp
  800b16:	6a 00                	push   $0x0
  800b18:	6a 00                	push   $0x0
  800b1a:	6a 00                	push   $0x0
  800b1c:	6a 00                	push   $0x0
  800b1e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b21:	ba 01 00 00 00       	mov    $0x1,%edx
  800b26:	b8 03 00 00 00       	mov    $0x3,%eax
  800b2b:	e8 4d ff ff ff       	call   800a7d <syscall>
  800b30:	c9                   	leave
  800b31:	c3                   	ret

00800b32 <sys_getenvid>:
  800b32:	55                   	push   %ebp
  800b33:	89 e5                	mov    %esp,%ebp
  800b35:	83 ec 08             	sub    $0x8,%esp
  800b38:	6a 00                	push   $0x0
  800b3a:	6a 00                	push   $0x0
  800b3c:	6a 00                	push   $0x0
  800b3e:	6a 00                	push   $0x0
  800b40:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b45:	ba 00 00 00 00       	mov    $0x0,%edx
  800b4a:	b8 02 00 00 00       	mov    $0x2,%eax
  800b4f:	e8 29 ff ff ff       	call   800a7d <syscall>
  800b54:	c9                   	leave
  800b55:	c3                   	ret

00800b56 <sys_yield>:
  800b56:	55                   	push   %ebp
  800b57:	89 e5                	mov    %esp,%ebp
  800b59:	83 ec 08             	sub    $0x8,%esp
  800b5c:	6a 00                	push   $0x0
  800b5e:	6a 00                	push   $0x0
  800b60:	6a 00                	push   $0x0
  800b62:	6a 00                	push   $0x0
  800b64:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b69:	ba 00 00 00 00       	mov    $0x0,%edx
  800b6e:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b73:	e8 05 ff ff ff       	call   800a7d <syscall>
  800b78:	83 c4 10             	add    $0x10,%esp
  800b7b:	c9                   	leave
  800b7c:	c3                   	ret

00800b7d <sys_page_alloc>:
  800b7d:	55                   	push   %ebp
  800b7e:	89 e5                	mov    %esp,%ebp
  800b80:	83 ec 08             	sub    $0x8,%esp
  800b83:	6a 00                	push   $0x0
  800b85:	6a 00                	push   $0x0
  800b87:	ff 75 10             	push   0x10(%ebp)
  800b8a:	ff 75 0c             	push   0xc(%ebp)
  800b8d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b90:	ba 01 00 00 00       	mov    $0x1,%edx
  800b95:	b8 04 00 00 00       	mov    $0x4,%eax
  800b9a:	e8 de fe ff ff       	call   800a7d <syscall>
  800b9f:	c9                   	leave
  800ba0:	c3                   	ret

00800ba1 <sys_page_map>:
  800ba1:	55                   	push   %ebp
  800ba2:	89 e5                	mov    %esp,%ebp
  800ba4:	83 ec 08             	sub    $0x8,%esp
  800ba7:	ff 75 18             	push   0x18(%ebp)
  800baa:	ff 75 14             	push   0x14(%ebp)
  800bad:	ff 75 10             	push   0x10(%ebp)
  800bb0:	ff 75 0c             	push   0xc(%ebp)
  800bb3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bb6:	ba 01 00 00 00       	mov    $0x1,%edx
  800bbb:	b8 05 00 00 00       	mov    $0x5,%eax
  800bc0:	e8 b8 fe ff ff       	call   800a7d <syscall>
  800bc5:	c9                   	leave
  800bc6:	c3                   	ret

00800bc7 <sys_page_unmap>:
  800bc7:	55                   	push   %ebp
  800bc8:	89 e5                	mov    %esp,%ebp
  800bca:	83 ec 08             	sub    $0x8,%esp
  800bcd:	6a 00                	push   $0x0
  800bcf:	6a 00                	push   $0x0
  800bd1:	6a 00                	push   $0x0
  800bd3:	ff 75 0c             	push   0xc(%ebp)
  800bd6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bd9:	ba 01 00 00 00       	mov    $0x1,%edx
  800bde:	b8 06 00 00 00       	mov    $0x6,%eax
  800be3:	e8 95 fe ff ff       	call   800a7d <syscall>
  800be8:	c9                   	leave
  800be9:	c3                   	ret

00800bea <sys_env_set_status>:
  800bea:	55                   	push   %ebp
  800beb:	89 e5                	mov    %esp,%ebp
  800bed:	83 ec 08             	sub    $0x8,%esp
  800bf0:	6a 00                	push   $0x0
  800bf2:	6a 00                	push   $0x0
  800bf4:	6a 00                	push   $0x0
  800bf6:	ff 75 0c             	push   0xc(%ebp)
  800bf9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bfc:	ba 01 00 00 00       	mov    $0x1,%edx
  800c01:	b8 08 00 00 00       	mov    $0x8,%eax
  800c06:	e8 72 fe ff ff       	call   800a7d <syscall>
  800c0b:	c9                   	leave
  800c0c:	c3                   	ret

00800c0d <sys_env_set_pgfault_upcall>:
  800c0d:	55                   	push   %ebp
  800c0e:	89 e5                	mov    %esp,%ebp
  800c10:	83 ec 08             	sub    $0x8,%esp
  800c13:	6a 00                	push   $0x0
  800c15:	6a 00                	push   $0x0
  800c17:	6a 00                	push   $0x0
  800c19:	ff 75 0c             	push   0xc(%ebp)
  800c1c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c1f:	ba 01 00 00 00       	mov    $0x1,%edx
  800c24:	b8 09 00 00 00       	mov    $0x9,%eax
  800c29:	e8 4f fe ff ff       	call   800a7d <syscall>
  800c2e:	c9                   	leave
  800c2f:	c3                   	ret

00800c30 <sys_ipc_try_send>:
  800c30:	55                   	push   %ebp
  800c31:	89 e5                	mov    %esp,%ebp
  800c33:	83 ec 08             	sub    $0x8,%esp
  800c36:	6a 00                	push   $0x0
  800c38:	ff 75 14             	push   0x14(%ebp)
  800c3b:	ff 75 10             	push   0x10(%ebp)
  800c3e:	ff 75 0c             	push   0xc(%ebp)
  800c41:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c44:	ba 00 00 00 00       	mov    $0x0,%edx
  800c49:	b8 0c 00 00 00       	mov    $0xc,%eax
  800c4e:	e8 2a fe ff ff       	call   800a7d <syscall>
  800c53:	c9                   	leave
  800c54:	c3                   	ret

00800c55 <sys_ipc_recv>:
  800c55:	55                   	push   %ebp
  800c56:	89 e5                	mov    %esp,%ebp
  800c58:	83 ec 08             	sub    $0x8,%esp
  800c5b:	6a 00                	push   $0x0
  800c5d:	6a 00                	push   $0x0
  800c5f:	6a 00                	push   $0x0
  800c61:	6a 00                	push   $0x0
  800c63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c66:	ba 01 00 00 00       	mov    $0x1,%edx
  800c6b:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c70:	e8 08 fe ff ff       	call   800a7d <syscall>
  800c75:	c9                   	leave
  800c76:	c3                   	ret

00800c77 <set_pgfault_handler>:
  800c77:	55                   	push   %ebp
  800c78:	89 e5                	mov    %esp,%ebp
  800c7a:	83 ec 08             	sub    $0x8,%esp
  800c7d:	83 3d 08 20 80 00 00 	cmpl   $0x0,0x802008
  800c84:	74 0a                	je     800c90 <set_pgfault_handler+0x19>
  800c86:	8b 45 08             	mov    0x8(%ebp),%eax
  800c89:	a3 08 20 80 00       	mov    %eax,0x802008
  800c8e:	c9                   	leave
  800c8f:	c3                   	ret
  800c90:	83 ec 04             	sub    $0x4,%esp
  800c93:	6a 07                	push   $0x7
  800c95:	68 00 f0 bf ee       	push   $0xeebff000
  800c9a:	6a 00                	push   $0x0
  800c9c:	e8 dc fe ff ff       	call   800b7d <sys_page_alloc>
  800ca1:	83 c4 10             	add    $0x10,%esp
  800ca4:	85 c0                	test   %eax,%eax
  800ca6:	78 e6                	js     800c8e <set_pgfault_handler+0x17>
  800ca8:	83 ec 08             	sub    $0x8,%esp
  800cab:	68 c0 0c 80 00       	push   $0x800cc0
  800cb0:	6a 00                	push   $0x0
  800cb2:	e8 56 ff ff ff       	call   800c0d <sys_env_set_pgfault_upcall>
  800cb7:	83 c4 10             	add    $0x10,%esp
  800cba:	85 c0                	test   %eax,%eax
  800cbc:	79 c8                	jns    800c86 <set_pgfault_handler+0xf>
  800cbe:	eb ce                	jmp    800c8e <set_pgfault_handler+0x17>

00800cc0 <_pgfault_upcall>:
  800cc0:	54                   	push   %esp
  800cc1:	a1 08 20 80 00       	mov    0x802008,%eax
  800cc6:	ff d0                	call   *%eax
  800cc8:	83 c4 04             	add    $0x4,%esp
  800ccb:	8b 44 24 28          	mov    0x28(%esp),%eax
  800ccf:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  800cd3:	83 eb 04             	sub    $0x4,%ebx
  800cd6:	89 03                	mov    %eax,(%ebx)
  800cd8:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  800cdc:	58                   	pop    %eax
  800cdd:	58                   	pop    %eax
  800cde:	61                   	popa
  800cdf:	83 c4 04             	add    $0x4,%esp
  800ce2:	9d                   	popf
  800ce3:	5c                   	pop    %esp
  800ce4:	c3                   	ret
  800ce5:	66 90                	xchg   %ax,%ax
  800ce7:	66 90                	xchg   %ax,%ax
  800ce9:	66 90                	xchg   %ax,%ax
  800ceb:	66 90                	xchg   %ax,%ax
  800ced:	66 90                	xchg   %ax,%ax
  800cef:	90                   	nop

00800cf0 <__udivdi3>:
  800cf0:	f3 0f 1e fb          	endbr32
  800cf4:	55                   	push   %ebp
  800cf5:	57                   	push   %edi
  800cf6:	56                   	push   %esi
  800cf7:	53                   	push   %ebx
  800cf8:	83 ec 1c             	sub    $0x1c,%esp
  800cfb:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800cff:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800d03:	8b 74 24 34          	mov    0x34(%esp),%esi
  800d07:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800d0b:	85 c0                	test   %eax,%eax
  800d0d:	75 19                	jne    800d28 <__udivdi3+0x38>
  800d0f:	39 de                	cmp    %ebx,%esi
  800d11:	73 4d                	jae    800d60 <__udivdi3+0x70>
  800d13:	31 ff                	xor    %edi,%edi
  800d15:	89 e8                	mov    %ebp,%eax
  800d17:	89 f2                	mov    %esi,%edx
  800d19:	f7 f3                	div    %ebx
  800d1b:	89 fa                	mov    %edi,%edx
  800d1d:	83 c4 1c             	add    $0x1c,%esp
  800d20:	5b                   	pop    %ebx
  800d21:	5e                   	pop    %esi
  800d22:	5f                   	pop    %edi
  800d23:	5d                   	pop    %ebp
  800d24:	c3                   	ret
  800d25:	8d 76 00             	lea    0x0(%esi),%esi
  800d28:	39 c6                	cmp    %eax,%esi
  800d2a:	73 14                	jae    800d40 <__udivdi3+0x50>
  800d2c:	31 ff                	xor    %edi,%edi
  800d2e:	31 c0                	xor    %eax,%eax
  800d30:	89 fa                	mov    %edi,%edx
  800d32:	83 c4 1c             	add    $0x1c,%esp
  800d35:	5b                   	pop    %ebx
  800d36:	5e                   	pop    %esi
  800d37:	5f                   	pop    %edi
  800d38:	5d                   	pop    %ebp
  800d39:	c3                   	ret
  800d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800d40:	0f bd f8             	bsr    %eax,%edi
  800d43:	83 f7 1f             	xor    $0x1f,%edi
  800d46:	75 48                	jne    800d90 <__udivdi3+0xa0>
  800d48:	39 f0                	cmp    %esi,%eax
  800d4a:	72 06                	jb     800d52 <__udivdi3+0x62>
  800d4c:	31 c0                	xor    %eax,%eax
  800d4e:	39 dd                	cmp    %ebx,%ebp
  800d50:	72 de                	jb     800d30 <__udivdi3+0x40>
  800d52:	b8 01 00 00 00       	mov    $0x1,%eax
  800d57:	eb d7                	jmp    800d30 <__udivdi3+0x40>
  800d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d60:	89 d9                	mov    %ebx,%ecx
  800d62:	85 db                	test   %ebx,%ebx
  800d64:	75 0b                	jne    800d71 <__udivdi3+0x81>
  800d66:	b8 01 00 00 00       	mov    $0x1,%eax
  800d6b:	31 d2                	xor    %edx,%edx
  800d6d:	f7 f3                	div    %ebx
  800d6f:	89 c1                	mov    %eax,%ecx
  800d71:	31 d2                	xor    %edx,%edx
  800d73:	89 f0                	mov    %esi,%eax
  800d75:	f7 f1                	div    %ecx
  800d77:	89 c6                	mov    %eax,%esi
  800d79:	89 e8                	mov    %ebp,%eax
  800d7b:	89 f7                	mov    %esi,%edi
  800d7d:	f7 f1                	div    %ecx
  800d7f:	89 fa                	mov    %edi,%edx
  800d81:	83 c4 1c             	add    $0x1c,%esp
  800d84:	5b                   	pop    %ebx
  800d85:	5e                   	pop    %esi
  800d86:	5f                   	pop    %edi
  800d87:	5d                   	pop    %ebp
  800d88:	c3                   	ret
  800d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d90:	89 f9                	mov    %edi,%ecx
  800d92:	ba 20 00 00 00       	mov    $0x20,%edx
  800d97:	29 fa                	sub    %edi,%edx
  800d99:	d3 e0                	shl    %cl,%eax
  800d9b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800d9f:	89 d1                	mov    %edx,%ecx
  800da1:	89 d8                	mov    %ebx,%eax
  800da3:	d3 e8                	shr    %cl,%eax
  800da5:	89 c1                	mov    %eax,%ecx
  800da7:	8b 44 24 08          	mov    0x8(%esp),%eax
  800dab:	09 c1                	or     %eax,%ecx
  800dad:	89 f0                	mov    %esi,%eax
  800daf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800db3:	89 f9                	mov    %edi,%ecx
  800db5:	d3 e3                	shl    %cl,%ebx
  800db7:	89 d1                	mov    %edx,%ecx
  800db9:	d3 e8                	shr    %cl,%eax
  800dbb:	89 f9                	mov    %edi,%ecx
  800dbd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800dc1:	89 eb                	mov    %ebp,%ebx
  800dc3:	d3 e6                	shl    %cl,%esi
  800dc5:	89 d1                	mov    %edx,%ecx
  800dc7:	d3 eb                	shr    %cl,%ebx
  800dc9:	09 f3                	or     %esi,%ebx
  800dcb:	89 c6                	mov    %eax,%esi
  800dcd:	89 f2                	mov    %esi,%edx
  800dcf:	89 d8                	mov    %ebx,%eax
  800dd1:	f7 74 24 08          	divl   0x8(%esp)
  800dd5:	89 d6                	mov    %edx,%esi
  800dd7:	89 c3                	mov    %eax,%ebx
  800dd9:	f7 64 24 0c          	mull   0xc(%esp)
  800ddd:	39 d6                	cmp    %edx,%esi
  800ddf:	72 1f                	jb     800e00 <__udivdi3+0x110>
  800de1:	89 f9                	mov    %edi,%ecx
  800de3:	d3 e5                	shl    %cl,%ebp
  800de5:	39 c5                	cmp    %eax,%ebp
  800de7:	73 04                	jae    800ded <__udivdi3+0xfd>
  800de9:	39 d6                	cmp    %edx,%esi
  800deb:	74 13                	je     800e00 <__udivdi3+0x110>
  800ded:	89 d8                	mov    %ebx,%eax
  800def:	31 ff                	xor    %edi,%edi
  800df1:	e9 3a ff ff ff       	jmp    800d30 <__udivdi3+0x40>
  800df6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800dfd:	00 
  800dfe:	66 90                	xchg   %ax,%ax
  800e00:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800e03:	31 ff                	xor    %edi,%edi
  800e05:	e9 26 ff ff ff       	jmp    800d30 <__udivdi3+0x40>
  800e0a:	66 90                	xchg   %ax,%ax
  800e0c:	66 90                	xchg   %ax,%ax
  800e0e:	66 90                	xchg   %ax,%ax

00800e10 <__umoddi3>:
  800e10:	f3 0f 1e fb          	endbr32
  800e14:	55                   	push   %ebp
  800e15:	57                   	push   %edi
  800e16:	56                   	push   %esi
  800e17:	53                   	push   %ebx
  800e18:	83 ec 1c             	sub    $0x1c,%esp
  800e1b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800e1f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800e23:	8b 74 24 30          	mov    0x30(%esp),%esi
  800e27:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800e2b:	89 da                	mov    %ebx,%edx
  800e2d:	85 c0                	test   %eax,%eax
  800e2f:	75 17                	jne    800e48 <__umoddi3+0x38>
  800e31:	39 fb                	cmp    %edi,%ebx
  800e33:	73 53                	jae    800e88 <__umoddi3+0x78>
  800e35:	89 f0                	mov    %esi,%eax
  800e37:	f7 f7                	div    %edi
  800e39:	89 d0                	mov    %edx,%eax
  800e3b:	31 d2                	xor    %edx,%edx
  800e3d:	83 c4 1c             	add    $0x1c,%esp
  800e40:	5b                   	pop    %ebx
  800e41:	5e                   	pop    %esi
  800e42:	5f                   	pop    %edi
  800e43:	5d                   	pop    %ebp
  800e44:	c3                   	ret
  800e45:	8d 76 00             	lea    0x0(%esi),%esi
  800e48:	89 f1                	mov    %esi,%ecx
  800e4a:	39 c3                	cmp    %eax,%ebx
  800e4c:	73 12                	jae    800e60 <__umoddi3+0x50>
  800e4e:	89 f0                	mov    %esi,%eax
  800e50:	83 c4 1c             	add    $0x1c,%esp
  800e53:	5b                   	pop    %ebx
  800e54:	5e                   	pop    %esi
  800e55:	5f                   	pop    %edi
  800e56:	5d                   	pop    %ebp
  800e57:	c3                   	ret
  800e58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800e5f:	00 
  800e60:	0f bd e8             	bsr    %eax,%ebp
  800e63:	83 f5 1f             	xor    $0x1f,%ebp
  800e66:	75 48                	jne    800eb0 <__umoddi3+0xa0>
  800e68:	39 d8                	cmp    %ebx,%eax
  800e6a:	0f 82 d0 00 00 00    	jb     800f40 <__umoddi3+0x130>
  800e70:	39 fe                	cmp    %edi,%esi
  800e72:	0f 83 c8 00 00 00    	jae    800f40 <__umoddi3+0x130>
  800e78:	89 c8                	mov    %ecx,%eax
  800e7a:	83 c4 1c             	add    $0x1c,%esp
  800e7d:	5b                   	pop    %ebx
  800e7e:	5e                   	pop    %esi
  800e7f:	5f                   	pop    %edi
  800e80:	5d                   	pop    %ebp
  800e81:	c3                   	ret
  800e82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800e88:	89 f9                	mov    %edi,%ecx
  800e8a:	85 ff                	test   %edi,%edi
  800e8c:	75 0b                	jne    800e99 <__umoddi3+0x89>
  800e8e:	b8 01 00 00 00       	mov    $0x1,%eax
  800e93:	31 d2                	xor    %edx,%edx
  800e95:	f7 f7                	div    %edi
  800e97:	89 c1                	mov    %eax,%ecx
  800e99:	89 d8                	mov    %ebx,%eax
  800e9b:	31 d2                	xor    %edx,%edx
  800e9d:	f7 f1                	div    %ecx
  800e9f:	89 f0                	mov    %esi,%eax
  800ea1:	f7 f1                	div    %ecx
  800ea3:	89 d0                	mov    %edx,%eax
  800ea5:	31 d2                	xor    %edx,%edx
  800ea7:	eb 94                	jmp    800e3d <__umoddi3+0x2d>
  800ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800eb0:	89 e9                	mov    %ebp,%ecx
  800eb2:	ba 20 00 00 00       	mov    $0x20,%edx
  800eb7:	29 ea                	sub    %ebp,%edx
  800eb9:	d3 e0                	shl    %cl,%eax
  800ebb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800ebf:	89 d1                	mov    %edx,%ecx
  800ec1:	89 f8                	mov    %edi,%eax
  800ec3:	d3 e8                	shr    %cl,%eax
  800ec5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800ec9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800ecd:	89 c1                	mov    %eax,%ecx
  800ecf:	8b 44 24 08          	mov    0x8(%esp),%eax
  800ed3:	09 c1                	or     %eax,%ecx
  800ed5:	89 d8                	mov    %ebx,%eax
  800ed7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800edb:	89 e9                	mov    %ebp,%ecx
  800edd:	d3 e7                	shl    %cl,%edi
  800edf:	89 d1                	mov    %edx,%ecx
  800ee1:	d3 e8                	shr    %cl,%eax
  800ee3:	89 e9                	mov    %ebp,%ecx
  800ee5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800ee9:	d3 e3                	shl    %cl,%ebx
  800eeb:	89 c7                	mov    %eax,%edi
  800eed:	89 d1                	mov    %edx,%ecx
  800eef:	89 f0                	mov    %esi,%eax
  800ef1:	d3 e8                	shr    %cl,%eax
  800ef3:	89 fa                	mov    %edi,%edx
  800ef5:	89 e9                	mov    %ebp,%ecx
  800ef7:	09 d8                	or     %ebx,%eax
  800ef9:	d3 e6                	shl    %cl,%esi
  800efb:	f7 74 24 08          	divl   0x8(%esp)
  800eff:	89 d3                	mov    %edx,%ebx
  800f01:	f7 64 24 0c          	mull   0xc(%esp)
  800f05:	89 c7                	mov    %eax,%edi
  800f07:	89 d1                	mov    %edx,%ecx
  800f09:	39 d3                	cmp    %edx,%ebx
  800f0b:	72 06                	jb     800f13 <__umoddi3+0x103>
  800f0d:	75 10                	jne    800f1f <__umoddi3+0x10f>
  800f0f:	39 c6                	cmp    %eax,%esi
  800f11:	73 0c                	jae    800f1f <__umoddi3+0x10f>
  800f13:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800f17:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800f1b:	89 d1                	mov    %edx,%ecx
  800f1d:	89 c7                	mov    %eax,%edi
  800f1f:	89 f2                	mov    %esi,%edx
  800f21:	29 fa                	sub    %edi,%edx
  800f23:	19 cb                	sbb    %ecx,%ebx
  800f25:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800f2a:	89 d8                	mov    %ebx,%eax
  800f2c:	d3 e0                	shl    %cl,%eax
  800f2e:	89 e9                	mov    %ebp,%ecx
  800f30:	d3 ea                	shr    %cl,%edx
  800f32:	d3 eb                	shr    %cl,%ebx
  800f34:	09 d0                	or     %edx,%eax
  800f36:	89 da                	mov    %ebx,%edx
  800f38:	83 c4 1c             	add    $0x1c,%esp
  800f3b:	5b                   	pop    %ebx
  800f3c:	5e                   	pop    %esi
  800f3d:	5f                   	pop    %edi
  800f3e:	5d                   	pop    %ebp
  800f3f:	c3                   	ret
  800f40:	89 da                	mov    %ebx,%edx
  800f42:	89 f1                	mov    %esi,%ecx
  800f44:	29 f9                	sub    %edi,%ecx
  800f46:	19 c2                	sbb    %eax,%edx
  800f48:	89 c8                	mov    %ecx,%eax
  800f4a:	e9 2b ff ff ff       	jmp    800e7a <__umoddi3+0x6a>
