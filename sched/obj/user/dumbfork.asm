
obj/user/dumbfork:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 9d 01 00 00       	call   8001ce <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <duppage>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	56                   	push   %esi
  800037:	53                   	push   %ebx
  800038:	8b 75 08             	mov    0x8(%ebp),%esi
  80003b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80003e:	83 ec 04             	sub    $0x4,%esp
  800041:	6a 07                	push   $0x7
  800043:	53                   	push   %ebx
  800044:	56                   	push   %esi
  800045:	e8 37 0c 00 00       	call   800c81 <sys_page_alloc>
  80004a:	83 c4 10             	add    $0x10,%esp
  80004d:	85 c0                	test   %eax,%eax
  80004f:	78 4a                	js     80009b <duppage+0x68>
  800051:	83 ec 0c             	sub    $0xc,%esp
  800054:	6a 07                	push   $0x7
  800056:	68 00 00 40 00       	push   $0x400000
  80005b:	6a 00                	push   $0x0
  80005d:	53                   	push   %ebx
  80005e:	56                   	push   %esi
  80005f:	e8 41 0c 00 00       	call   800ca5 <sys_page_map>
  800064:	83 c4 20             	add    $0x20,%esp
  800067:	85 c0                	test   %eax,%eax
  800069:	78 42                	js     8000ad <duppage+0x7a>
  80006b:	83 ec 04             	sub    $0x4,%esp
  80006e:	68 00 10 00 00       	push   $0x1000
  800073:	53                   	push   %ebx
  800074:	68 00 00 40 00       	push   $0x400000
  800079:	e8 59 09 00 00       	call   8009d7 <memmove>
  80007e:	83 c4 08             	add    $0x8,%esp
  800081:	68 00 00 40 00       	push   $0x400000
  800086:	6a 00                	push   $0x0
  800088:	e8 3e 0c 00 00       	call   800ccb <sys_page_unmap>
  80008d:	83 c4 10             	add    $0x10,%esp
  800090:	85 c0                	test   %eax,%eax
  800092:	78 2b                	js     8000bf <duppage+0x8c>
  800094:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800097:	5b                   	pop    %ebx
  800098:	5e                   	pop    %esi
  800099:	5d                   	pop    %ebp
  80009a:	c3                   	ret
  80009b:	50                   	push   %eax
  80009c:	68 e0 0f 80 00       	push   $0x800fe0
  8000a1:	6a 20                	push   $0x20
  8000a3:	68 f3 0f 80 00       	push   $0x800ff3
  8000a8:	e8 80 01 00 00       	call   80022d <_panic>
  8000ad:	50                   	push   %eax
  8000ae:	68 03 10 80 00       	push   $0x801003
  8000b3:	6a 22                	push   $0x22
  8000b5:	68 f3 0f 80 00       	push   $0x800ff3
  8000ba:	e8 6e 01 00 00       	call   80022d <_panic>
  8000bf:	50                   	push   %eax
  8000c0:	68 14 10 80 00       	push   $0x801014
  8000c5:	6a 25                	push   $0x25
  8000c7:	68 f3 0f 80 00       	push   $0x800ff3
  8000cc:	e8 5c 01 00 00       	call   80022d <_panic>

008000d1 <dumbfork>:
  8000d1:	55                   	push   %ebp
  8000d2:	89 e5                	mov    %esp,%ebp
  8000d4:	53                   	push   %ebx
  8000d5:	83 ec 14             	sub    $0x14,%esp
  8000d8:	b8 07 00 00 00       	mov    $0x7,%eax
  8000dd:	cd 30                	int    $0x30
  8000df:	89 c3                	mov    %eax,%ebx
  8000e1:	85 c0                	test   %eax,%eax
  8000e3:	78 23                	js     800108 <dumbfork+0x37>
  8000e5:	ba 00 00 80 00       	mov    $0x800000,%edx
  8000ea:	75 44                	jne    800130 <dumbfork+0x5f>
  8000ec:	e8 45 0b 00 00       	call   800c36 <sys_getenvid>
  8000f1:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000f6:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8000fc:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800101:	a3 04 20 80 00       	mov    %eax,0x802004
  800106:	eb 57                	jmp    80015f <dumbfork+0x8e>
  800108:	50                   	push   %eax
  800109:	68 27 10 80 00       	push   $0x801027
  80010e:	6a 37                	push   $0x37
  800110:	68 f3 0f 80 00       	push   $0x800ff3
  800115:	e8 13 01 00 00       	call   80022d <_panic>
  80011a:	83 ec 08             	sub    $0x8,%esp
  80011d:	52                   	push   %edx
  80011e:	53                   	push   %ebx
  80011f:	e8 0f ff ff ff       	call   800033 <duppage>
  800124:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800127:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  80012d:	83 c4 10             	add    $0x10,%esp
  800130:	89 55 f4             	mov    %edx,-0xc(%ebp)
  800133:	81 fa 08 20 80 00    	cmp    $0x802008,%edx
  800139:	72 df                	jb     80011a <dumbfork+0x49>
  80013b:	83 ec 08             	sub    $0x8,%esp
  80013e:	8d 45 f4             	lea    -0xc(%ebp),%eax
  800141:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  800146:	50                   	push   %eax
  800147:	53                   	push   %ebx
  800148:	e8 e6 fe ff ff       	call   800033 <duppage>
  80014d:	83 c4 08             	add    $0x8,%esp
  800150:	6a 02                	push   $0x2
  800152:	53                   	push   %ebx
  800153:	e8 96 0b 00 00       	call   800cee <sys_env_set_status>
  800158:	83 c4 10             	add    $0x10,%esp
  80015b:	85 c0                	test   %eax,%eax
  80015d:	78 07                	js     800166 <dumbfork+0x95>
  80015f:	89 d8                	mov    %ebx,%eax
  800161:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800164:	c9                   	leave
  800165:	c3                   	ret
  800166:	50                   	push   %eax
  800167:	68 37 10 80 00       	push   $0x801037
  80016c:	6a 4c                	push   $0x4c
  80016e:	68 f3 0f 80 00       	push   $0x800ff3
  800173:	e8 b5 00 00 00       	call   80022d <_panic>

00800178 <umain>:
  800178:	55                   	push   %ebp
  800179:	89 e5                	mov    %esp,%ebp
  80017b:	57                   	push   %edi
  80017c:	56                   	push   %esi
  80017d:	53                   	push   %ebx
  80017e:	83 ec 0c             	sub    $0xc,%esp
  800181:	e8 4b ff ff ff       	call   8000d1 <dumbfork>
  800186:	89 c6                	mov    %eax,%esi
  800188:	85 c0                	test   %eax,%eax
  80018a:	bf 4e 10 80 00       	mov    $0x80104e,%edi
  80018f:	b8 55 10 80 00       	mov    $0x801055,%eax
  800194:	0f 44 f8             	cmove  %eax,%edi
  800197:	bb 00 00 00 00       	mov    $0x0,%ebx
  80019c:	eb 1f                	jmp    8001bd <umain+0x45>
  80019e:	83 fb 13             	cmp    $0x13,%ebx
  8001a1:	7f 23                	jg     8001c6 <umain+0x4e>
  8001a3:	83 ec 04             	sub    $0x4,%esp
  8001a6:	57                   	push   %edi
  8001a7:	53                   	push   %ebx
  8001a8:	68 5b 10 80 00       	push   $0x80105b
  8001ad:	e8 56 01 00 00       	call   800308 <cprintf>
  8001b2:	e8 a3 0a 00 00       	call   800c5a <sys_yield>
  8001b7:	83 c3 01             	add    $0x1,%ebx
  8001ba:	83 c4 10             	add    $0x10,%esp
  8001bd:	85 f6                	test   %esi,%esi
  8001bf:	74 dd                	je     80019e <umain+0x26>
  8001c1:	83 fb 09             	cmp    $0x9,%ebx
  8001c4:	7e dd                	jle    8001a3 <umain+0x2b>
  8001c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8001c9:	5b                   	pop    %ebx
  8001ca:	5e                   	pop    %esi
  8001cb:	5f                   	pop    %edi
  8001cc:	5d                   	pop    %ebp
  8001cd:	c3                   	ret

008001ce <libmain>:
  8001ce:	55                   	push   %ebp
  8001cf:	89 e5                	mov    %esp,%ebp
  8001d1:	56                   	push   %esi
  8001d2:	53                   	push   %ebx
  8001d3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8001d6:	8b 75 0c             	mov    0xc(%ebp),%esi
  8001d9:	e8 58 0a 00 00       	call   800c36 <sys_getenvid>
  8001de:	85 c0                	test   %eax,%eax
  8001e0:	78 15                	js     8001f7 <libmain+0x29>
  8001e2:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001e7:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8001ed:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8001f2:	a3 04 20 80 00       	mov    %eax,0x802004
  8001f7:	85 db                	test   %ebx,%ebx
  8001f9:	7e 07                	jle    800202 <libmain+0x34>
  8001fb:	8b 06                	mov    (%esi),%eax
  8001fd:	a3 00 20 80 00       	mov    %eax,0x802000
  800202:	83 ec 08             	sub    $0x8,%esp
  800205:	56                   	push   %esi
  800206:	53                   	push   %ebx
  800207:	e8 6c ff ff ff       	call   800178 <umain>
  80020c:	e8 0a 00 00 00       	call   80021b <exit>
  800211:	83 c4 10             	add    $0x10,%esp
  800214:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800217:	5b                   	pop    %ebx
  800218:	5e                   	pop    %esi
  800219:	5d                   	pop    %ebp
  80021a:	c3                   	ret

0080021b <exit>:
  80021b:	55                   	push   %ebp
  80021c:	89 e5                	mov    %esp,%ebp
  80021e:	83 ec 14             	sub    $0x14,%esp
  800221:	6a 00                	push   $0x0
  800223:	e8 ec 09 00 00       	call   800c14 <sys_env_destroy>
  800228:	83 c4 10             	add    $0x10,%esp
  80022b:	c9                   	leave
  80022c:	c3                   	ret

0080022d <_panic>:
  80022d:	55                   	push   %ebp
  80022e:	89 e5                	mov    %esp,%ebp
  800230:	56                   	push   %esi
  800231:	53                   	push   %ebx
  800232:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800235:	8b 35 00 20 80 00    	mov    0x802000,%esi
  80023b:	e8 f6 09 00 00       	call   800c36 <sys_getenvid>
  800240:	83 ec 0c             	sub    $0xc,%esp
  800243:	ff 75 0c             	push   0xc(%ebp)
  800246:	ff 75 08             	push   0x8(%ebp)
  800249:	56                   	push   %esi
  80024a:	50                   	push   %eax
  80024b:	68 5c 11 80 00       	push   $0x80115c
  800250:	e8 b3 00 00 00       	call   800308 <cprintf>
  800255:	83 c4 18             	add    $0x18,%esp
  800258:	53                   	push   %ebx
  800259:	ff 75 10             	push   0x10(%ebp)
  80025c:	e8 56 00 00 00       	call   8002b7 <vcprintf>
  800261:	c7 04 24 6b 10 80 00 	movl   $0x80106b,(%esp)
  800268:	e8 9b 00 00 00       	call   800308 <cprintf>
  80026d:	83 c4 10             	add    $0x10,%esp
  800270:	cc                   	int3
  800271:	eb fd                	jmp    800270 <_panic+0x43>

00800273 <putch>:
  800273:	55                   	push   %ebp
  800274:	89 e5                	mov    %esp,%ebp
  800276:	53                   	push   %ebx
  800277:	83 ec 04             	sub    $0x4,%esp
  80027a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80027d:	8b 13                	mov    (%ebx),%edx
  80027f:	8d 42 01             	lea    0x1(%edx),%eax
  800282:	89 03                	mov    %eax,(%ebx)
  800284:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800287:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  80028b:	3d ff 00 00 00       	cmp    $0xff,%eax
  800290:	74 09                	je     80029b <putch+0x28>
  800292:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800296:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800299:	c9                   	leave
  80029a:	c3                   	ret
  80029b:	83 ec 08             	sub    $0x8,%esp
  80029e:	68 ff 00 00 00       	push   $0xff
  8002a3:	8d 43 08             	lea    0x8(%ebx),%eax
  8002a6:	50                   	push   %eax
  8002a7:	e8 1e 09 00 00       	call   800bca <sys_cputs>
  8002ac:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8002b2:	83 c4 10             	add    $0x10,%esp
  8002b5:	eb db                	jmp    800292 <putch+0x1f>

008002b7 <vcprintf>:
  8002b7:	55                   	push   %ebp
  8002b8:	89 e5                	mov    %esp,%ebp
  8002ba:	81 ec 18 01 00 00    	sub    $0x118,%esp
  8002c0:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  8002c7:	00 00 00 
  8002ca:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  8002d1:	00 00 00 
  8002d4:	ff 75 0c             	push   0xc(%ebp)
  8002d7:	ff 75 08             	push   0x8(%ebp)
  8002da:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  8002e0:	50                   	push   %eax
  8002e1:	68 73 02 80 00       	push   $0x800273
  8002e6:	e8 74 01 00 00       	call   80045f <vprintfmt>
  8002eb:	83 c4 08             	add    $0x8,%esp
  8002ee:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  8002f4:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  8002fa:	50                   	push   %eax
  8002fb:	e8 ca 08 00 00       	call   800bca <sys_cputs>
  800300:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800306:	c9                   	leave
  800307:	c3                   	ret

00800308 <cprintf>:
  800308:	55                   	push   %ebp
  800309:	89 e5                	mov    %esp,%ebp
  80030b:	83 ec 10             	sub    $0x10,%esp
  80030e:	8d 45 0c             	lea    0xc(%ebp),%eax
  800311:	50                   	push   %eax
  800312:	ff 75 08             	push   0x8(%ebp)
  800315:	e8 9d ff ff ff       	call   8002b7 <vcprintf>
  80031a:	c9                   	leave
  80031b:	c3                   	ret

0080031c <printnum>:
  80031c:	55                   	push   %ebp
  80031d:	89 e5                	mov    %esp,%ebp
  80031f:	57                   	push   %edi
  800320:	56                   	push   %esi
  800321:	53                   	push   %ebx
  800322:	83 ec 1c             	sub    $0x1c,%esp
  800325:	89 c7                	mov    %eax,%edi
  800327:	89 d6                	mov    %edx,%esi
  800329:	8b 45 08             	mov    0x8(%ebp),%eax
  80032c:	8b 55 0c             	mov    0xc(%ebp),%edx
  80032f:	89 d1                	mov    %edx,%ecx
  800331:	89 c2                	mov    %eax,%edx
  800333:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800336:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800339:	8b 45 10             	mov    0x10(%ebp),%eax
  80033c:	8b 5d 14             	mov    0x14(%ebp),%ebx
  80033f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800342:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800349:	39 c2                	cmp    %eax,%edx
  80034b:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  80034e:	72 3e                	jb     80038e <printnum+0x72>
  800350:	83 ec 0c             	sub    $0xc,%esp
  800353:	ff 75 18             	push   0x18(%ebp)
  800356:	83 eb 01             	sub    $0x1,%ebx
  800359:	53                   	push   %ebx
  80035a:	50                   	push   %eax
  80035b:	83 ec 08             	sub    $0x8,%esp
  80035e:	ff 75 e4             	push   -0x1c(%ebp)
  800361:	ff 75 e0             	push   -0x20(%ebp)
  800364:	ff 75 dc             	push   -0x24(%ebp)
  800367:	ff 75 d8             	push   -0x28(%ebp)
  80036a:	e8 11 0a 00 00       	call   800d80 <__udivdi3>
  80036f:	83 c4 18             	add    $0x18,%esp
  800372:	52                   	push   %edx
  800373:	50                   	push   %eax
  800374:	89 f2                	mov    %esi,%edx
  800376:	89 f8                	mov    %edi,%eax
  800378:	e8 9f ff ff ff       	call   80031c <printnum>
  80037d:	83 c4 20             	add    $0x20,%esp
  800380:	eb 13                	jmp    800395 <printnum+0x79>
  800382:	83 ec 08             	sub    $0x8,%esp
  800385:	56                   	push   %esi
  800386:	ff 75 18             	push   0x18(%ebp)
  800389:	ff d7                	call   *%edi
  80038b:	83 c4 10             	add    $0x10,%esp
  80038e:	83 eb 01             	sub    $0x1,%ebx
  800391:	85 db                	test   %ebx,%ebx
  800393:	7f ed                	jg     800382 <printnum+0x66>
  800395:	83 ec 08             	sub    $0x8,%esp
  800398:	56                   	push   %esi
  800399:	83 ec 04             	sub    $0x4,%esp
  80039c:	ff 75 e4             	push   -0x1c(%ebp)
  80039f:	ff 75 e0             	push   -0x20(%ebp)
  8003a2:	ff 75 dc             	push   -0x24(%ebp)
  8003a5:	ff 75 d8             	push   -0x28(%ebp)
  8003a8:	e8 f3 0a 00 00       	call   800ea0 <__umoddi3>
  8003ad:	83 c4 14             	add    $0x14,%esp
  8003b0:	0f be 80 77 10 80 00 	movsbl 0x801077(%eax),%eax
  8003b7:	50                   	push   %eax
  8003b8:	ff d7                	call   *%edi
  8003ba:	83 c4 10             	add    $0x10,%esp
  8003bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8003c0:	5b                   	pop    %ebx
  8003c1:	5e                   	pop    %esi
  8003c2:	5f                   	pop    %edi
  8003c3:	5d                   	pop    %ebp
  8003c4:	c3                   	ret

008003c5 <getuint>:
  8003c5:	83 fa 01             	cmp    $0x1,%edx
  8003c8:	7f 13                	jg     8003dd <getuint+0x18>
  8003ca:	85 d2                	test   %edx,%edx
  8003cc:	74 1c                	je     8003ea <getuint+0x25>
  8003ce:	8b 10                	mov    (%eax),%edx
  8003d0:	8d 4a 04             	lea    0x4(%edx),%ecx
  8003d3:	89 08                	mov    %ecx,(%eax)
  8003d5:	8b 02                	mov    (%edx),%eax
  8003d7:	ba 00 00 00 00       	mov    $0x0,%edx
  8003dc:	c3                   	ret
  8003dd:	8b 10                	mov    (%eax),%edx
  8003df:	8d 4a 08             	lea    0x8(%edx),%ecx
  8003e2:	89 08                	mov    %ecx,(%eax)
  8003e4:	8b 02                	mov    (%edx),%eax
  8003e6:	8b 52 04             	mov    0x4(%edx),%edx
  8003e9:	c3                   	ret
  8003ea:	8b 10                	mov    (%eax),%edx
  8003ec:	8d 4a 04             	lea    0x4(%edx),%ecx
  8003ef:	89 08                	mov    %ecx,(%eax)
  8003f1:	8b 02                	mov    (%edx),%eax
  8003f3:	ba 00 00 00 00       	mov    $0x0,%edx
  8003f8:	c3                   	ret

008003f9 <getint>:
  8003f9:	83 fa 01             	cmp    $0x1,%edx
  8003fc:	7f 0f                	jg     80040d <getint+0x14>
  8003fe:	85 d2                	test   %edx,%edx
  800400:	74 18                	je     80041a <getint+0x21>
  800402:	8b 10                	mov    (%eax),%edx
  800404:	8d 4a 04             	lea    0x4(%edx),%ecx
  800407:	89 08                	mov    %ecx,(%eax)
  800409:	8b 02                	mov    (%edx),%eax
  80040b:	99                   	cltd
  80040c:	c3                   	ret
  80040d:	8b 10                	mov    (%eax),%edx
  80040f:	8d 4a 08             	lea    0x8(%edx),%ecx
  800412:	89 08                	mov    %ecx,(%eax)
  800414:	8b 02                	mov    (%edx),%eax
  800416:	8b 52 04             	mov    0x4(%edx),%edx
  800419:	c3                   	ret
  80041a:	8b 10                	mov    (%eax),%edx
  80041c:	8d 4a 04             	lea    0x4(%edx),%ecx
  80041f:	89 08                	mov    %ecx,(%eax)
  800421:	8b 02                	mov    (%edx),%eax
  800423:	99                   	cltd
  800424:	c3                   	ret

00800425 <sprintputch>:
  800425:	55                   	push   %ebp
  800426:	89 e5                	mov    %esp,%ebp
  800428:	8b 45 0c             	mov    0xc(%ebp),%eax
  80042b:	83 40 08 01          	addl   $0x1,0x8(%eax)
  80042f:	8b 10                	mov    (%eax),%edx
  800431:	3b 50 04             	cmp    0x4(%eax),%edx
  800434:	73 0a                	jae    800440 <sprintputch+0x1b>
  800436:	8d 4a 01             	lea    0x1(%edx),%ecx
  800439:	89 08                	mov    %ecx,(%eax)
  80043b:	8b 45 08             	mov    0x8(%ebp),%eax
  80043e:	88 02                	mov    %al,(%edx)
  800440:	5d                   	pop    %ebp
  800441:	c3                   	ret

00800442 <printfmt>:
  800442:	55                   	push   %ebp
  800443:	89 e5                	mov    %esp,%ebp
  800445:	83 ec 08             	sub    $0x8,%esp
  800448:	8d 45 14             	lea    0x14(%ebp),%eax
  80044b:	50                   	push   %eax
  80044c:	ff 75 10             	push   0x10(%ebp)
  80044f:	ff 75 0c             	push   0xc(%ebp)
  800452:	ff 75 08             	push   0x8(%ebp)
  800455:	e8 05 00 00 00       	call   80045f <vprintfmt>
  80045a:	83 c4 10             	add    $0x10,%esp
  80045d:	c9                   	leave
  80045e:	c3                   	ret

0080045f <vprintfmt>:
  80045f:	55                   	push   %ebp
  800460:	89 e5                	mov    %esp,%ebp
  800462:	57                   	push   %edi
  800463:	56                   	push   %esi
  800464:	53                   	push   %ebx
  800465:	83 ec 2c             	sub    $0x2c,%esp
  800468:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80046b:	8b 75 0c             	mov    0xc(%ebp),%esi
  80046e:	8b 7d 10             	mov    0x10(%ebp),%edi
  800471:	eb 0a                	jmp    80047d <vprintfmt+0x1e>
  800473:	83 ec 08             	sub    $0x8,%esp
  800476:	56                   	push   %esi
  800477:	50                   	push   %eax
  800478:	ff d3                	call   *%ebx
  80047a:	83 c4 10             	add    $0x10,%esp
  80047d:	83 c7 01             	add    $0x1,%edi
  800480:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800484:	83 f8 25             	cmp    $0x25,%eax
  800487:	74 0c                	je     800495 <vprintfmt+0x36>
  800489:	85 c0                	test   %eax,%eax
  80048b:	75 e6                	jne    800473 <vprintfmt+0x14>
  80048d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800490:	5b                   	pop    %ebx
  800491:	5e                   	pop    %esi
  800492:	5f                   	pop    %edi
  800493:	5d                   	pop    %ebp
  800494:	c3                   	ret
  800495:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800499:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  8004a0:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8004a7:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  8004ae:	b9 00 00 00 00       	mov    $0x0,%ecx
  8004b3:	8d 47 01             	lea    0x1(%edi),%eax
  8004b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8004b9:	0f b6 17             	movzbl (%edi),%edx
  8004bc:	8d 42 dd             	lea    -0x23(%edx),%eax
  8004bf:	3c 55                	cmp    $0x55,%al
  8004c1:	0f 87 c3 02 00 00    	ja     80078a <vprintfmt+0x32b>
  8004c7:	0f b6 c0             	movzbl %al,%eax
  8004ca:	ff 24 85 80 11 80 00 	jmp    *0x801180(,%eax,4)
  8004d1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004d4:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  8004d8:	eb d9                	jmp    8004b3 <vprintfmt+0x54>
  8004da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004dd:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  8004e1:	eb d0                	jmp    8004b3 <vprintfmt+0x54>
  8004e3:	0f b6 d2             	movzbl %dl,%edx
  8004e6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8004ee:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  8004f1:	8d 04 80             	lea    (%eax,%eax,4),%eax
  8004f4:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  8004f8:	0f be 17             	movsbl (%edi),%edx
  8004fb:	8d 4a d0             	lea    -0x30(%edx),%ecx
  8004fe:	83 f9 09             	cmp    $0x9,%ecx
  800501:	77 52                	ja     800555 <vprintfmt+0xf6>
  800503:	83 c7 01             	add    $0x1,%edi
  800506:	eb e9                	jmp    8004f1 <vprintfmt+0x92>
  800508:	8b 45 14             	mov    0x14(%ebp),%eax
  80050b:	8d 50 04             	lea    0x4(%eax),%edx
  80050e:	89 55 14             	mov    %edx,0x14(%ebp)
  800511:	8b 00                	mov    (%eax),%eax
  800513:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800516:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800519:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80051d:	79 94                	jns    8004b3 <vprintfmt+0x54>
  80051f:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800522:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800525:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80052c:	eb 85                	jmp    8004b3 <vprintfmt+0x54>
  80052e:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800531:	85 d2                	test   %edx,%edx
  800533:	b8 00 00 00 00       	mov    $0x0,%eax
  800538:	0f 49 c2             	cmovns %edx,%eax
  80053b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80053e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800541:	e9 6d ff ff ff       	jmp    8004b3 <vprintfmt+0x54>
  800546:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800549:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  800550:	e9 5e ff ff ff       	jmp    8004b3 <vprintfmt+0x54>
  800555:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  800558:	89 45 d0             	mov    %eax,-0x30(%ebp)
  80055b:	eb bc                	jmp    800519 <vprintfmt+0xba>
  80055d:	83 c1 01             	add    $0x1,%ecx
  800560:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800563:	e9 4b ff ff ff       	jmp    8004b3 <vprintfmt+0x54>
  800568:	8b 45 14             	mov    0x14(%ebp),%eax
  80056b:	8d 50 04             	lea    0x4(%eax),%edx
  80056e:	89 55 14             	mov    %edx,0x14(%ebp)
  800571:	83 ec 08             	sub    $0x8,%esp
  800574:	56                   	push   %esi
  800575:	ff 30                	push   (%eax)
  800577:	ff d3                	call   *%ebx
  800579:	83 c4 10             	add    $0x10,%esp
  80057c:	e9 a0 01 00 00       	jmp    800721 <vprintfmt+0x2c2>
  800581:	8b 45 14             	mov    0x14(%ebp),%eax
  800584:	8d 50 04             	lea    0x4(%eax),%edx
  800587:	89 55 14             	mov    %edx,0x14(%ebp)
  80058a:	8b 10                	mov    (%eax),%edx
  80058c:	89 d0                	mov    %edx,%eax
  80058e:	f7 d8                	neg    %eax
  800590:	0f 48 c2             	cmovs  %edx,%eax
  800593:	83 f8 08             	cmp    $0x8,%eax
  800596:	7f 20                	jg     8005b8 <vprintfmt+0x159>
  800598:	8b 14 85 e0 12 80 00 	mov    0x8012e0(,%eax,4),%edx
  80059f:	85 d2                	test   %edx,%edx
  8005a1:	74 15                	je     8005b8 <vprintfmt+0x159>
  8005a3:	52                   	push   %edx
  8005a4:	68 98 10 80 00       	push   $0x801098
  8005a9:	56                   	push   %esi
  8005aa:	53                   	push   %ebx
  8005ab:	e8 92 fe ff ff       	call   800442 <printfmt>
  8005b0:	83 c4 10             	add    $0x10,%esp
  8005b3:	e9 69 01 00 00       	jmp    800721 <vprintfmt+0x2c2>
  8005b8:	50                   	push   %eax
  8005b9:	68 8f 10 80 00       	push   $0x80108f
  8005be:	56                   	push   %esi
  8005bf:	53                   	push   %ebx
  8005c0:	e8 7d fe ff ff       	call   800442 <printfmt>
  8005c5:	83 c4 10             	add    $0x10,%esp
  8005c8:	e9 54 01 00 00       	jmp    800721 <vprintfmt+0x2c2>
  8005cd:	8b 45 14             	mov    0x14(%ebp),%eax
  8005d0:	8d 50 04             	lea    0x4(%eax),%edx
  8005d3:	89 55 14             	mov    %edx,0x14(%ebp)
  8005d6:	8b 08                	mov    (%eax),%ecx
  8005d8:	85 c9                	test   %ecx,%ecx
  8005da:	b8 88 10 80 00       	mov    $0x801088,%eax
  8005df:	0f 45 c1             	cmovne %ecx,%eax
  8005e2:	89 45 cc             	mov    %eax,-0x34(%ebp)
  8005e5:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8005e9:	7e 06                	jle    8005f1 <vprintfmt+0x192>
  8005eb:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  8005ef:	75 0b                	jne    8005fc <vprintfmt+0x19d>
  8005f1:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  8005f4:	8b 7d d0             	mov    -0x30(%ebp),%edi
  8005f7:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8005fa:	eb 5c                	jmp    800658 <vprintfmt+0x1f9>
  8005fc:	83 ec 08             	sub    $0x8,%esp
  8005ff:	ff 75 d0             	push   -0x30(%ebp)
  800602:	ff 75 cc             	push   -0x34(%ebp)
  800605:	e8 20 02 00 00       	call   80082a <strnlen>
  80060a:	89 c2                	mov    %eax,%edx
  80060c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80060f:	29 d0                	sub    %edx,%eax
  800611:	83 c4 10             	add    $0x10,%esp
  800614:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800618:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80061b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80061e:	89 c3                	mov    %eax,%ebx
  800620:	eb 0e                	jmp    800630 <vprintfmt+0x1d1>
  800622:	83 ec 08             	sub    $0x8,%esp
  800625:	56                   	push   %esi
  800626:	57                   	push   %edi
  800627:	ff 55 08             	call   *0x8(%ebp)
  80062a:	83 eb 01             	sub    $0x1,%ebx
  80062d:	83 c4 10             	add    $0x10,%esp
  800630:	85 db                	test   %ebx,%ebx
  800632:	7f ee                	jg     800622 <vprintfmt+0x1c3>
  800634:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800637:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80063a:	85 c0                	test   %eax,%eax
  80063c:	ba 00 00 00 00       	mov    $0x0,%edx
  800641:	0f 49 d0             	cmovns %eax,%edx
  800644:	29 d0                	sub    %edx,%eax
  800646:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800649:	eb a6                	jmp    8005f1 <vprintfmt+0x192>
  80064b:	83 ec 08             	sub    $0x8,%esp
  80064e:	56                   	push   %esi
  80064f:	52                   	push   %edx
  800650:	ff 55 08             	call   *0x8(%ebp)
  800653:	83 c4 10             	add    $0x10,%esp
  800656:	89 d9                	mov    %ebx,%ecx
  800658:	8d 59 01             	lea    0x1(%ecx),%ebx
  80065b:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  80065f:	0f be d0             	movsbl %al,%edx
  800662:	85 d2                	test   %edx,%edx
  800664:	74 28                	je     80068e <vprintfmt+0x22f>
  800666:	85 ff                	test   %edi,%edi
  800668:	78 05                	js     80066f <vprintfmt+0x210>
  80066a:	83 ef 01             	sub    $0x1,%edi
  80066d:	78 2e                	js     80069d <vprintfmt+0x23e>
  80066f:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800673:	74 d6                	je     80064b <vprintfmt+0x1ec>
  800675:	0f be c0             	movsbl %al,%eax
  800678:	83 e8 20             	sub    $0x20,%eax
  80067b:	83 f8 5e             	cmp    $0x5e,%eax
  80067e:	76 cb                	jbe    80064b <vprintfmt+0x1ec>
  800680:	83 ec 08             	sub    $0x8,%esp
  800683:	56                   	push   %esi
  800684:	6a 3f                	push   $0x3f
  800686:	ff 55 08             	call   *0x8(%ebp)
  800689:	83 c4 10             	add    $0x10,%esp
  80068c:	eb c8                	jmp    800656 <vprintfmt+0x1f7>
  80068e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800691:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800694:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800697:	01 c7                	add    %eax,%edi
  800699:	29 cf                	sub    %ecx,%edi
  80069b:	eb 13                	jmp    8006b0 <vprintfmt+0x251>
  80069d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006a0:	eb ef                	jmp    800691 <vprintfmt+0x232>
  8006a2:	83 ec 08             	sub    $0x8,%esp
  8006a5:	56                   	push   %esi
  8006a6:	6a 20                	push   $0x20
  8006a8:	ff d3                	call   *%ebx
  8006aa:	83 ef 01             	sub    $0x1,%edi
  8006ad:	83 c4 10             	add    $0x10,%esp
  8006b0:	85 ff                	test   %edi,%edi
  8006b2:	7f ee                	jg     8006a2 <vprintfmt+0x243>
  8006b4:	eb 6b                	jmp    800721 <vprintfmt+0x2c2>
  8006b6:	89 ca                	mov    %ecx,%edx
  8006b8:	8d 45 14             	lea    0x14(%ebp),%eax
  8006bb:	e8 39 fd ff ff       	call   8003f9 <getint>
  8006c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8006c3:	89 55 dc             	mov    %edx,-0x24(%ebp)
  8006c6:	85 d2                	test   %edx,%edx
  8006c8:	78 0b                	js     8006d5 <vprintfmt+0x276>
  8006ca:	89 d1                	mov    %edx,%ecx
  8006cc:	89 c2                	mov    %eax,%edx
  8006ce:	bf 0a 00 00 00       	mov    $0xa,%edi
  8006d3:	eb 32                	jmp    800707 <vprintfmt+0x2a8>
  8006d5:	83 ec 08             	sub    $0x8,%esp
  8006d8:	56                   	push   %esi
  8006d9:	6a 2d                	push   $0x2d
  8006db:	ff d3                	call   *%ebx
  8006dd:	8b 55 d8             	mov    -0x28(%ebp),%edx
  8006e0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  8006e3:	f7 da                	neg    %edx
  8006e5:	83 d1 00             	adc    $0x0,%ecx
  8006e8:	f7 d9                	neg    %ecx
  8006ea:	83 c4 10             	add    $0x10,%esp
  8006ed:	bf 0a 00 00 00       	mov    $0xa,%edi
  8006f2:	eb 13                	jmp    800707 <vprintfmt+0x2a8>
  8006f4:	89 ca                	mov    %ecx,%edx
  8006f6:	8d 45 14             	lea    0x14(%ebp),%eax
  8006f9:	e8 c7 fc ff ff       	call   8003c5 <getuint>
  8006fe:	89 d1                	mov    %edx,%ecx
  800700:	89 c2                	mov    %eax,%edx
  800702:	bf 0a 00 00 00       	mov    $0xa,%edi
  800707:	83 ec 0c             	sub    $0xc,%esp
  80070a:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80070e:	50                   	push   %eax
  80070f:	ff 75 e0             	push   -0x20(%ebp)
  800712:	57                   	push   %edi
  800713:	51                   	push   %ecx
  800714:	52                   	push   %edx
  800715:	89 f2                	mov    %esi,%edx
  800717:	89 d8                	mov    %ebx,%eax
  800719:	e8 fe fb ff ff       	call   80031c <printnum>
  80071e:	83 c4 20             	add    $0x20,%esp
  800721:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800724:	e9 54 fd ff ff       	jmp    80047d <vprintfmt+0x1e>
  800729:	89 ca                	mov    %ecx,%edx
  80072b:	8d 45 14             	lea    0x14(%ebp),%eax
  80072e:	e8 92 fc ff ff       	call   8003c5 <getuint>
  800733:	89 d1                	mov    %edx,%ecx
  800735:	89 c2                	mov    %eax,%edx
  800737:	bf 08 00 00 00       	mov    $0x8,%edi
  80073c:	eb c9                	jmp    800707 <vprintfmt+0x2a8>
  80073e:	83 ec 08             	sub    $0x8,%esp
  800741:	56                   	push   %esi
  800742:	6a 30                	push   $0x30
  800744:	ff d3                	call   *%ebx
  800746:	83 c4 08             	add    $0x8,%esp
  800749:	56                   	push   %esi
  80074a:	6a 78                	push   $0x78
  80074c:	ff d3                	call   *%ebx
  80074e:	8b 45 14             	mov    0x14(%ebp),%eax
  800751:	8d 50 04             	lea    0x4(%eax),%edx
  800754:	89 55 14             	mov    %edx,0x14(%ebp)
  800757:	8b 10                	mov    (%eax),%edx
  800759:	b9 00 00 00 00       	mov    $0x0,%ecx
  80075e:	83 c4 10             	add    $0x10,%esp
  800761:	bf 10 00 00 00       	mov    $0x10,%edi
  800766:	eb 9f                	jmp    800707 <vprintfmt+0x2a8>
  800768:	89 ca                	mov    %ecx,%edx
  80076a:	8d 45 14             	lea    0x14(%ebp),%eax
  80076d:	e8 53 fc ff ff       	call   8003c5 <getuint>
  800772:	89 d1                	mov    %edx,%ecx
  800774:	89 c2                	mov    %eax,%edx
  800776:	bf 10 00 00 00       	mov    $0x10,%edi
  80077b:	eb 8a                	jmp    800707 <vprintfmt+0x2a8>
  80077d:	83 ec 08             	sub    $0x8,%esp
  800780:	56                   	push   %esi
  800781:	6a 25                	push   $0x25
  800783:	ff d3                	call   *%ebx
  800785:	83 c4 10             	add    $0x10,%esp
  800788:	eb 97                	jmp    800721 <vprintfmt+0x2c2>
  80078a:	83 ec 08             	sub    $0x8,%esp
  80078d:	56                   	push   %esi
  80078e:	6a 25                	push   $0x25
  800790:	ff d3                	call   *%ebx
  800792:	83 c4 10             	add    $0x10,%esp
  800795:	89 f8                	mov    %edi,%eax
  800797:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  80079b:	74 05                	je     8007a2 <vprintfmt+0x343>
  80079d:	83 e8 01             	sub    $0x1,%eax
  8007a0:	eb f5                	jmp    800797 <vprintfmt+0x338>
  8007a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8007a5:	e9 77 ff ff ff       	jmp    800721 <vprintfmt+0x2c2>

008007aa <vsnprintf>:
  8007aa:	55                   	push   %ebp
  8007ab:	89 e5                	mov    %esp,%ebp
  8007ad:	83 ec 18             	sub    $0x18,%esp
  8007b0:	8b 45 08             	mov    0x8(%ebp),%eax
  8007b3:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  8007b9:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  8007bd:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  8007c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  8007c7:	85 c0                	test   %eax,%eax
  8007c9:	74 26                	je     8007f1 <vsnprintf+0x47>
  8007cb:	85 d2                	test   %edx,%edx
  8007cd:	7e 22                	jle    8007f1 <vsnprintf+0x47>
  8007cf:	ff 75 14             	push   0x14(%ebp)
  8007d2:	ff 75 10             	push   0x10(%ebp)
  8007d5:	8d 45 ec             	lea    -0x14(%ebp),%eax
  8007d8:	50                   	push   %eax
  8007d9:	68 25 04 80 00       	push   $0x800425
  8007de:	e8 7c fc ff ff       	call   80045f <vprintfmt>
  8007e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  8007e6:	c6 00 00             	movb   $0x0,(%eax)
  8007e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  8007ec:	83 c4 10             	add    $0x10,%esp
  8007ef:	c9                   	leave
  8007f0:	c3                   	ret
  8007f1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8007f6:	eb f7                	jmp    8007ef <vsnprintf+0x45>

008007f8 <snprintf>:
  8007f8:	55                   	push   %ebp
  8007f9:	89 e5                	mov    %esp,%ebp
  8007fb:	83 ec 08             	sub    $0x8,%esp
  8007fe:	8d 45 14             	lea    0x14(%ebp),%eax
  800801:	50                   	push   %eax
  800802:	ff 75 10             	push   0x10(%ebp)
  800805:	ff 75 0c             	push   0xc(%ebp)
  800808:	ff 75 08             	push   0x8(%ebp)
  80080b:	e8 9a ff ff ff       	call   8007aa <vsnprintf>
  800810:	c9                   	leave
  800811:	c3                   	ret

00800812 <strlen>:
  800812:	55                   	push   %ebp
  800813:	89 e5                	mov    %esp,%ebp
  800815:	8b 55 08             	mov    0x8(%ebp),%edx
  800818:	b8 00 00 00 00       	mov    $0x0,%eax
  80081d:	eb 03                	jmp    800822 <strlen+0x10>
  80081f:	83 c0 01             	add    $0x1,%eax
  800822:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800826:	75 f7                	jne    80081f <strlen+0xd>
  800828:	5d                   	pop    %ebp
  800829:	c3                   	ret

0080082a <strnlen>:
  80082a:	55                   	push   %ebp
  80082b:	89 e5                	mov    %esp,%ebp
  80082d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800830:	8b 55 0c             	mov    0xc(%ebp),%edx
  800833:	b8 00 00 00 00       	mov    $0x0,%eax
  800838:	eb 03                	jmp    80083d <strnlen+0x13>
  80083a:	83 c0 01             	add    $0x1,%eax
  80083d:	39 d0                	cmp    %edx,%eax
  80083f:	74 08                	je     800849 <strnlen+0x1f>
  800841:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  800845:	75 f3                	jne    80083a <strnlen+0x10>
  800847:	89 c2                	mov    %eax,%edx
  800849:	89 d0                	mov    %edx,%eax
  80084b:	5d                   	pop    %ebp
  80084c:	c3                   	ret

0080084d <strcpy>:
  80084d:	55                   	push   %ebp
  80084e:	89 e5                	mov    %esp,%ebp
  800850:	53                   	push   %ebx
  800851:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800854:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800857:	b8 00 00 00 00       	mov    $0x0,%eax
  80085c:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  800860:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  800863:	83 c0 01             	add    $0x1,%eax
  800866:	84 d2                	test   %dl,%dl
  800868:	75 f2                	jne    80085c <strcpy+0xf>
  80086a:	89 c8                	mov    %ecx,%eax
  80086c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80086f:	c9                   	leave
  800870:	c3                   	ret

00800871 <strcat>:
  800871:	55                   	push   %ebp
  800872:	89 e5                	mov    %esp,%ebp
  800874:	53                   	push   %ebx
  800875:	83 ec 10             	sub    $0x10,%esp
  800878:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80087b:	53                   	push   %ebx
  80087c:	e8 91 ff ff ff       	call   800812 <strlen>
  800881:	83 c4 08             	add    $0x8,%esp
  800884:	ff 75 0c             	push   0xc(%ebp)
  800887:	01 d8                	add    %ebx,%eax
  800889:	50                   	push   %eax
  80088a:	e8 be ff ff ff       	call   80084d <strcpy>
  80088f:	89 d8                	mov    %ebx,%eax
  800891:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800894:	c9                   	leave
  800895:	c3                   	ret

00800896 <strncpy>:
  800896:	55                   	push   %ebp
  800897:	89 e5                	mov    %esp,%ebp
  800899:	56                   	push   %esi
  80089a:	53                   	push   %ebx
  80089b:	8b 75 08             	mov    0x8(%ebp),%esi
  80089e:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008a1:	89 f3                	mov    %esi,%ebx
  8008a3:	03 5d 10             	add    0x10(%ebp),%ebx
  8008a6:	89 f0                	mov    %esi,%eax
  8008a8:	eb 0f                	jmp    8008b9 <strncpy+0x23>
  8008aa:	83 c0 01             	add    $0x1,%eax
  8008ad:	0f b6 0a             	movzbl (%edx),%ecx
  8008b0:	88 48 ff             	mov    %cl,-0x1(%eax)
  8008b3:	80 f9 01             	cmp    $0x1,%cl
  8008b6:	83 da ff             	sbb    $0xffffffff,%edx
  8008b9:	39 d8                	cmp    %ebx,%eax
  8008bb:	75 ed                	jne    8008aa <strncpy+0x14>
  8008bd:	89 f0                	mov    %esi,%eax
  8008bf:	5b                   	pop    %ebx
  8008c0:	5e                   	pop    %esi
  8008c1:	5d                   	pop    %ebp
  8008c2:	c3                   	ret

008008c3 <strlcpy>:
  8008c3:	55                   	push   %ebp
  8008c4:	89 e5                	mov    %esp,%ebp
  8008c6:	56                   	push   %esi
  8008c7:	53                   	push   %ebx
  8008c8:	8b 75 08             	mov    0x8(%ebp),%esi
  8008cb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8008ce:	8b 55 10             	mov    0x10(%ebp),%edx
  8008d1:	89 f0                	mov    %esi,%eax
  8008d3:	85 d2                	test   %edx,%edx
  8008d5:	74 21                	je     8008f8 <strlcpy+0x35>
  8008d7:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  8008db:	89 f2                	mov    %esi,%edx
  8008dd:	eb 09                	jmp    8008e8 <strlcpy+0x25>
  8008df:	83 c1 01             	add    $0x1,%ecx
  8008e2:	83 c2 01             	add    $0x1,%edx
  8008e5:	88 5a ff             	mov    %bl,-0x1(%edx)
  8008e8:	39 c2                	cmp    %eax,%edx
  8008ea:	74 09                	je     8008f5 <strlcpy+0x32>
  8008ec:	0f b6 19             	movzbl (%ecx),%ebx
  8008ef:	84 db                	test   %bl,%bl
  8008f1:	75 ec                	jne    8008df <strlcpy+0x1c>
  8008f3:	89 d0                	mov    %edx,%eax
  8008f5:	c6 00 00             	movb   $0x0,(%eax)
  8008f8:	29 f0                	sub    %esi,%eax
  8008fa:	5b                   	pop    %ebx
  8008fb:	5e                   	pop    %esi
  8008fc:	5d                   	pop    %ebp
  8008fd:	c3                   	ret

008008fe <strcmp>:
  8008fe:	55                   	push   %ebp
  8008ff:	89 e5                	mov    %esp,%ebp
  800901:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800904:	8b 55 0c             	mov    0xc(%ebp),%edx
  800907:	eb 06                	jmp    80090f <strcmp+0x11>
  800909:	83 c1 01             	add    $0x1,%ecx
  80090c:	83 c2 01             	add    $0x1,%edx
  80090f:	0f b6 01             	movzbl (%ecx),%eax
  800912:	84 c0                	test   %al,%al
  800914:	74 04                	je     80091a <strcmp+0x1c>
  800916:	3a 02                	cmp    (%edx),%al
  800918:	74 ef                	je     800909 <strcmp+0xb>
  80091a:	0f b6 c0             	movzbl %al,%eax
  80091d:	0f b6 12             	movzbl (%edx),%edx
  800920:	29 d0                	sub    %edx,%eax
  800922:	5d                   	pop    %ebp
  800923:	c3                   	ret

00800924 <strncmp>:
  800924:	55                   	push   %ebp
  800925:	89 e5                	mov    %esp,%ebp
  800927:	53                   	push   %ebx
  800928:	8b 45 08             	mov    0x8(%ebp),%eax
  80092b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80092e:	8b 55 10             	mov    0x10(%ebp),%edx
  800931:	eb 09                	jmp    80093c <strncmp+0x18>
  800933:	83 ea 01             	sub    $0x1,%edx
  800936:	83 c0 01             	add    $0x1,%eax
  800939:	83 c1 01             	add    $0x1,%ecx
  80093c:	85 d2                	test   %edx,%edx
  80093e:	74 18                	je     800958 <strncmp+0x34>
  800940:	0f b6 18             	movzbl (%eax),%ebx
  800943:	84 db                	test   %bl,%bl
  800945:	74 04                	je     80094b <strncmp+0x27>
  800947:	3a 19                	cmp    (%ecx),%bl
  800949:	74 e8                	je     800933 <strncmp+0xf>
  80094b:	0f b6 00             	movzbl (%eax),%eax
  80094e:	0f b6 11             	movzbl (%ecx),%edx
  800951:	29 d0                	sub    %edx,%eax
  800953:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800956:	c9                   	leave
  800957:	c3                   	ret
  800958:	b8 00 00 00 00       	mov    $0x0,%eax
  80095d:	eb f4                	jmp    800953 <strncmp+0x2f>

0080095f <strchr>:
  80095f:	55                   	push   %ebp
  800960:	89 e5                	mov    %esp,%ebp
  800962:	8b 45 08             	mov    0x8(%ebp),%eax
  800965:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800969:	eb 03                	jmp    80096e <strchr+0xf>
  80096b:	83 c0 01             	add    $0x1,%eax
  80096e:	0f b6 10             	movzbl (%eax),%edx
  800971:	84 d2                	test   %dl,%dl
  800973:	74 06                	je     80097b <strchr+0x1c>
  800975:	38 ca                	cmp    %cl,%dl
  800977:	75 f2                	jne    80096b <strchr+0xc>
  800979:	eb 05                	jmp    800980 <strchr+0x21>
  80097b:	b8 00 00 00 00       	mov    $0x0,%eax
  800980:	5d                   	pop    %ebp
  800981:	c3                   	ret

00800982 <strfind>:
  800982:	55                   	push   %ebp
  800983:	89 e5                	mov    %esp,%ebp
  800985:	8b 45 08             	mov    0x8(%ebp),%eax
  800988:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  80098c:	0f b6 10             	movzbl (%eax),%edx
  80098f:	38 ca                	cmp    %cl,%dl
  800991:	74 09                	je     80099c <strfind+0x1a>
  800993:	84 d2                	test   %dl,%dl
  800995:	74 05                	je     80099c <strfind+0x1a>
  800997:	83 c0 01             	add    $0x1,%eax
  80099a:	eb f0                	jmp    80098c <strfind+0xa>
  80099c:	5d                   	pop    %ebp
  80099d:	c3                   	ret

0080099e <memset>:
  80099e:	55                   	push   %ebp
  80099f:	89 e5                	mov    %esp,%ebp
  8009a1:	57                   	push   %edi
  8009a2:	8b 55 08             	mov    0x8(%ebp),%edx
  8009a5:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8009a8:	85 c9                	test   %ecx,%ecx
  8009aa:	74 24                	je     8009d0 <memset+0x32>
  8009ac:	89 d0                	mov    %edx,%eax
  8009ae:	09 c8                	or     %ecx,%eax
  8009b0:	a8 03                	test   $0x3,%al
  8009b2:	75 14                	jne    8009c8 <memset+0x2a>
  8009b4:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  8009b8:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  8009be:	c1 e9 02             	shr    $0x2,%ecx
  8009c1:	89 d7                	mov    %edx,%edi
  8009c3:	fc                   	cld
  8009c4:	f3 ab                	rep stos %eax,%es:(%edi)
  8009c6:	eb 08                	jmp    8009d0 <memset+0x32>
  8009c8:	89 d7                	mov    %edx,%edi
  8009ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  8009cd:	fc                   	cld
  8009ce:	f3 aa                	rep stos %al,%es:(%edi)
  8009d0:	89 d0                	mov    %edx,%eax
  8009d2:	8b 7d fc             	mov    -0x4(%ebp),%edi
  8009d5:	c9                   	leave
  8009d6:	c3                   	ret

008009d7 <memmove>:
  8009d7:	55                   	push   %ebp
  8009d8:	89 e5                	mov    %esp,%ebp
  8009da:	57                   	push   %edi
  8009db:	56                   	push   %esi
  8009dc:	8b 45 08             	mov    0x8(%ebp),%eax
  8009df:	8b 75 0c             	mov    0xc(%ebp),%esi
  8009e2:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8009e5:	39 c6                	cmp    %eax,%esi
  8009e7:	73 32                	jae    800a1b <memmove+0x44>
  8009e9:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  8009ec:	39 d0                	cmp    %edx,%eax
  8009ee:	73 2b                	jae    800a1b <memmove+0x44>
  8009f0:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  8009f3:	89 fe                	mov    %edi,%esi
  8009f5:	09 ce                	or     %ecx,%esi
  8009f7:	09 d6                	or     %edx,%esi
  8009f9:	f7 c6 03 00 00 00    	test   $0x3,%esi
  8009ff:	75 0e                	jne    800a0f <memmove+0x38>
  800a01:	83 ef 04             	sub    $0x4,%edi
  800a04:	8d 72 fc             	lea    -0x4(%edx),%esi
  800a07:	c1 e9 02             	shr    $0x2,%ecx
  800a0a:	fd                   	std
  800a0b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a0d:	eb 09                	jmp    800a18 <memmove+0x41>
  800a0f:	83 ef 01             	sub    $0x1,%edi
  800a12:	8d 72 ff             	lea    -0x1(%edx),%esi
  800a15:	fd                   	std
  800a16:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a18:	fc                   	cld
  800a19:	eb 1a                	jmp    800a35 <memmove+0x5e>
  800a1b:	89 c2                	mov    %eax,%edx
  800a1d:	09 ca                	or     %ecx,%edx
  800a1f:	09 f2                	or     %esi,%edx
  800a21:	f6 c2 03             	test   $0x3,%dl
  800a24:	75 0a                	jne    800a30 <memmove+0x59>
  800a26:	c1 e9 02             	shr    $0x2,%ecx
  800a29:	89 c7                	mov    %eax,%edi
  800a2b:	fc                   	cld
  800a2c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a2e:	eb 05                	jmp    800a35 <memmove+0x5e>
  800a30:	89 c7                	mov    %eax,%edi
  800a32:	fc                   	cld
  800a33:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a35:	5e                   	pop    %esi
  800a36:	5f                   	pop    %edi
  800a37:	5d                   	pop    %ebp
  800a38:	c3                   	ret

00800a39 <memcpy>:
  800a39:	55                   	push   %ebp
  800a3a:	89 e5                	mov    %esp,%ebp
  800a3c:	83 ec 0c             	sub    $0xc,%esp
  800a3f:	ff 75 10             	push   0x10(%ebp)
  800a42:	ff 75 0c             	push   0xc(%ebp)
  800a45:	ff 75 08             	push   0x8(%ebp)
  800a48:	e8 8a ff ff ff       	call   8009d7 <memmove>
  800a4d:	c9                   	leave
  800a4e:	c3                   	ret

00800a4f <memcmp>:
  800a4f:	55                   	push   %ebp
  800a50:	89 e5                	mov    %esp,%ebp
  800a52:	56                   	push   %esi
  800a53:	53                   	push   %ebx
  800a54:	8b 45 08             	mov    0x8(%ebp),%eax
  800a57:	8b 55 0c             	mov    0xc(%ebp),%edx
  800a5a:	89 c6                	mov    %eax,%esi
  800a5c:	03 75 10             	add    0x10(%ebp),%esi
  800a5f:	eb 06                	jmp    800a67 <memcmp+0x18>
  800a61:	83 c0 01             	add    $0x1,%eax
  800a64:	83 c2 01             	add    $0x1,%edx
  800a67:	39 f0                	cmp    %esi,%eax
  800a69:	74 14                	je     800a7f <memcmp+0x30>
  800a6b:	0f b6 08             	movzbl (%eax),%ecx
  800a6e:	0f b6 1a             	movzbl (%edx),%ebx
  800a71:	38 d9                	cmp    %bl,%cl
  800a73:	74 ec                	je     800a61 <memcmp+0x12>
  800a75:	0f b6 c1             	movzbl %cl,%eax
  800a78:	0f b6 db             	movzbl %bl,%ebx
  800a7b:	29 d8                	sub    %ebx,%eax
  800a7d:	eb 05                	jmp    800a84 <memcmp+0x35>
  800a7f:	b8 00 00 00 00       	mov    $0x0,%eax
  800a84:	5b                   	pop    %ebx
  800a85:	5e                   	pop    %esi
  800a86:	5d                   	pop    %ebp
  800a87:	c3                   	ret

00800a88 <memfind>:
  800a88:	55                   	push   %ebp
  800a89:	89 e5                	mov    %esp,%ebp
  800a8b:	8b 45 08             	mov    0x8(%ebp),%eax
  800a8e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800a91:	89 c2                	mov    %eax,%edx
  800a93:	03 55 10             	add    0x10(%ebp),%edx
  800a96:	eb 03                	jmp    800a9b <memfind+0x13>
  800a98:	83 c0 01             	add    $0x1,%eax
  800a9b:	39 d0                	cmp    %edx,%eax
  800a9d:	73 04                	jae    800aa3 <memfind+0x1b>
  800a9f:	38 08                	cmp    %cl,(%eax)
  800aa1:	75 f5                	jne    800a98 <memfind+0x10>
  800aa3:	5d                   	pop    %ebp
  800aa4:	c3                   	ret

00800aa5 <strtol>:
  800aa5:	55                   	push   %ebp
  800aa6:	89 e5                	mov    %esp,%ebp
  800aa8:	57                   	push   %edi
  800aa9:	56                   	push   %esi
  800aaa:	53                   	push   %ebx
  800aab:	8b 55 08             	mov    0x8(%ebp),%edx
  800aae:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800ab1:	eb 03                	jmp    800ab6 <strtol+0x11>
  800ab3:	83 c2 01             	add    $0x1,%edx
  800ab6:	0f b6 02             	movzbl (%edx),%eax
  800ab9:	3c 20                	cmp    $0x20,%al
  800abb:	74 f6                	je     800ab3 <strtol+0xe>
  800abd:	3c 09                	cmp    $0x9,%al
  800abf:	74 f2                	je     800ab3 <strtol+0xe>
  800ac1:	3c 2b                	cmp    $0x2b,%al
  800ac3:	74 2a                	je     800aef <strtol+0x4a>
  800ac5:	bf 00 00 00 00       	mov    $0x0,%edi
  800aca:	3c 2d                	cmp    $0x2d,%al
  800acc:	74 2b                	je     800af9 <strtol+0x54>
  800ace:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800ad4:	75 0f                	jne    800ae5 <strtol+0x40>
  800ad6:	80 3a 30             	cmpb   $0x30,(%edx)
  800ad9:	74 28                	je     800b03 <strtol+0x5e>
  800adb:	85 db                	test   %ebx,%ebx
  800add:	b8 0a 00 00 00       	mov    $0xa,%eax
  800ae2:	0f 44 d8             	cmove  %eax,%ebx
  800ae5:	b9 00 00 00 00       	mov    $0x0,%ecx
  800aea:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800aed:	eb 46                	jmp    800b35 <strtol+0x90>
  800aef:	83 c2 01             	add    $0x1,%edx
  800af2:	bf 00 00 00 00       	mov    $0x0,%edi
  800af7:	eb d5                	jmp    800ace <strtol+0x29>
  800af9:	83 c2 01             	add    $0x1,%edx
  800afc:	bf 01 00 00 00       	mov    $0x1,%edi
  800b01:	eb cb                	jmp    800ace <strtol+0x29>
  800b03:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800b07:	74 0e                	je     800b17 <strtol+0x72>
  800b09:	85 db                	test   %ebx,%ebx
  800b0b:	75 d8                	jne    800ae5 <strtol+0x40>
  800b0d:	83 c2 01             	add    $0x1,%edx
  800b10:	bb 08 00 00 00       	mov    $0x8,%ebx
  800b15:	eb ce                	jmp    800ae5 <strtol+0x40>
  800b17:	83 c2 02             	add    $0x2,%edx
  800b1a:	bb 10 00 00 00       	mov    $0x10,%ebx
  800b1f:	eb c4                	jmp    800ae5 <strtol+0x40>
  800b21:	0f be c0             	movsbl %al,%eax
  800b24:	83 e8 30             	sub    $0x30,%eax
  800b27:	3b 45 10             	cmp    0x10(%ebp),%eax
  800b2a:	7d 3a                	jge    800b66 <strtol+0xc1>
  800b2c:	83 c2 01             	add    $0x1,%edx
  800b2f:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800b33:	01 c1                	add    %eax,%ecx
  800b35:	0f b6 02             	movzbl (%edx),%eax
  800b38:	8d 70 d0             	lea    -0x30(%eax),%esi
  800b3b:	89 f3                	mov    %esi,%ebx
  800b3d:	80 fb 09             	cmp    $0x9,%bl
  800b40:	76 df                	jbe    800b21 <strtol+0x7c>
  800b42:	8d 70 9f             	lea    -0x61(%eax),%esi
  800b45:	89 f3                	mov    %esi,%ebx
  800b47:	80 fb 19             	cmp    $0x19,%bl
  800b4a:	77 08                	ja     800b54 <strtol+0xaf>
  800b4c:	0f be c0             	movsbl %al,%eax
  800b4f:	83 e8 57             	sub    $0x57,%eax
  800b52:	eb d3                	jmp    800b27 <strtol+0x82>
  800b54:	8d 70 bf             	lea    -0x41(%eax),%esi
  800b57:	89 f3                	mov    %esi,%ebx
  800b59:	80 fb 19             	cmp    $0x19,%bl
  800b5c:	77 08                	ja     800b66 <strtol+0xc1>
  800b5e:	0f be c0             	movsbl %al,%eax
  800b61:	83 e8 37             	sub    $0x37,%eax
  800b64:	eb c1                	jmp    800b27 <strtol+0x82>
  800b66:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800b6a:	74 05                	je     800b71 <strtol+0xcc>
  800b6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  800b6f:	89 10                	mov    %edx,(%eax)
  800b71:	89 c8                	mov    %ecx,%eax
  800b73:	f7 d8                	neg    %eax
  800b75:	85 ff                	test   %edi,%edi
  800b77:	0f 45 c8             	cmovne %eax,%ecx
  800b7a:	89 c8                	mov    %ecx,%eax
  800b7c:	5b                   	pop    %ebx
  800b7d:	5e                   	pop    %esi
  800b7e:	5f                   	pop    %edi
  800b7f:	5d                   	pop    %ebp
  800b80:	c3                   	ret

00800b81 <syscall>:
  800b81:	55                   	push   %ebp
  800b82:	89 e5                	mov    %esp,%ebp
  800b84:	57                   	push   %edi
  800b85:	56                   	push   %esi
  800b86:	53                   	push   %ebx
  800b87:	83 ec 1c             	sub    $0x1c,%esp
  800b8a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800b8d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800b90:	89 ca                	mov    %ecx,%edx
  800b92:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b95:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800b98:	8b 7d 10             	mov    0x10(%ebp),%edi
  800b9b:	8b 75 14             	mov    0x14(%ebp),%esi
  800b9e:	cd 30                	int    $0x30
  800ba0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800ba4:	74 04                	je     800baa <syscall+0x29>
  800ba6:	85 c0                	test   %eax,%eax
  800ba8:	7f 08                	jg     800bb2 <syscall+0x31>
  800baa:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800bad:	5b                   	pop    %ebx
  800bae:	5e                   	pop    %esi
  800baf:	5f                   	pop    %edi
  800bb0:	5d                   	pop    %ebp
  800bb1:	c3                   	ret
  800bb2:	83 ec 0c             	sub    $0xc,%esp
  800bb5:	50                   	push   %eax
  800bb6:	ff 75 e0             	push   -0x20(%ebp)
  800bb9:	68 2e 11 80 00       	push   $0x80112e
  800bbe:	6a 1e                	push   $0x1e
  800bc0:	68 4b 11 80 00       	push   $0x80114b
  800bc5:	e8 63 f6 ff ff       	call   80022d <_panic>

00800bca <sys_cputs>:
  800bca:	55                   	push   %ebp
  800bcb:	89 e5                	mov    %esp,%ebp
  800bcd:	83 ec 08             	sub    $0x8,%esp
  800bd0:	6a 00                	push   $0x0
  800bd2:	6a 00                	push   $0x0
  800bd4:	6a 00                	push   $0x0
  800bd6:	ff 75 0c             	push   0xc(%ebp)
  800bd9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bdc:	ba 00 00 00 00       	mov    $0x0,%edx
  800be1:	b8 00 00 00 00       	mov    $0x0,%eax
  800be6:	e8 96 ff ff ff       	call   800b81 <syscall>
  800beb:	83 c4 10             	add    $0x10,%esp
  800bee:	c9                   	leave
  800bef:	c3                   	ret

00800bf0 <sys_cgetc>:
  800bf0:	55                   	push   %ebp
  800bf1:	89 e5                	mov    %esp,%ebp
  800bf3:	83 ec 08             	sub    $0x8,%esp
  800bf6:	6a 00                	push   $0x0
  800bf8:	6a 00                	push   $0x0
  800bfa:	6a 00                	push   $0x0
  800bfc:	6a 00                	push   $0x0
  800bfe:	b9 00 00 00 00       	mov    $0x0,%ecx
  800c03:	ba 00 00 00 00       	mov    $0x0,%edx
  800c08:	b8 01 00 00 00       	mov    $0x1,%eax
  800c0d:	e8 6f ff ff ff       	call   800b81 <syscall>
  800c12:	c9                   	leave
  800c13:	c3                   	ret

00800c14 <sys_env_destroy>:
  800c14:	55                   	push   %ebp
  800c15:	89 e5                	mov    %esp,%ebp
  800c17:	83 ec 08             	sub    $0x8,%esp
  800c1a:	6a 00                	push   $0x0
  800c1c:	6a 00                	push   $0x0
  800c1e:	6a 00                	push   $0x0
  800c20:	6a 00                	push   $0x0
  800c22:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c25:	ba 01 00 00 00       	mov    $0x1,%edx
  800c2a:	b8 03 00 00 00       	mov    $0x3,%eax
  800c2f:	e8 4d ff ff ff       	call   800b81 <syscall>
  800c34:	c9                   	leave
  800c35:	c3                   	ret

00800c36 <sys_getenvid>:
  800c36:	55                   	push   %ebp
  800c37:	89 e5                	mov    %esp,%ebp
  800c39:	83 ec 08             	sub    $0x8,%esp
  800c3c:	6a 00                	push   $0x0
  800c3e:	6a 00                	push   $0x0
  800c40:	6a 00                	push   $0x0
  800c42:	6a 00                	push   $0x0
  800c44:	b9 00 00 00 00       	mov    $0x0,%ecx
  800c49:	ba 00 00 00 00       	mov    $0x0,%edx
  800c4e:	b8 02 00 00 00       	mov    $0x2,%eax
  800c53:	e8 29 ff ff ff       	call   800b81 <syscall>
  800c58:	c9                   	leave
  800c59:	c3                   	ret

00800c5a <sys_yield>:
  800c5a:	55                   	push   %ebp
  800c5b:	89 e5                	mov    %esp,%ebp
  800c5d:	83 ec 08             	sub    $0x8,%esp
  800c60:	6a 00                	push   $0x0
  800c62:	6a 00                	push   $0x0
  800c64:	6a 00                	push   $0x0
  800c66:	6a 00                	push   $0x0
  800c68:	b9 00 00 00 00       	mov    $0x0,%ecx
  800c6d:	ba 00 00 00 00       	mov    $0x0,%edx
  800c72:	b8 0a 00 00 00       	mov    $0xa,%eax
  800c77:	e8 05 ff ff ff       	call   800b81 <syscall>
  800c7c:	83 c4 10             	add    $0x10,%esp
  800c7f:	c9                   	leave
  800c80:	c3                   	ret

00800c81 <sys_page_alloc>:
  800c81:	55                   	push   %ebp
  800c82:	89 e5                	mov    %esp,%ebp
  800c84:	83 ec 08             	sub    $0x8,%esp
  800c87:	6a 00                	push   $0x0
  800c89:	6a 00                	push   $0x0
  800c8b:	ff 75 10             	push   0x10(%ebp)
  800c8e:	ff 75 0c             	push   0xc(%ebp)
  800c91:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c94:	ba 01 00 00 00       	mov    $0x1,%edx
  800c99:	b8 04 00 00 00       	mov    $0x4,%eax
  800c9e:	e8 de fe ff ff       	call   800b81 <syscall>
  800ca3:	c9                   	leave
  800ca4:	c3                   	ret

00800ca5 <sys_page_map>:
  800ca5:	55                   	push   %ebp
  800ca6:	89 e5                	mov    %esp,%ebp
  800ca8:	83 ec 08             	sub    $0x8,%esp
  800cab:	ff 75 18             	push   0x18(%ebp)
  800cae:	ff 75 14             	push   0x14(%ebp)
  800cb1:	ff 75 10             	push   0x10(%ebp)
  800cb4:	ff 75 0c             	push   0xc(%ebp)
  800cb7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800cba:	ba 01 00 00 00       	mov    $0x1,%edx
  800cbf:	b8 05 00 00 00       	mov    $0x5,%eax
  800cc4:	e8 b8 fe ff ff       	call   800b81 <syscall>
  800cc9:	c9                   	leave
  800cca:	c3                   	ret

00800ccb <sys_page_unmap>:
  800ccb:	55                   	push   %ebp
  800ccc:	89 e5                	mov    %esp,%ebp
  800cce:	83 ec 08             	sub    $0x8,%esp
  800cd1:	6a 00                	push   $0x0
  800cd3:	6a 00                	push   $0x0
  800cd5:	6a 00                	push   $0x0
  800cd7:	ff 75 0c             	push   0xc(%ebp)
  800cda:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800cdd:	ba 01 00 00 00       	mov    $0x1,%edx
  800ce2:	b8 06 00 00 00       	mov    $0x6,%eax
  800ce7:	e8 95 fe ff ff       	call   800b81 <syscall>
  800cec:	c9                   	leave
  800ced:	c3                   	ret

00800cee <sys_env_set_status>:
  800cee:	55                   	push   %ebp
  800cef:	89 e5                	mov    %esp,%ebp
  800cf1:	83 ec 08             	sub    $0x8,%esp
  800cf4:	6a 00                	push   $0x0
  800cf6:	6a 00                	push   $0x0
  800cf8:	6a 00                	push   $0x0
  800cfa:	ff 75 0c             	push   0xc(%ebp)
  800cfd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800d00:	ba 01 00 00 00       	mov    $0x1,%edx
  800d05:	b8 08 00 00 00       	mov    $0x8,%eax
  800d0a:	e8 72 fe ff ff       	call   800b81 <syscall>
  800d0f:	c9                   	leave
  800d10:	c3                   	ret

00800d11 <sys_env_set_pgfault_upcall>:
  800d11:	55                   	push   %ebp
  800d12:	89 e5                	mov    %esp,%ebp
  800d14:	83 ec 08             	sub    $0x8,%esp
  800d17:	6a 00                	push   $0x0
  800d19:	6a 00                	push   $0x0
  800d1b:	6a 00                	push   $0x0
  800d1d:	ff 75 0c             	push   0xc(%ebp)
  800d20:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800d23:	ba 01 00 00 00       	mov    $0x1,%edx
  800d28:	b8 09 00 00 00       	mov    $0x9,%eax
  800d2d:	e8 4f fe ff ff       	call   800b81 <syscall>
  800d32:	c9                   	leave
  800d33:	c3                   	ret

00800d34 <sys_ipc_try_send>:
  800d34:	55                   	push   %ebp
  800d35:	89 e5                	mov    %esp,%ebp
  800d37:	83 ec 08             	sub    $0x8,%esp
  800d3a:	6a 00                	push   $0x0
  800d3c:	ff 75 14             	push   0x14(%ebp)
  800d3f:	ff 75 10             	push   0x10(%ebp)
  800d42:	ff 75 0c             	push   0xc(%ebp)
  800d45:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800d48:	ba 00 00 00 00       	mov    $0x0,%edx
  800d4d:	b8 0c 00 00 00       	mov    $0xc,%eax
  800d52:	e8 2a fe ff ff       	call   800b81 <syscall>
  800d57:	c9                   	leave
  800d58:	c3                   	ret

00800d59 <sys_ipc_recv>:
  800d59:	55                   	push   %ebp
  800d5a:	89 e5                	mov    %esp,%ebp
  800d5c:	83 ec 08             	sub    $0x8,%esp
  800d5f:	6a 00                	push   $0x0
  800d61:	6a 00                	push   $0x0
  800d63:	6a 00                	push   $0x0
  800d65:	6a 00                	push   $0x0
  800d67:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800d6a:	ba 01 00 00 00       	mov    $0x1,%edx
  800d6f:	b8 0d 00 00 00       	mov    $0xd,%eax
  800d74:	e8 08 fe ff ff       	call   800b81 <syscall>
  800d79:	c9                   	leave
  800d7a:	c3                   	ret
  800d7b:	66 90                	xchg   %ax,%ax
  800d7d:	66 90                	xchg   %ax,%ax
  800d7f:	90                   	nop

00800d80 <__udivdi3>:
  800d80:	f3 0f 1e fb          	endbr32
  800d84:	55                   	push   %ebp
  800d85:	57                   	push   %edi
  800d86:	56                   	push   %esi
  800d87:	53                   	push   %ebx
  800d88:	83 ec 1c             	sub    $0x1c,%esp
  800d8b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d8f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800d93:	8b 74 24 34          	mov    0x34(%esp),%esi
  800d97:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800d9b:	85 c0                	test   %eax,%eax
  800d9d:	75 19                	jne    800db8 <__udivdi3+0x38>
  800d9f:	39 de                	cmp    %ebx,%esi
  800da1:	73 4d                	jae    800df0 <__udivdi3+0x70>
  800da3:	31 ff                	xor    %edi,%edi
  800da5:	89 e8                	mov    %ebp,%eax
  800da7:	89 f2                	mov    %esi,%edx
  800da9:	f7 f3                	div    %ebx
  800dab:	89 fa                	mov    %edi,%edx
  800dad:	83 c4 1c             	add    $0x1c,%esp
  800db0:	5b                   	pop    %ebx
  800db1:	5e                   	pop    %esi
  800db2:	5f                   	pop    %edi
  800db3:	5d                   	pop    %ebp
  800db4:	c3                   	ret
  800db5:	8d 76 00             	lea    0x0(%esi),%esi
  800db8:	39 c6                	cmp    %eax,%esi
  800dba:	73 14                	jae    800dd0 <__udivdi3+0x50>
  800dbc:	31 ff                	xor    %edi,%edi
  800dbe:	31 c0                	xor    %eax,%eax
  800dc0:	89 fa                	mov    %edi,%edx
  800dc2:	83 c4 1c             	add    $0x1c,%esp
  800dc5:	5b                   	pop    %ebx
  800dc6:	5e                   	pop    %esi
  800dc7:	5f                   	pop    %edi
  800dc8:	5d                   	pop    %ebp
  800dc9:	c3                   	ret
  800dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800dd0:	0f bd f8             	bsr    %eax,%edi
  800dd3:	83 f7 1f             	xor    $0x1f,%edi
  800dd6:	75 48                	jne    800e20 <__udivdi3+0xa0>
  800dd8:	39 f0                	cmp    %esi,%eax
  800dda:	72 06                	jb     800de2 <__udivdi3+0x62>
  800ddc:	31 c0                	xor    %eax,%eax
  800dde:	39 dd                	cmp    %ebx,%ebp
  800de0:	72 de                	jb     800dc0 <__udivdi3+0x40>
  800de2:	b8 01 00 00 00       	mov    $0x1,%eax
  800de7:	eb d7                	jmp    800dc0 <__udivdi3+0x40>
  800de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800df0:	89 d9                	mov    %ebx,%ecx
  800df2:	85 db                	test   %ebx,%ebx
  800df4:	75 0b                	jne    800e01 <__udivdi3+0x81>
  800df6:	b8 01 00 00 00       	mov    $0x1,%eax
  800dfb:	31 d2                	xor    %edx,%edx
  800dfd:	f7 f3                	div    %ebx
  800dff:	89 c1                	mov    %eax,%ecx
  800e01:	31 d2                	xor    %edx,%edx
  800e03:	89 f0                	mov    %esi,%eax
  800e05:	f7 f1                	div    %ecx
  800e07:	89 c6                	mov    %eax,%esi
  800e09:	89 e8                	mov    %ebp,%eax
  800e0b:	89 f7                	mov    %esi,%edi
  800e0d:	f7 f1                	div    %ecx
  800e0f:	89 fa                	mov    %edi,%edx
  800e11:	83 c4 1c             	add    $0x1c,%esp
  800e14:	5b                   	pop    %ebx
  800e15:	5e                   	pop    %esi
  800e16:	5f                   	pop    %edi
  800e17:	5d                   	pop    %ebp
  800e18:	c3                   	ret
  800e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800e20:	89 f9                	mov    %edi,%ecx
  800e22:	ba 20 00 00 00       	mov    $0x20,%edx
  800e27:	29 fa                	sub    %edi,%edx
  800e29:	d3 e0                	shl    %cl,%eax
  800e2b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800e2f:	89 d1                	mov    %edx,%ecx
  800e31:	89 d8                	mov    %ebx,%eax
  800e33:	d3 e8                	shr    %cl,%eax
  800e35:	89 c1                	mov    %eax,%ecx
  800e37:	8b 44 24 08          	mov    0x8(%esp),%eax
  800e3b:	09 c1                	or     %eax,%ecx
  800e3d:	89 f0                	mov    %esi,%eax
  800e3f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800e43:	89 f9                	mov    %edi,%ecx
  800e45:	d3 e3                	shl    %cl,%ebx
  800e47:	89 d1                	mov    %edx,%ecx
  800e49:	d3 e8                	shr    %cl,%eax
  800e4b:	89 f9                	mov    %edi,%ecx
  800e4d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800e51:	89 eb                	mov    %ebp,%ebx
  800e53:	d3 e6                	shl    %cl,%esi
  800e55:	89 d1                	mov    %edx,%ecx
  800e57:	d3 eb                	shr    %cl,%ebx
  800e59:	09 f3                	or     %esi,%ebx
  800e5b:	89 c6                	mov    %eax,%esi
  800e5d:	89 f2                	mov    %esi,%edx
  800e5f:	89 d8                	mov    %ebx,%eax
  800e61:	f7 74 24 08          	divl   0x8(%esp)
  800e65:	89 d6                	mov    %edx,%esi
  800e67:	89 c3                	mov    %eax,%ebx
  800e69:	f7 64 24 0c          	mull   0xc(%esp)
  800e6d:	39 d6                	cmp    %edx,%esi
  800e6f:	72 1f                	jb     800e90 <__udivdi3+0x110>
  800e71:	89 f9                	mov    %edi,%ecx
  800e73:	d3 e5                	shl    %cl,%ebp
  800e75:	39 c5                	cmp    %eax,%ebp
  800e77:	73 04                	jae    800e7d <__udivdi3+0xfd>
  800e79:	39 d6                	cmp    %edx,%esi
  800e7b:	74 13                	je     800e90 <__udivdi3+0x110>
  800e7d:	89 d8                	mov    %ebx,%eax
  800e7f:	31 ff                	xor    %edi,%edi
  800e81:	e9 3a ff ff ff       	jmp    800dc0 <__udivdi3+0x40>
  800e86:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800e8d:	00 
  800e8e:	66 90                	xchg   %ax,%ax
  800e90:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800e93:	31 ff                	xor    %edi,%edi
  800e95:	e9 26 ff ff ff       	jmp    800dc0 <__udivdi3+0x40>
  800e9a:	66 90                	xchg   %ax,%ax
  800e9c:	66 90                	xchg   %ax,%ax
  800e9e:	66 90                	xchg   %ax,%ax

00800ea0 <__umoddi3>:
  800ea0:	f3 0f 1e fb          	endbr32
  800ea4:	55                   	push   %ebp
  800ea5:	57                   	push   %edi
  800ea6:	56                   	push   %esi
  800ea7:	53                   	push   %ebx
  800ea8:	83 ec 1c             	sub    $0x1c,%esp
  800eab:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800eaf:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800eb3:	8b 74 24 30          	mov    0x30(%esp),%esi
  800eb7:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800ebb:	89 da                	mov    %ebx,%edx
  800ebd:	85 c0                	test   %eax,%eax
  800ebf:	75 17                	jne    800ed8 <__umoddi3+0x38>
  800ec1:	39 fb                	cmp    %edi,%ebx
  800ec3:	73 53                	jae    800f18 <__umoddi3+0x78>
  800ec5:	89 f0                	mov    %esi,%eax
  800ec7:	f7 f7                	div    %edi
  800ec9:	89 d0                	mov    %edx,%eax
  800ecb:	31 d2                	xor    %edx,%edx
  800ecd:	83 c4 1c             	add    $0x1c,%esp
  800ed0:	5b                   	pop    %ebx
  800ed1:	5e                   	pop    %esi
  800ed2:	5f                   	pop    %edi
  800ed3:	5d                   	pop    %ebp
  800ed4:	c3                   	ret
  800ed5:	8d 76 00             	lea    0x0(%esi),%esi
  800ed8:	89 f1                	mov    %esi,%ecx
  800eda:	39 c3                	cmp    %eax,%ebx
  800edc:	73 12                	jae    800ef0 <__umoddi3+0x50>
  800ede:	89 f0                	mov    %esi,%eax
  800ee0:	83 c4 1c             	add    $0x1c,%esp
  800ee3:	5b                   	pop    %ebx
  800ee4:	5e                   	pop    %esi
  800ee5:	5f                   	pop    %edi
  800ee6:	5d                   	pop    %ebp
  800ee7:	c3                   	ret
  800ee8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800eef:	00 
  800ef0:	0f bd e8             	bsr    %eax,%ebp
  800ef3:	83 f5 1f             	xor    $0x1f,%ebp
  800ef6:	75 48                	jne    800f40 <__umoddi3+0xa0>
  800ef8:	39 d8                	cmp    %ebx,%eax
  800efa:	0f 82 d0 00 00 00    	jb     800fd0 <__umoddi3+0x130>
  800f00:	39 fe                	cmp    %edi,%esi
  800f02:	0f 83 c8 00 00 00    	jae    800fd0 <__umoddi3+0x130>
  800f08:	89 c8                	mov    %ecx,%eax
  800f0a:	83 c4 1c             	add    $0x1c,%esp
  800f0d:	5b                   	pop    %ebx
  800f0e:	5e                   	pop    %esi
  800f0f:	5f                   	pop    %edi
  800f10:	5d                   	pop    %ebp
  800f11:	c3                   	ret
  800f12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800f18:	89 f9                	mov    %edi,%ecx
  800f1a:	85 ff                	test   %edi,%edi
  800f1c:	75 0b                	jne    800f29 <__umoddi3+0x89>
  800f1e:	b8 01 00 00 00       	mov    $0x1,%eax
  800f23:	31 d2                	xor    %edx,%edx
  800f25:	f7 f7                	div    %edi
  800f27:	89 c1                	mov    %eax,%ecx
  800f29:	89 d8                	mov    %ebx,%eax
  800f2b:	31 d2                	xor    %edx,%edx
  800f2d:	f7 f1                	div    %ecx
  800f2f:	89 f0                	mov    %esi,%eax
  800f31:	f7 f1                	div    %ecx
  800f33:	89 d0                	mov    %edx,%eax
  800f35:	31 d2                	xor    %edx,%edx
  800f37:	eb 94                	jmp    800ecd <__umoddi3+0x2d>
  800f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800f40:	89 e9                	mov    %ebp,%ecx
  800f42:	ba 20 00 00 00       	mov    $0x20,%edx
  800f47:	29 ea                	sub    %ebp,%edx
  800f49:	d3 e0                	shl    %cl,%eax
  800f4b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800f4f:	89 d1                	mov    %edx,%ecx
  800f51:	89 f8                	mov    %edi,%eax
  800f53:	d3 e8                	shr    %cl,%eax
  800f55:	89 54 24 04          	mov    %edx,0x4(%esp)
  800f59:	8b 54 24 04          	mov    0x4(%esp),%edx
  800f5d:	89 c1                	mov    %eax,%ecx
  800f5f:	8b 44 24 08          	mov    0x8(%esp),%eax
  800f63:	09 c1                	or     %eax,%ecx
  800f65:	89 d8                	mov    %ebx,%eax
  800f67:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800f6b:	89 e9                	mov    %ebp,%ecx
  800f6d:	d3 e7                	shl    %cl,%edi
  800f6f:	89 d1                	mov    %edx,%ecx
  800f71:	d3 e8                	shr    %cl,%eax
  800f73:	89 e9                	mov    %ebp,%ecx
  800f75:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800f79:	d3 e3                	shl    %cl,%ebx
  800f7b:	89 c7                	mov    %eax,%edi
  800f7d:	89 d1                	mov    %edx,%ecx
  800f7f:	89 f0                	mov    %esi,%eax
  800f81:	d3 e8                	shr    %cl,%eax
  800f83:	89 fa                	mov    %edi,%edx
  800f85:	89 e9                	mov    %ebp,%ecx
  800f87:	09 d8                	or     %ebx,%eax
  800f89:	d3 e6                	shl    %cl,%esi
  800f8b:	f7 74 24 08          	divl   0x8(%esp)
  800f8f:	89 d3                	mov    %edx,%ebx
  800f91:	f7 64 24 0c          	mull   0xc(%esp)
  800f95:	89 c7                	mov    %eax,%edi
  800f97:	89 d1                	mov    %edx,%ecx
  800f99:	39 d3                	cmp    %edx,%ebx
  800f9b:	72 06                	jb     800fa3 <__umoddi3+0x103>
  800f9d:	75 10                	jne    800faf <__umoddi3+0x10f>
  800f9f:	39 c6                	cmp    %eax,%esi
  800fa1:	73 0c                	jae    800faf <__umoddi3+0x10f>
  800fa3:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800fa7:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800fab:	89 d1                	mov    %edx,%ecx
  800fad:	89 c7                	mov    %eax,%edi
  800faf:	89 f2                	mov    %esi,%edx
  800fb1:	29 fa                	sub    %edi,%edx
  800fb3:	19 cb                	sbb    %ecx,%ebx
  800fb5:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800fba:	89 d8                	mov    %ebx,%eax
  800fbc:	d3 e0                	shl    %cl,%eax
  800fbe:	89 e9                	mov    %ebp,%ecx
  800fc0:	d3 ea                	shr    %cl,%edx
  800fc2:	d3 eb                	shr    %cl,%ebx
  800fc4:	09 d0                	or     %edx,%eax
  800fc6:	89 da                	mov    %ebx,%edx
  800fc8:	83 c4 1c             	add    $0x1c,%esp
  800fcb:	5b                   	pop    %ebx
  800fcc:	5e                   	pop    %esi
  800fcd:	5f                   	pop    %edi
  800fce:	5d                   	pop    %ebp
  800fcf:	c3                   	ret
  800fd0:	89 da                	mov    %ebx,%edx
  800fd2:	89 f1                	mov    %esi,%ecx
  800fd4:	29 f9                	sub    %edi,%ecx
  800fd6:	19 c2                	sbb    %eax,%edx
  800fd8:	89 c8                	mov    %ecx,%eax
  800fda:	e9 2b ff ff ff       	jmp    800f0a <__umoddi3+0x6a>
