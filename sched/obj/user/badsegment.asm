
obj/user/badsegment:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 09 00 00 00       	call   80003a <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	66 b8 28 00          	mov    $0x28,%ax
  800037:	8e d8                	mov    %eax,%ds
  800039:	c3                   	ret

0080003a <libmain>:
  80003a:	55                   	push   %ebp
  80003b:	89 e5                	mov    %esp,%ebp
  80003d:	56                   	push   %esi
  80003e:	53                   	push   %ebx
  80003f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800042:	8b 75 0c             	mov    0xc(%ebp),%esi
  800045:	e8 04 01 00 00       	call   80014e <sys_getenvid>
  80004a:	85 c0                	test   %eax,%eax
  80004c:	78 15                	js     800063 <libmain+0x29>
  80004e:	25 ff 03 00 00       	and    $0x3ff,%eax
  800053:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800059:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  80005e:	a3 04 20 80 00       	mov    %eax,0x802004
  800063:	85 db                	test   %ebx,%ebx
  800065:	7e 07                	jle    80006e <libmain+0x34>
  800067:	8b 06                	mov    (%esi),%eax
  800069:	a3 00 20 80 00       	mov    %eax,0x802000
  80006e:	83 ec 08             	sub    $0x8,%esp
  800071:	56                   	push   %esi
  800072:	53                   	push   %ebx
  800073:	e8 bb ff ff ff       	call   800033 <umain>
  800078:	e8 0a 00 00 00       	call   800087 <exit>
  80007d:	83 c4 10             	add    $0x10,%esp
  800080:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800083:	5b                   	pop    %ebx
  800084:	5e                   	pop    %esi
  800085:	5d                   	pop    %ebp
  800086:	c3                   	ret

00800087 <exit>:
  800087:	55                   	push   %ebp
  800088:	89 e5                	mov    %esp,%ebp
  80008a:	83 ec 14             	sub    $0x14,%esp
  80008d:	6a 00                	push   $0x0
  80008f:	e8 98 00 00 00       	call   80012c <sys_env_destroy>
  800094:	83 c4 10             	add    $0x10,%esp
  800097:	c9                   	leave
  800098:	c3                   	ret

00800099 <syscall>:
  800099:	55                   	push   %ebp
  80009a:	89 e5                	mov    %esp,%ebp
  80009c:	57                   	push   %edi
  80009d:	56                   	push   %esi
  80009e:	53                   	push   %ebx
  80009f:	83 ec 1c             	sub    $0x1c,%esp
  8000a2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8000a5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8000a8:	89 ca                	mov    %ecx,%edx
  8000aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000b0:	8b 7d 10             	mov    0x10(%ebp),%edi
  8000b3:	8b 75 14             	mov    0x14(%ebp),%esi
  8000b6:	cd 30                	int    $0x30
  8000b8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8000bc:	74 04                	je     8000c2 <syscall+0x29>
  8000be:	85 c0                	test   %eax,%eax
  8000c0:	7f 08                	jg     8000ca <syscall+0x31>
  8000c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000c5:	5b                   	pop    %ebx
  8000c6:	5e                   	pop    %esi
  8000c7:	5f                   	pop    %edi
  8000c8:	5d                   	pop    %ebp
  8000c9:	c3                   	ret
  8000ca:	83 ec 0c             	sub    $0xc,%esp
  8000cd:	50                   	push   %eax
  8000ce:	ff 75 e0             	push   -0x20(%ebp)
  8000d1:	68 6a 0e 80 00       	push   $0x800e6a
  8000d6:	6a 1e                	push   $0x1e
  8000d8:	68 87 0e 80 00       	push   $0x800e87
  8000dd:	e8 b1 01 00 00       	call   800293 <_panic>

008000e2 <sys_cputs>:
  8000e2:	55                   	push   %ebp
  8000e3:	89 e5                	mov    %esp,%ebp
  8000e5:	83 ec 08             	sub    $0x8,%esp
  8000e8:	6a 00                	push   $0x0
  8000ea:	6a 00                	push   $0x0
  8000ec:	6a 00                	push   $0x0
  8000ee:	ff 75 0c             	push   0xc(%ebp)
  8000f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000f4:	ba 00 00 00 00       	mov    $0x0,%edx
  8000f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8000fe:	e8 96 ff ff ff       	call   800099 <syscall>
  800103:	83 c4 10             	add    $0x10,%esp
  800106:	c9                   	leave
  800107:	c3                   	ret

00800108 <sys_cgetc>:
  800108:	55                   	push   %ebp
  800109:	89 e5                	mov    %esp,%ebp
  80010b:	83 ec 08             	sub    $0x8,%esp
  80010e:	6a 00                	push   $0x0
  800110:	6a 00                	push   $0x0
  800112:	6a 00                	push   $0x0
  800114:	6a 00                	push   $0x0
  800116:	b9 00 00 00 00       	mov    $0x0,%ecx
  80011b:	ba 00 00 00 00       	mov    $0x0,%edx
  800120:	b8 01 00 00 00       	mov    $0x1,%eax
  800125:	e8 6f ff ff ff       	call   800099 <syscall>
  80012a:	c9                   	leave
  80012b:	c3                   	ret

0080012c <sys_env_destroy>:
  80012c:	55                   	push   %ebp
  80012d:	89 e5                	mov    %esp,%ebp
  80012f:	83 ec 08             	sub    $0x8,%esp
  800132:	6a 00                	push   $0x0
  800134:	6a 00                	push   $0x0
  800136:	6a 00                	push   $0x0
  800138:	6a 00                	push   $0x0
  80013a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80013d:	ba 01 00 00 00       	mov    $0x1,%edx
  800142:	b8 03 00 00 00       	mov    $0x3,%eax
  800147:	e8 4d ff ff ff       	call   800099 <syscall>
  80014c:	c9                   	leave
  80014d:	c3                   	ret

0080014e <sys_getenvid>:
  80014e:	55                   	push   %ebp
  80014f:	89 e5                	mov    %esp,%ebp
  800151:	83 ec 08             	sub    $0x8,%esp
  800154:	6a 00                	push   $0x0
  800156:	6a 00                	push   $0x0
  800158:	6a 00                	push   $0x0
  80015a:	6a 00                	push   $0x0
  80015c:	b9 00 00 00 00       	mov    $0x0,%ecx
  800161:	ba 00 00 00 00       	mov    $0x0,%edx
  800166:	b8 02 00 00 00       	mov    $0x2,%eax
  80016b:	e8 29 ff ff ff       	call   800099 <syscall>
  800170:	c9                   	leave
  800171:	c3                   	ret

00800172 <sys_yield>:
  800172:	55                   	push   %ebp
  800173:	89 e5                	mov    %esp,%ebp
  800175:	83 ec 08             	sub    $0x8,%esp
  800178:	6a 00                	push   $0x0
  80017a:	6a 00                	push   $0x0
  80017c:	6a 00                	push   $0x0
  80017e:	6a 00                	push   $0x0
  800180:	b9 00 00 00 00       	mov    $0x0,%ecx
  800185:	ba 00 00 00 00       	mov    $0x0,%edx
  80018a:	b8 0a 00 00 00       	mov    $0xa,%eax
  80018f:	e8 05 ff ff ff       	call   800099 <syscall>
  800194:	83 c4 10             	add    $0x10,%esp
  800197:	c9                   	leave
  800198:	c3                   	ret

00800199 <sys_page_alloc>:
  800199:	55                   	push   %ebp
  80019a:	89 e5                	mov    %esp,%ebp
  80019c:	83 ec 08             	sub    $0x8,%esp
  80019f:	6a 00                	push   $0x0
  8001a1:	6a 00                	push   $0x0
  8001a3:	ff 75 10             	push   0x10(%ebp)
  8001a6:	ff 75 0c             	push   0xc(%ebp)
  8001a9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001ac:	ba 01 00 00 00       	mov    $0x1,%edx
  8001b1:	b8 04 00 00 00       	mov    $0x4,%eax
  8001b6:	e8 de fe ff ff       	call   800099 <syscall>
  8001bb:	c9                   	leave
  8001bc:	c3                   	ret

008001bd <sys_page_map>:
  8001bd:	55                   	push   %ebp
  8001be:	89 e5                	mov    %esp,%ebp
  8001c0:	83 ec 08             	sub    $0x8,%esp
  8001c3:	ff 75 18             	push   0x18(%ebp)
  8001c6:	ff 75 14             	push   0x14(%ebp)
  8001c9:	ff 75 10             	push   0x10(%ebp)
  8001cc:	ff 75 0c             	push   0xc(%ebp)
  8001cf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001d2:	ba 01 00 00 00       	mov    $0x1,%edx
  8001d7:	b8 05 00 00 00       	mov    $0x5,%eax
  8001dc:	e8 b8 fe ff ff       	call   800099 <syscall>
  8001e1:	c9                   	leave
  8001e2:	c3                   	ret

008001e3 <sys_page_unmap>:
  8001e3:	55                   	push   %ebp
  8001e4:	89 e5                	mov    %esp,%ebp
  8001e6:	83 ec 08             	sub    $0x8,%esp
  8001e9:	6a 00                	push   $0x0
  8001eb:	6a 00                	push   $0x0
  8001ed:	6a 00                	push   $0x0
  8001ef:	ff 75 0c             	push   0xc(%ebp)
  8001f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001f5:	ba 01 00 00 00       	mov    $0x1,%edx
  8001fa:	b8 06 00 00 00       	mov    $0x6,%eax
  8001ff:	e8 95 fe ff ff       	call   800099 <syscall>
  800204:	c9                   	leave
  800205:	c3                   	ret

00800206 <sys_env_set_status>:
  800206:	55                   	push   %ebp
  800207:	89 e5                	mov    %esp,%ebp
  800209:	83 ec 08             	sub    $0x8,%esp
  80020c:	6a 00                	push   $0x0
  80020e:	6a 00                	push   $0x0
  800210:	6a 00                	push   $0x0
  800212:	ff 75 0c             	push   0xc(%ebp)
  800215:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800218:	ba 01 00 00 00       	mov    $0x1,%edx
  80021d:	b8 08 00 00 00       	mov    $0x8,%eax
  800222:	e8 72 fe ff ff       	call   800099 <syscall>
  800227:	c9                   	leave
  800228:	c3                   	ret

00800229 <sys_env_set_pgfault_upcall>:
  800229:	55                   	push   %ebp
  80022a:	89 e5                	mov    %esp,%ebp
  80022c:	83 ec 08             	sub    $0x8,%esp
  80022f:	6a 00                	push   $0x0
  800231:	6a 00                	push   $0x0
  800233:	6a 00                	push   $0x0
  800235:	ff 75 0c             	push   0xc(%ebp)
  800238:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80023b:	ba 01 00 00 00       	mov    $0x1,%edx
  800240:	b8 09 00 00 00       	mov    $0x9,%eax
  800245:	e8 4f fe ff ff       	call   800099 <syscall>
  80024a:	c9                   	leave
  80024b:	c3                   	ret

0080024c <sys_ipc_try_send>:
  80024c:	55                   	push   %ebp
  80024d:	89 e5                	mov    %esp,%ebp
  80024f:	83 ec 08             	sub    $0x8,%esp
  800252:	6a 00                	push   $0x0
  800254:	ff 75 14             	push   0x14(%ebp)
  800257:	ff 75 10             	push   0x10(%ebp)
  80025a:	ff 75 0c             	push   0xc(%ebp)
  80025d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800260:	ba 00 00 00 00       	mov    $0x0,%edx
  800265:	b8 0c 00 00 00       	mov    $0xc,%eax
  80026a:	e8 2a fe ff ff       	call   800099 <syscall>
  80026f:	c9                   	leave
  800270:	c3                   	ret

00800271 <sys_ipc_recv>:
  800271:	55                   	push   %ebp
  800272:	89 e5                	mov    %esp,%ebp
  800274:	83 ec 08             	sub    $0x8,%esp
  800277:	6a 00                	push   $0x0
  800279:	6a 00                	push   $0x0
  80027b:	6a 00                	push   $0x0
  80027d:	6a 00                	push   $0x0
  80027f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800282:	ba 01 00 00 00       	mov    $0x1,%edx
  800287:	b8 0d 00 00 00       	mov    $0xd,%eax
  80028c:	e8 08 fe ff ff       	call   800099 <syscall>
  800291:	c9                   	leave
  800292:	c3                   	ret

00800293 <_panic>:
  800293:	55                   	push   %ebp
  800294:	89 e5                	mov    %esp,%ebp
  800296:	56                   	push   %esi
  800297:	53                   	push   %ebx
  800298:	8d 5d 14             	lea    0x14(%ebp),%ebx
  80029b:	8b 35 00 20 80 00    	mov    0x802000,%esi
  8002a1:	e8 a8 fe ff ff       	call   80014e <sys_getenvid>
  8002a6:	83 ec 0c             	sub    $0xc,%esp
  8002a9:	ff 75 0c             	push   0xc(%ebp)
  8002ac:	ff 75 08             	push   0x8(%ebp)
  8002af:	56                   	push   %esi
  8002b0:	50                   	push   %eax
  8002b1:	68 50 0f 80 00       	push   $0x800f50
  8002b6:	e8 b3 00 00 00       	call   80036e <cprintf>
  8002bb:	83 c4 18             	add    $0x18,%esp
  8002be:	53                   	push   %ebx
  8002bf:	ff 75 10             	push   0x10(%ebp)
  8002c2:	e8 56 00 00 00       	call   80031d <vcprintf>
  8002c7:	c7 04 24 95 0e 80 00 	movl   $0x800e95,(%esp)
  8002ce:	e8 9b 00 00 00       	call   80036e <cprintf>
  8002d3:	83 c4 10             	add    $0x10,%esp
  8002d6:	cc                   	int3
  8002d7:	eb fd                	jmp    8002d6 <_panic+0x43>

008002d9 <putch>:
  8002d9:	55                   	push   %ebp
  8002da:	89 e5                	mov    %esp,%ebp
  8002dc:	53                   	push   %ebx
  8002dd:	83 ec 04             	sub    $0x4,%esp
  8002e0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8002e3:	8b 13                	mov    (%ebx),%edx
  8002e5:	8d 42 01             	lea    0x1(%edx),%eax
  8002e8:	89 03                	mov    %eax,(%ebx)
  8002ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8002ed:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8002f1:	3d ff 00 00 00       	cmp    $0xff,%eax
  8002f6:	74 09                	je     800301 <putch+0x28>
  8002f8:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8002fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8002ff:	c9                   	leave
  800300:	c3                   	ret
  800301:	83 ec 08             	sub    $0x8,%esp
  800304:	68 ff 00 00 00       	push   $0xff
  800309:	8d 43 08             	lea    0x8(%ebx),%eax
  80030c:	50                   	push   %eax
  80030d:	e8 d0 fd ff ff       	call   8000e2 <sys_cputs>
  800312:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800318:	83 c4 10             	add    $0x10,%esp
  80031b:	eb db                	jmp    8002f8 <putch+0x1f>

0080031d <vcprintf>:
  80031d:	55                   	push   %ebp
  80031e:	89 e5                	mov    %esp,%ebp
  800320:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800326:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  80032d:	00 00 00 
  800330:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800337:	00 00 00 
  80033a:	ff 75 0c             	push   0xc(%ebp)
  80033d:	ff 75 08             	push   0x8(%ebp)
  800340:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800346:	50                   	push   %eax
  800347:	68 d9 02 80 00       	push   $0x8002d9
  80034c:	e8 74 01 00 00       	call   8004c5 <vprintfmt>
  800351:	83 c4 08             	add    $0x8,%esp
  800354:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  80035a:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800360:	50                   	push   %eax
  800361:	e8 7c fd ff ff       	call   8000e2 <sys_cputs>
  800366:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  80036c:	c9                   	leave
  80036d:	c3                   	ret

0080036e <cprintf>:
  80036e:	55                   	push   %ebp
  80036f:	89 e5                	mov    %esp,%ebp
  800371:	83 ec 10             	sub    $0x10,%esp
  800374:	8d 45 0c             	lea    0xc(%ebp),%eax
  800377:	50                   	push   %eax
  800378:	ff 75 08             	push   0x8(%ebp)
  80037b:	e8 9d ff ff ff       	call   80031d <vcprintf>
  800380:	c9                   	leave
  800381:	c3                   	ret

00800382 <printnum>:
  800382:	55                   	push   %ebp
  800383:	89 e5                	mov    %esp,%ebp
  800385:	57                   	push   %edi
  800386:	56                   	push   %esi
  800387:	53                   	push   %ebx
  800388:	83 ec 1c             	sub    $0x1c,%esp
  80038b:	89 c7                	mov    %eax,%edi
  80038d:	89 d6                	mov    %edx,%esi
  80038f:	8b 45 08             	mov    0x8(%ebp),%eax
  800392:	8b 55 0c             	mov    0xc(%ebp),%edx
  800395:	89 d1                	mov    %edx,%ecx
  800397:	89 c2                	mov    %eax,%edx
  800399:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80039c:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  80039f:	8b 45 10             	mov    0x10(%ebp),%eax
  8003a2:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8003a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003a8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8003af:	39 c2                	cmp    %eax,%edx
  8003b1:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8003b4:	72 3e                	jb     8003f4 <printnum+0x72>
  8003b6:	83 ec 0c             	sub    $0xc,%esp
  8003b9:	ff 75 18             	push   0x18(%ebp)
  8003bc:	83 eb 01             	sub    $0x1,%ebx
  8003bf:	53                   	push   %ebx
  8003c0:	50                   	push   %eax
  8003c1:	83 ec 08             	sub    $0x8,%esp
  8003c4:	ff 75 e4             	push   -0x1c(%ebp)
  8003c7:	ff 75 e0             	push   -0x20(%ebp)
  8003ca:	ff 75 dc             	push   -0x24(%ebp)
  8003cd:	ff 75 d8             	push   -0x28(%ebp)
  8003d0:	e8 1b 08 00 00       	call   800bf0 <__udivdi3>
  8003d5:	83 c4 18             	add    $0x18,%esp
  8003d8:	52                   	push   %edx
  8003d9:	50                   	push   %eax
  8003da:	89 f2                	mov    %esi,%edx
  8003dc:	89 f8                	mov    %edi,%eax
  8003de:	e8 9f ff ff ff       	call   800382 <printnum>
  8003e3:	83 c4 20             	add    $0x20,%esp
  8003e6:	eb 13                	jmp    8003fb <printnum+0x79>
  8003e8:	83 ec 08             	sub    $0x8,%esp
  8003eb:	56                   	push   %esi
  8003ec:	ff 75 18             	push   0x18(%ebp)
  8003ef:	ff d7                	call   *%edi
  8003f1:	83 c4 10             	add    $0x10,%esp
  8003f4:	83 eb 01             	sub    $0x1,%ebx
  8003f7:	85 db                	test   %ebx,%ebx
  8003f9:	7f ed                	jg     8003e8 <printnum+0x66>
  8003fb:	83 ec 08             	sub    $0x8,%esp
  8003fe:	56                   	push   %esi
  8003ff:	83 ec 04             	sub    $0x4,%esp
  800402:	ff 75 e4             	push   -0x1c(%ebp)
  800405:	ff 75 e0             	push   -0x20(%ebp)
  800408:	ff 75 dc             	push   -0x24(%ebp)
  80040b:	ff 75 d8             	push   -0x28(%ebp)
  80040e:	e8 fd 08 00 00       	call   800d10 <__umoddi3>
  800413:	83 c4 14             	add    $0x14,%esp
  800416:	0f be 80 97 0e 80 00 	movsbl 0x800e97(%eax),%eax
  80041d:	50                   	push   %eax
  80041e:	ff d7                	call   *%edi
  800420:	83 c4 10             	add    $0x10,%esp
  800423:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800426:	5b                   	pop    %ebx
  800427:	5e                   	pop    %esi
  800428:	5f                   	pop    %edi
  800429:	5d                   	pop    %ebp
  80042a:	c3                   	ret

0080042b <getuint>:
  80042b:	83 fa 01             	cmp    $0x1,%edx
  80042e:	7f 13                	jg     800443 <getuint+0x18>
  800430:	85 d2                	test   %edx,%edx
  800432:	74 1c                	je     800450 <getuint+0x25>
  800434:	8b 10                	mov    (%eax),%edx
  800436:	8d 4a 04             	lea    0x4(%edx),%ecx
  800439:	89 08                	mov    %ecx,(%eax)
  80043b:	8b 02                	mov    (%edx),%eax
  80043d:	ba 00 00 00 00       	mov    $0x0,%edx
  800442:	c3                   	ret
  800443:	8b 10                	mov    (%eax),%edx
  800445:	8d 4a 08             	lea    0x8(%edx),%ecx
  800448:	89 08                	mov    %ecx,(%eax)
  80044a:	8b 02                	mov    (%edx),%eax
  80044c:	8b 52 04             	mov    0x4(%edx),%edx
  80044f:	c3                   	ret
  800450:	8b 10                	mov    (%eax),%edx
  800452:	8d 4a 04             	lea    0x4(%edx),%ecx
  800455:	89 08                	mov    %ecx,(%eax)
  800457:	8b 02                	mov    (%edx),%eax
  800459:	ba 00 00 00 00       	mov    $0x0,%edx
  80045e:	c3                   	ret

0080045f <getint>:
  80045f:	83 fa 01             	cmp    $0x1,%edx
  800462:	7f 0f                	jg     800473 <getint+0x14>
  800464:	85 d2                	test   %edx,%edx
  800466:	74 18                	je     800480 <getint+0x21>
  800468:	8b 10                	mov    (%eax),%edx
  80046a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80046d:	89 08                	mov    %ecx,(%eax)
  80046f:	8b 02                	mov    (%edx),%eax
  800471:	99                   	cltd
  800472:	c3                   	ret
  800473:	8b 10                	mov    (%eax),%edx
  800475:	8d 4a 08             	lea    0x8(%edx),%ecx
  800478:	89 08                	mov    %ecx,(%eax)
  80047a:	8b 02                	mov    (%edx),%eax
  80047c:	8b 52 04             	mov    0x4(%edx),%edx
  80047f:	c3                   	ret
  800480:	8b 10                	mov    (%eax),%edx
  800482:	8d 4a 04             	lea    0x4(%edx),%ecx
  800485:	89 08                	mov    %ecx,(%eax)
  800487:	8b 02                	mov    (%edx),%eax
  800489:	99                   	cltd
  80048a:	c3                   	ret

0080048b <sprintputch>:
  80048b:	55                   	push   %ebp
  80048c:	89 e5                	mov    %esp,%ebp
  80048e:	8b 45 0c             	mov    0xc(%ebp),%eax
  800491:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800495:	8b 10                	mov    (%eax),%edx
  800497:	3b 50 04             	cmp    0x4(%eax),%edx
  80049a:	73 0a                	jae    8004a6 <sprintputch+0x1b>
  80049c:	8d 4a 01             	lea    0x1(%edx),%ecx
  80049f:	89 08                	mov    %ecx,(%eax)
  8004a1:	8b 45 08             	mov    0x8(%ebp),%eax
  8004a4:	88 02                	mov    %al,(%edx)
  8004a6:	5d                   	pop    %ebp
  8004a7:	c3                   	ret

008004a8 <printfmt>:
  8004a8:	55                   	push   %ebp
  8004a9:	89 e5                	mov    %esp,%ebp
  8004ab:	83 ec 08             	sub    $0x8,%esp
  8004ae:	8d 45 14             	lea    0x14(%ebp),%eax
  8004b1:	50                   	push   %eax
  8004b2:	ff 75 10             	push   0x10(%ebp)
  8004b5:	ff 75 0c             	push   0xc(%ebp)
  8004b8:	ff 75 08             	push   0x8(%ebp)
  8004bb:	e8 05 00 00 00       	call   8004c5 <vprintfmt>
  8004c0:	83 c4 10             	add    $0x10,%esp
  8004c3:	c9                   	leave
  8004c4:	c3                   	ret

008004c5 <vprintfmt>:
  8004c5:	55                   	push   %ebp
  8004c6:	89 e5                	mov    %esp,%ebp
  8004c8:	57                   	push   %edi
  8004c9:	56                   	push   %esi
  8004ca:	53                   	push   %ebx
  8004cb:	83 ec 2c             	sub    $0x2c,%esp
  8004ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004d1:	8b 75 0c             	mov    0xc(%ebp),%esi
  8004d4:	8b 7d 10             	mov    0x10(%ebp),%edi
  8004d7:	eb 0a                	jmp    8004e3 <vprintfmt+0x1e>
  8004d9:	83 ec 08             	sub    $0x8,%esp
  8004dc:	56                   	push   %esi
  8004dd:	50                   	push   %eax
  8004de:	ff d3                	call   *%ebx
  8004e0:	83 c4 10             	add    $0x10,%esp
  8004e3:	83 c7 01             	add    $0x1,%edi
  8004e6:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8004ea:	83 f8 25             	cmp    $0x25,%eax
  8004ed:	74 0c                	je     8004fb <vprintfmt+0x36>
  8004ef:	85 c0                	test   %eax,%eax
  8004f1:	75 e6                	jne    8004d9 <vprintfmt+0x14>
  8004f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8004f6:	5b                   	pop    %ebx
  8004f7:	5e                   	pop    %esi
  8004f8:	5f                   	pop    %edi
  8004f9:	5d                   	pop    %ebp
  8004fa:	c3                   	ret
  8004fb:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8004ff:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800506:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80050d:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800514:	b9 00 00 00 00       	mov    $0x0,%ecx
  800519:	8d 47 01             	lea    0x1(%edi),%eax
  80051c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80051f:	0f b6 17             	movzbl (%edi),%edx
  800522:	8d 42 dd             	lea    -0x23(%edx),%eax
  800525:	3c 55                	cmp    $0x55,%al
  800527:	0f 87 c3 02 00 00    	ja     8007f0 <vprintfmt+0x32b>
  80052d:	0f b6 c0             	movzbl %al,%eax
  800530:	ff 24 85 80 0f 80 00 	jmp    *0x800f80(,%eax,4)
  800537:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80053a:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  80053e:	eb d9                	jmp    800519 <vprintfmt+0x54>
  800540:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800543:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800547:	eb d0                	jmp    800519 <vprintfmt+0x54>
  800549:	0f b6 d2             	movzbl %dl,%edx
  80054c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80054f:	b8 00 00 00 00       	mov    $0x0,%eax
  800554:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800557:	8d 04 80             	lea    (%eax,%eax,4),%eax
  80055a:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  80055e:	0f be 17             	movsbl (%edi),%edx
  800561:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800564:	83 f9 09             	cmp    $0x9,%ecx
  800567:	77 52                	ja     8005bb <vprintfmt+0xf6>
  800569:	83 c7 01             	add    $0x1,%edi
  80056c:	eb e9                	jmp    800557 <vprintfmt+0x92>
  80056e:	8b 45 14             	mov    0x14(%ebp),%eax
  800571:	8d 50 04             	lea    0x4(%eax),%edx
  800574:	89 55 14             	mov    %edx,0x14(%ebp)
  800577:	8b 00                	mov    (%eax),%eax
  800579:	89 45 d0             	mov    %eax,-0x30(%ebp)
  80057c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80057f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800583:	79 94                	jns    800519 <vprintfmt+0x54>
  800585:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800588:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80058b:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800592:	eb 85                	jmp    800519 <vprintfmt+0x54>
  800594:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800597:	85 d2                	test   %edx,%edx
  800599:	b8 00 00 00 00       	mov    $0x0,%eax
  80059e:	0f 49 c2             	cmovns %edx,%eax
  8005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005a4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005a7:	e9 6d ff ff ff       	jmp    800519 <vprintfmt+0x54>
  8005ac:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005af:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8005b6:	e9 5e ff ff ff       	jmp    800519 <vprintfmt+0x54>
  8005bb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8005be:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005c1:	eb bc                	jmp    80057f <vprintfmt+0xba>
  8005c3:	83 c1 01             	add    $0x1,%ecx
  8005c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005c9:	e9 4b ff ff ff       	jmp    800519 <vprintfmt+0x54>
  8005ce:	8b 45 14             	mov    0x14(%ebp),%eax
  8005d1:	8d 50 04             	lea    0x4(%eax),%edx
  8005d4:	89 55 14             	mov    %edx,0x14(%ebp)
  8005d7:	83 ec 08             	sub    $0x8,%esp
  8005da:	56                   	push   %esi
  8005db:	ff 30                	push   (%eax)
  8005dd:	ff d3                	call   *%ebx
  8005df:	83 c4 10             	add    $0x10,%esp
  8005e2:	e9 a0 01 00 00       	jmp    800787 <vprintfmt+0x2c2>
  8005e7:	8b 45 14             	mov    0x14(%ebp),%eax
  8005ea:	8d 50 04             	lea    0x4(%eax),%edx
  8005ed:	89 55 14             	mov    %edx,0x14(%ebp)
  8005f0:	8b 10                	mov    (%eax),%edx
  8005f2:	89 d0                	mov    %edx,%eax
  8005f4:	f7 d8                	neg    %eax
  8005f6:	0f 48 c2             	cmovs  %edx,%eax
  8005f9:	83 f8 08             	cmp    $0x8,%eax
  8005fc:	7f 20                	jg     80061e <vprintfmt+0x159>
  8005fe:	8b 14 85 e0 10 80 00 	mov    0x8010e0(,%eax,4),%edx
  800605:	85 d2                	test   %edx,%edx
  800607:	74 15                	je     80061e <vprintfmt+0x159>
  800609:	52                   	push   %edx
  80060a:	68 b8 0e 80 00       	push   $0x800eb8
  80060f:	56                   	push   %esi
  800610:	53                   	push   %ebx
  800611:	e8 92 fe ff ff       	call   8004a8 <printfmt>
  800616:	83 c4 10             	add    $0x10,%esp
  800619:	e9 69 01 00 00       	jmp    800787 <vprintfmt+0x2c2>
  80061e:	50                   	push   %eax
  80061f:	68 af 0e 80 00       	push   $0x800eaf
  800624:	56                   	push   %esi
  800625:	53                   	push   %ebx
  800626:	e8 7d fe ff ff       	call   8004a8 <printfmt>
  80062b:	83 c4 10             	add    $0x10,%esp
  80062e:	e9 54 01 00 00       	jmp    800787 <vprintfmt+0x2c2>
  800633:	8b 45 14             	mov    0x14(%ebp),%eax
  800636:	8d 50 04             	lea    0x4(%eax),%edx
  800639:	89 55 14             	mov    %edx,0x14(%ebp)
  80063c:	8b 08                	mov    (%eax),%ecx
  80063e:	85 c9                	test   %ecx,%ecx
  800640:	b8 a8 0e 80 00       	mov    $0x800ea8,%eax
  800645:	0f 45 c1             	cmovne %ecx,%eax
  800648:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80064b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80064f:	7e 06                	jle    800657 <vprintfmt+0x192>
  800651:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800655:	75 0b                	jne    800662 <vprintfmt+0x19d>
  800657:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  80065a:	8b 7d d0             	mov    -0x30(%ebp),%edi
  80065d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800660:	eb 5c                	jmp    8006be <vprintfmt+0x1f9>
  800662:	83 ec 08             	sub    $0x8,%esp
  800665:	ff 75 d0             	push   -0x30(%ebp)
  800668:	ff 75 cc             	push   -0x34(%ebp)
  80066b:	e8 20 02 00 00       	call   800890 <strnlen>
  800670:	89 c2                	mov    %eax,%edx
  800672:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800675:	29 d0                	sub    %edx,%eax
  800677:	83 c4 10             	add    $0x10,%esp
  80067a:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  80067e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800681:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800684:	89 c3                	mov    %eax,%ebx
  800686:	eb 0e                	jmp    800696 <vprintfmt+0x1d1>
  800688:	83 ec 08             	sub    $0x8,%esp
  80068b:	56                   	push   %esi
  80068c:	57                   	push   %edi
  80068d:	ff 55 08             	call   *0x8(%ebp)
  800690:	83 eb 01             	sub    $0x1,%ebx
  800693:	83 c4 10             	add    $0x10,%esp
  800696:	85 db                	test   %ebx,%ebx
  800698:	7f ee                	jg     800688 <vprintfmt+0x1c3>
  80069a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80069d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006a0:	85 c0                	test   %eax,%eax
  8006a2:	ba 00 00 00 00       	mov    $0x0,%edx
  8006a7:	0f 49 d0             	cmovns %eax,%edx
  8006aa:	29 d0                	sub    %edx,%eax
  8006ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006af:	eb a6                	jmp    800657 <vprintfmt+0x192>
  8006b1:	83 ec 08             	sub    $0x8,%esp
  8006b4:	56                   	push   %esi
  8006b5:	52                   	push   %edx
  8006b6:	ff 55 08             	call   *0x8(%ebp)
  8006b9:	83 c4 10             	add    $0x10,%esp
  8006bc:	89 d9                	mov    %ebx,%ecx
  8006be:	8d 59 01             	lea    0x1(%ecx),%ebx
  8006c1:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8006c5:	0f be d0             	movsbl %al,%edx
  8006c8:	85 d2                	test   %edx,%edx
  8006ca:	74 28                	je     8006f4 <vprintfmt+0x22f>
  8006cc:	85 ff                	test   %edi,%edi
  8006ce:	78 05                	js     8006d5 <vprintfmt+0x210>
  8006d0:	83 ef 01             	sub    $0x1,%edi
  8006d3:	78 2e                	js     800703 <vprintfmt+0x23e>
  8006d5:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8006d9:	74 d6                	je     8006b1 <vprintfmt+0x1ec>
  8006db:	0f be c0             	movsbl %al,%eax
  8006de:	83 e8 20             	sub    $0x20,%eax
  8006e1:	83 f8 5e             	cmp    $0x5e,%eax
  8006e4:	76 cb                	jbe    8006b1 <vprintfmt+0x1ec>
  8006e6:	83 ec 08             	sub    $0x8,%esp
  8006e9:	56                   	push   %esi
  8006ea:	6a 3f                	push   $0x3f
  8006ec:	ff 55 08             	call   *0x8(%ebp)
  8006ef:	83 c4 10             	add    $0x10,%esp
  8006f2:	eb c8                	jmp    8006bc <vprintfmt+0x1f7>
  8006f4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006f7:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8006fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006fd:	01 c7                	add    %eax,%edi
  8006ff:	29 cf                	sub    %ecx,%edi
  800701:	eb 13                	jmp    800716 <vprintfmt+0x251>
  800703:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800706:	eb ef                	jmp    8006f7 <vprintfmt+0x232>
  800708:	83 ec 08             	sub    $0x8,%esp
  80070b:	56                   	push   %esi
  80070c:	6a 20                	push   $0x20
  80070e:	ff d3                	call   *%ebx
  800710:	83 ef 01             	sub    $0x1,%edi
  800713:	83 c4 10             	add    $0x10,%esp
  800716:	85 ff                	test   %edi,%edi
  800718:	7f ee                	jg     800708 <vprintfmt+0x243>
  80071a:	eb 6b                	jmp    800787 <vprintfmt+0x2c2>
  80071c:	89 ca                	mov    %ecx,%edx
  80071e:	8d 45 14             	lea    0x14(%ebp),%eax
  800721:	e8 39 fd ff ff       	call   80045f <getint>
  800726:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800729:	89 55 dc             	mov    %edx,-0x24(%ebp)
  80072c:	85 d2                	test   %edx,%edx
  80072e:	78 0b                	js     80073b <vprintfmt+0x276>
  800730:	89 d1                	mov    %edx,%ecx
  800732:	89 c2                	mov    %eax,%edx
  800734:	bf 0a 00 00 00       	mov    $0xa,%edi
  800739:	eb 32                	jmp    80076d <vprintfmt+0x2a8>
  80073b:	83 ec 08             	sub    $0x8,%esp
  80073e:	56                   	push   %esi
  80073f:	6a 2d                	push   $0x2d
  800741:	ff d3                	call   *%ebx
  800743:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800746:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800749:	f7 da                	neg    %edx
  80074b:	83 d1 00             	adc    $0x0,%ecx
  80074e:	f7 d9                	neg    %ecx
  800750:	83 c4 10             	add    $0x10,%esp
  800753:	bf 0a 00 00 00       	mov    $0xa,%edi
  800758:	eb 13                	jmp    80076d <vprintfmt+0x2a8>
  80075a:	89 ca                	mov    %ecx,%edx
  80075c:	8d 45 14             	lea    0x14(%ebp),%eax
  80075f:	e8 c7 fc ff ff       	call   80042b <getuint>
  800764:	89 d1                	mov    %edx,%ecx
  800766:	89 c2                	mov    %eax,%edx
  800768:	bf 0a 00 00 00       	mov    $0xa,%edi
  80076d:	83 ec 0c             	sub    $0xc,%esp
  800770:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800774:	50                   	push   %eax
  800775:	ff 75 e0             	push   -0x20(%ebp)
  800778:	57                   	push   %edi
  800779:	51                   	push   %ecx
  80077a:	52                   	push   %edx
  80077b:	89 f2                	mov    %esi,%edx
  80077d:	89 d8                	mov    %ebx,%eax
  80077f:	e8 fe fb ff ff       	call   800382 <printnum>
  800784:	83 c4 20             	add    $0x20,%esp
  800787:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80078a:	e9 54 fd ff ff       	jmp    8004e3 <vprintfmt+0x1e>
  80078f:	89 ca                	mov    %ecx,%edx
  800791:	8d 45 14             	lea    0x14(%ebp),%eax
  800794:	e8 92 fc ff ff       	call   80042b <getuint>
  800799:	89 d1                	mov    %edx,%ecx
  80079b:	89 c2                	mov    %eax,%edx
  80079d:	bf 08 00 00 00       	mov    $0x8,%edi
  8007a2:	eb c9                	jmp    80076d <vprintfmt+0x2a8>
  8007a4:	83 ec 08             	sub    $0x8,%esp
  8007a7:	56                   	push   %esi
  8007a8:	6a 30                	push   $0x30
  8007aa:	ff d3                	call   *%ebx
  8007ac:	83 c4 08             	add    $0x8,%esp
  8007af:	56                   	push   %esi
  8007b0:	6a 78                	push   $0x78
  8007b2:	ff d3                	call   *%ebx
  8007b4:	8b 45 14             	mov    0x14(%ebp),%eax
  8007b7:	8d 50 04             	lea    0x4(%eax),%edx
  8007ba:	89 55 14             	mov    %edx,0x14(%ebp)
  8007bd:	8b 10                	mov    (%eax),%edx
  8007bf:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007c4:	83 c4 10             	add    $0x10,%esp
  8007c7:	bf 10 00 00 00       	mov    $0x10,%edi
  8007cc:	eb 9f                	jmp    80076d <vprintfmt+0x2a8>
  8007ce:	89 ca                	mov    %ecx,%edx
  8007d0:	8d 45 14             	lea    0x14(%ebp),%eax
  8007d3:	e8 53 fc ff ff       	call   80042b <getuint>
  8007d8:	89 d1                	mov    %edx,%ecx
  8007da:	89 c2                	mov    %eax,%edx
  8007dc:	bf 10 00 00 00       	mov    $0x10,%edi
  8007e1:	eb 8a                	jmp    80076d <vprintfmt+0x2a8>
  8007e3:	83 ec 08             	sub    $0x8,%esp
  8007e6:	56                   	push   %esi
  8007e7:	6a 25                	push   $0x25
  8007e9:	ff d3                	call   *%ebx
  8007eb:	83 c4 10             	add    $0x10,%esp
  8007ee:	eb 97                	jmp    800787 <vprintfmt+0x2c2>
  8007f0:	83 ec 08             	sub    $0x8,%esp
  8007f3:	56                   	push   %esi
  8007f4:	6a 25                	push   $0x25
  8007f6:	ff d3                	call   *%ebx
  8007f8:	83 c4 10             	add    $0x10,%esp
  8007fb:	89 f8                	mov    %edi,%eax
  8007fd:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800801:	74 05                	je     800808 <vprintfmt+0x343>
  800803:	83 e8 01             	sub    $0x1,%eax
  800806:	eb f5                	jmp    8007fd <vprintfmt+0x338>
  800808:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80080b:	e9 77 ff ff ff       	jmp    800787 <vprintfmt+0x2c2>

00800810 <vsnprintf>:
  800810:	55                   	push   %ebp
  800811:	89 e5                	mov    %esp,%ebp
  800813:	83 ec 18             	sub    $0x18,%esp
  800816:	8b 45 08             	mov    0x8(%ebp),%eax
  800819:	8b 55 0c             	mov    0xc(%ebp),%edx
  80081c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  80081f:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800823:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800826:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  80082d:	85 c0                	test   %eax,%eax
  80082f:	74 26                	je     800857 <vsnprintf+0x47>
  800831:	85 d2                	test   %edx,%edx
  800833:	7e 22                	jle    800857 <vsnprintf+0x47>
  800835:	ff 75 14             	push   0x14(%ebp)
  800838:	ff 75 10             	push   0x10(%ebp)
  80083b:	8d 45 ec             	lea    -0x14(%ebp),%eax
  80083e:	50                   	push   %eax
  80083f:	68 8b 04 80 00       	push   $0x80048b
  800844:	e8 7c fc ff ff       	call   8004c5 <vprintfmt>
  800849:	8b 45 ec             	mov    -0x14(%ebp),%eax
  80084c:	c6 00 00             	movb   $0x0,(%eax)
  80084f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800852:	83 c4 10             	add    $0x10,%esp
  800855:	c9                   	leave
  800856:	c3                   	ret
  800857:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80085c:	eb f7                	jmp    800855 <vsnprintf+0x45>

0080085e <snprintf>:
  80085e:	55                   	push   %ebp
  80085f:	89 e5                	mov    %esp,%ebp
  800861:	83 ec 08             	sub    $0x8,%esp
  800864:	8d 45 14             	lea    0x14(%ebp),%eax
  800867:	50                   	push   %eax
  800868:	ff 75 10             	push   0x10(%ebp)
  80086b:	ff 75 0c             	push   0xc(%ebp)
  80086e:	ff 75 08             	push   0x8(%ebp)
  800871:	e8 9a ff ff ff       	call   800810 <vsnprintf>
  800876:	c9                   	leave
  800877:	c3                   	ret

00800878 <strlen>:
  800878:	55                   	push   %ebp
  800879:	89 e5                	mov    %esp,%ebp
  80087b:	8b 55 08             	mov    0x8(%ebp),%edx
  80087e:	b8 00 00 00 00       	mov    $0x0,%eax
  800883:	eb 03                	jmp    800888 <strlen+0x10>
  800885:	83 c0 01             	add    $0x1,%eax
  800888:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  80088c:	75 f7                	jne    800885 <strlen+0xd>
  80088e:	5d                   	pop    %ebp
  80088f:	c3                   	ret

00800890 <strnlen>:
  800890:	55                   	push   %ebp
  800891:	89 e5                	mov    %esp,%ebp
  800893:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800896:	8b 55 0c             	mov    0xc(%ebp),%edx
  800899:	b8 00 00 00 00       	mov    $0x0,%eax
  80089e:	eb 03                	jmp    8008a3 <strnlen+0x13>
  8008a0:	83 c0 01             	add    $0x1,%eax
  8008a3:	39 d0                	cmp    %edx,%eax
  8008a5:	74 08                	je     8008af <strnlen+0x1f>
  8008a7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8008ab:	75 f3                	jne    8008a0 <strnlen+0x10>
  8008ad:	89 c2                	mov    %eax,%edx
  8008af:	89 d0                	mov    %edx,%eax
  8008b1:	5d                   	pop    %ebp
  8008b2:	c3                   	ret

008008b3 <strcpy>:
  8008b3:	55                   	push   %ebp
  8008b4:	89 e5                	mov    %esp,%ebp
  8008b6:	53                   	push   %ebx
  8008b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8008bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8008c2:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8008c6:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8008c9:	83 c0 01             	add    $0x1,%eax
  8008cc:	84 d2                	test   %dl,%dl
  8008ce:	75 f2                	jne    8008c2 <strcpy+0xf>
  8008d0:	89 c8                	mov    %ecx,%eax
  8008d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008d5:	c9                   	leave
  8008d6:	c3                   	ret

008008d7 <strcat>:
  8008d7:	55                   	push   %ebp
  8008d8:	89 e5                	mov    %esp,%ebp
  8008da:	53                   	push   %ebx
  8008db:	83 ec 10             	sub    $0x10,%esp
  8008de:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8008e1:	53                   	push   %ebx
  8008e2:	e8 91 ff ff ff       	call   800878 <strlen>
  8008e7:	83 c4 08             	add    $0x8,%esp
  8008ea:	ff 75 0c             	push   0xc(%ebp)
  8008ed:	01 d8                	add    %ebx,%eax
  8008ef:	50                   	push   %eax
  8008f0:	e8 be ff ff ff       	call   8008b3 <strcpy>
  8008f5:	89 d8                	mov    %ebx,%eax
  8008f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008fa:	c9                   	leave
  8008fb:	c3                   	ret

008008fc <strncpy>:
  8008fc:	55                   	push   %ebp
  8008fd:	89 e5                	mov    %esp,%ebp
  8008ff:	56                   	push   %esi
  800900:	53                   	push   %ebx
  800901:	8b 75 08             	mov    0x8(%ebp),%esi
  800904:	8b 55 0c             	mov    0xc(%ebp),%edx
  800907:	89 f3                	mov    %esi,%ebx
  800909:	03 5d 10             	add    0x10(%ebp),%ebx
  80090c:	89 f0                	mov    %esi,%eax
  80090e:	eb 0f                	jmp    80091f <strncpy+0x23>
  800910:	83 c0 01             	add    $0x1,%eax
  800913:	0f b6 0a             	movzbl (%edx),%ecx
  800916:	88 48 ff             	mov    %cl,-0x1(%eax)
  800919:	80 f9 01             	cmp    $0x1,%cl
  80091c:	83 da ff             	sbb    $0xffffffff,%edx
  80091f:	39 d8                	cmp    %ebx,%eax
  800921:	75 ed                	jne    800910 <strncpy+0x14>
  800923:	89 f0                	mov    %esi,%eax
  800925:	5b                   	pop    %ebx
  800926:	5e                   	pop    %esi
  800927:	5d                   	pop    %ebp
  800928:	c3                   	ret

00800929 <strlcpy>:
  800929:	55                   	push   %ebp
  80092a:	89 e5                	mov    %esp,%ebp
  80092c:	56                   	push   %esi
  80092d:	53                   	push   %ebx
  80092e:	8b 75 08             	mov    0x8(%ebp),%esi
  800931:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800934:	8b 55 10             	mov    0x10(%ebp),%edx
  800937:	89 f0                	mov    %esi,%eax
  800939:	85 d2                	test   %edx,%edx
  80093b:	74 21                	je     80095e <strlcpy+0x35>
  80093d:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800941:	89 f2                	mov    %esi,%edx
  800943:	eb 09                	jmp    80094e <strlcpy+0x25>
  800945:	83 c1 01             	add    $0x1,%ecx
  800948:	83 c2 01             	add    $0x1,%edx
  80094b:	88 5a ff             	mov    %bl,-0x1(%edx)
  80094e:	39 c2                	cmp    %eax,%edx
  800950:	74 09                	je     80095b <strlcpy+0x32>
  800952:	0f b6 19             	movzbl (%ecx),%ebx
  800955:	84 db                	test   %bl,%bl
  800957:	75 ec                	jne    800945 <strlcpy+0x1c>
  800959:	89 d0                	mov    %edx,%eax
  80095b:	c6 00 00             	movb   $0x0,(%eax)
  80095e:	29 f0                	sub    %esi,%eax
  800960:	5b                   	pop    %ebx
  800961:	5e                   	pop    %esi
  800962:	5d                   	pop    %ebp
  800963:	c3                   	ret

00800964 <strcmp>:
  800964:	55                   	push   %ebp
  800965:	89 e5                	mov    %esp,%ebp
  800967:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80096a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80096d:	eb 06                	jmp    800975 <strcmp+0x11>
  80096f:	83 c1 01             	add    $0x1,%ecx
  800972:	83 c2 01             	add    $0x1,%edx
  800975:	0f b6 01             	movzbl (%ecx),%eax
  800978:	84 c0                	test   %al,%al
  80097a:	74 04                	je     800980 <strcmp+0x1c>
  80097c:	3a 02                	cmp    (%edx),%al
  80097e:	74 ef                	je     80096f <strcmp+0xb>
  800980:	0f b6 c0             	movzbl %al,%eax
  800983:	0f b6 12             	movzbl (%edx),%edx
  800986:	29 d0                	sub    %edx,%eax
  800988:	5d                   	pop    %ebp
  800989:	c3                   	ret

0080098a <strncmp>:
  80098a:	55                   	push   %ebp
  80098b:	89 e5                	mov    %esp,%ebp
  80098d:	53                   	push   %ebx
  80098e:	8b 45 08             	mov    0x8(%ebp),%eax
  800991:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800994:	8b 55 10             	mov    0x10(%ebp),%edx
  800997:	eb 09                	jmp    8009a2 <strncmp+0x18>
  800999:	83 ea 01             	sub    $0x1,%edx
  80099c:	83 c0 01             	add    $0x1,%eax
  80099f:	83 c1 01             	add    $0x1,%ecx
  8009a2:	85 d2                	test   %edx,%edx
  8009a4:	74 18                	je     8009be <strncmp+0x34>
  8009a6:	0f b6 18             	movzbl (%eax),%ebx
  8009a9:	84 db                	test   %bl,%bl
  8009ab:	74 04                	je     8009b1 <strncmp+0x27>
  8009ad:	3a 19                	cmp    (%ecx),%bl
  8009af:	74 e8                	je     800999 <strncmp+0xf>
  8009b1:	0f b6 00             	movzbl (%eax),%eax
  8009b4:	0f b6 11             	movzbl (%ecx),%edx
  8009b7:	29 d0                	sub    %edx,%eax
  8009b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8009bc:	c9                   	leave
  8009bd:	c3                   	ret
  8009be:	b8 00 00 00 00       	mov    $0x0,%eax
  8009c3:	eb f4                	jmp    8009b9 <strncmp+0x2f>

008009c5 <strchr>:
  8009c5:	55                   	push   %ebp
  8009c6:	89 e5                	mov    %esp,%ebp
  8009c8:	8b 45 08             	mov    0x8(%ebp),%eax
  8009cb:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009cf:	eb 03                	jmp    8009d4 <strchr+0xf>
  8009d1:	83 c0 01             	add    $0x1,%eax
  8009d4:	0f b6 10             	movzbl (%eax),%edx
  8009d7:	84 d2                	test   %dl,%dl
  8009d9:	74 06                	je     8009e1 <strchr+0x1c>
  8009db:	38 ca                	cmp    %cl,%dl
  8009dd:	75 f2                	jne    8009d1 <strchr+0xc>
  8009df:	eb 05                	jmp    8009e6 <strchr+0x21>
  8009e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8009e6:	5d                   	pop    %ebp
  8009e7:	c3                   	ret

008009e8 <strfind>:
  8009e8:	55                   	push   %ebp
  8009e9:	89 e5                	mov    %esp,%ebp
  8009eb:	8b 45 08             	mov    0x8(%ebp),%eax
  8009ee:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009f2:	0f b6 10             	movzbl (%eax),%edx
  8009f5:	38 ca                	cmp    %cl,%dl
  8009f7:	74 09                	je     800a02 <strfind+0x1a>
  8009f9:	84 d2                	test   %dl,%dl
  8009fb:	74 05                	je     800a02 <strfind+0x1a>
  8009fd:	83 c0 01             	add    $0x1,%eax
  800a00:	eb f0                	jmp    8009f2 <strfind+0xa>
  800a02:	5d                   	pop    %ebp
  800a03:	c3                   	ret

00800a04 <memset>:
  800a04:	55                   	push   %ebp
  800a05:	89 e5                	mov    %esp,%ebp
  800a07:	57                   	push   %edi
  800a08:	8b 55 08             	mov    0x8(%ebp),%edx
  800a0b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a0e:	85 c9                	test   %ecx,%ecx
  800a10:	74 24                	je     800a36 <memset+0x32>
  800a12:	89 d0                	mov    %edx,%eax
  800a14:	09 c8                	or     %ecx,%eax
  800a16:	a8 03                	test   $0x3,%al
  800a18:	75 14                	jne    800a2e <memset+0x2a>
  800a1a:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800a1e:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800a24:	c1 e9 02             	shr    $0x2,%ecx
  800a27:	89 d7                	mov    %edx,%edi
  800a29:	fc                   	cld
  800a2a:	f3 ab                	rep stos %eax,%es:(%edi)
  800a2c:	eb 08                	jmp    800a36 <memset+0x32>
  800a2e:	89 d7                	mov    %edx,%edi
  800a30:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a33:	fc                   	cld
  800a34:	f3 aa                	rep stos %al,%es:(%edi)
  800a36:	89 d0                	mov    %edx,%eax
  800a38:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800a3b:	c9                   	leave
  800a3c:	c3                   	ret

00800a3d <memmove>:
  800a3d:	55                   	push   %ebp
  800a3e:	89 e5                	mov    %esp,%ebp
  800a40:	57                   	push   %edi
  800a41:	56                   	push   %esi
  800a42:	8b 45 08             	mov    0x8(%ebp),%eax
  800a45:	8b 75 0c             	mov    0xc(%ebp),%esi
  800a48:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a4b:	39 c6                	cmp    %eax,%esi
  800a4d:	73 32                	jae    800a81 <memmove+0x44>
  800a4f:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800a52:	39 d0                	cmp    %edx,%eax
  800a54:	73 2b                	jae    800a81 <memmove+0x44>
  800a56:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800a59:	89 fe                	mov    %edi,%esi
  800a5b:	09 ce                	or     %ecx,%esi
  800a5d:	09 d6                	or     %edx,%esi
  800a5f:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800a65:	75 0e                	jne    800a75 <memmove+0x38>
  800a67:	83 ef 04             	sub    $0x4,%edi
  800a6a:	8d 72 fc             	lea    -0x4(%edx),%esi
  800a6d:	c1 e9 02             	shr    $0x2,%ecx
  800a70:	fd                   	std
  800a71:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a73:	eb 09                	jmp    800a7e <memmove+0x41>
  800a75:	83 ef 01             	sub    $0x1,%edi
  800a78:	8d 72 ff             	lea    -0x1(%edx),%esi
  800a7b:	fd                   	std
  800a7c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a7e:	fc                   	cld
  800a7f:	eb 1a                	jmp    800a9b <memmove+0x5e>
  800a81:	89 c2                	mov    %eax,%edx
  800a83:	09 ca                	or     %ecx,%edx
  800a85:	09 f2                	or     %esi,%edx
  800a87:	f6 c2 03             	test   $0x3,%dl
  800a8a:	75 0a                	jne    800a96 <memmove+0x59>
  800a8c:	c1 e9 02             	shr    $0x2,%ecx
  800a8f:	89 c7                	mov    %eax,%edi
  800a91:	fc                   	cld
  800a92:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a94:	eb 05                	jmp    800a9b <memmove+0x5e>
  800a96:	89 c7                	mov    %eax,%edi
  800a98:	fc                   	cld
  800a99:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a9b:	5e                   	pop    %esi
  800a9c:	5f                   	pop    %edi
  800a9d:	5d                   	pop    %ebp
  800a9e:	c3                   	ret

00800a9f <memcpy>:
  800a9f:	55                   	push   %ebp
  800aa0:	89 e5                	mov    %esp,%ebp
  800aa2:	83 ec 0c             	sub    $0xc,%esp
  800aa5:	ff 75 10             	push   0x10(%ebp)
  800aa8:	ff 75 0c             	push   0xc(%ebp)
  800aab:	ff 75 08             	push   0x8(%ebp)
  800aae:	e8 8a ff ff ff       	call   800a3d <memmove>
  800ab3:	c9                   	leave
  800ab4:	c3                   	ret

00800ab5 <memcmp>:
  800ab5:	55                   	push   %ebp
  800ab6:	89 e5                	mov    %esp,%ebp
  800ab8:	56                   	push   %esi
  800ab9:	53                   	push   %ebx
  800aba:	8b 45 08             	mov    0x8(%ebp),%eax
  800abd:	8b 55 0c             	mov    0xc(%ebp),%edx
  800ac0:	89 c6                	mov    %eax,%esi
  800ac2:	03 75 10             	add    0x10(%ebp),%esi
  800ac5:	eb 06                	jmp    800acd <memcmp+0x18>
  800ac7:	83 c0 01             	add    $0x1,%eax
  800aca:	83 c2 01             	add    $0x1,%edx
  800acd:	39 f0                	cmp    %esi,%eax
  800acf:	74 14                	je     800ae5 <memcmp+0x30>
  800ad1:	0f b6 08             	movzbl (%eax),%ecx
  800ad4:	0f b6 1a             	movzbl (%edx),%ebx
  800ad7:	38 d9                	cmp    %bl,%cl
  800ad9:	74 ec                	je     800ac7 <memcmp+0x12>
  800adb:	0f b6 c1             	movzbl %cl,%eax
  800ade:	0f b6 db             	movzbl %bl,%ebx
  800ae1:	29 d8                	sub    %ebx,%eax
  800ae3:	eb 05                	jmp    800aea <memcmp+0x35>
  800ae5:	b8 00 00 00 00       	mov    $0x0,%eax
  800aea:	5b                   	pop    %ebx
  800aeb:	5e                   	pop    %esi
  800aec:	5d                   	pop    %ebp
  800aed:	c3                   	ret

00800aee <memfind>:
  800aee:	55                   	push   %ebp
  800aef:	89 e5                	mov    %esp,%ebp
  800af1:	8b 45 08             	mov    0x8(%ebp),%eax
  800af4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800af7:	89 c2                	mov    %eax,%edx
  800af9:	03 55 10             	add    0x10(%ebp),%edx
  800afc:	eb 03                	jmp    800b01 <memfind+0x13>
  800afe:	83 c0 01             	add    $0x1,%eax
  800b01:	39 d0                	cmp    %edx,%eax
  800b03:	73 04                	jae    800b09 <memfind+0x1b>
  800b05:	38 08                	cmp    %cl,(%eax)
  800b07:	75 f5                	jne    800afe <memfind+0x10>
  800b09:	5d                   	pop    %ebp
  800b0a:	c3                   	ret

00800b0b <strtol>:
  800b0b:	55                   	push   %ebp
  800b0c:	89 e5                	mov    %esp,%ebp
  800b0e:	57                   	push   %edi
  800b0f:	56                   	push   %esi
  800b10:	53                   	push   %ebx
  800b11:	8b 55 08             	mov    0x8(%ebp),%edx
  800b14:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800b17:	eb 03                	jmp    800b1c <strtol+0x11>
  800b19:	83 c2 01             	add    $0x1,%edx
  800b1c:	0f b6 02             	movzbl (%edx),%eax
  800b1f:	3c 20                	cmp    $0x20,%al
  800b21:	74 f6                	je     800b19 <strtol+0xe>
  800b23:	3c 09                	cmp    $0x9,%al
  800b25:	74 f2                	je     800b19 <strtol+0xe>
  800b27:	3c 2b                	cmp    $0x2b,%al
  800b29:	74 2a                	je     800b55 <strtol+0x4a>
  800b2b:	bf 00 00 00 00       	mov    $0x0,%edi
  800b30:	3c 2d                	cmp    $0x2d,%al
  800b32:	74 2b                	je     800b5f <strtol+0x54>
  800b34:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800b3a:	75 0f                	jne    800b4b <strtol+0x40>
  800b3c:	80 3a 30             	cmpb   $0x30,(%edx)
  800b3f:	74 28                	je     800b69 <strtol+0x5e>
  800b41:	85 db                	test   %ebx,%ebx
  800b43:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b48:	0f 44 d8             	cmove  %eax,%ebx
  800b4b:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b50:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800b53:	eb 46                	jmp    800b9b <strtol+0x90>
  800b55:	83 c2 01             	add    $0x1,%edx
  800b58:	bf 00 00 00 00       	mov    $0x0,%edi
  800b5d:	eb d5                	jmp    800b34 <strtol+0x29>
  800b5f:	83 c2 01             	add    $0x1,%edx
  800b62:	bf 01 00 00 00       	mov    $0x1,%edi
  800b67:	eb cb                	jmp    800b34 <strtol+0x29>
  800b69:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800b6d:	74 0e                	je     800b7d <strtol+0x72>
  800b6f:	85 db                	test   %ebx,%ebx
  800b71:	75 d8                	jne    800b4b <strtol+0x40>
  800b73:	83 c2 01             	add    $0x1,%edx
  800b76:	bb 08 00 00 00       	mov    $0x8,%ebx
  800b7b:	eb ce                	jmp    800b4b <strtol+0x40>
  800b7d:	83 c2 02             	add    $0x2,%edx
  800b80:	bb 10 00 00 00       	mov    $0x10,%ebx
  800b85:	eb c4                	jmp    800b4b <strtol+0x40>
  800b87:	0f be c0             	movsbl %al,%eax
  800b8a:	83 e8 30             	sub    $0x30,%eax
  800b8d:	3b 45 10             	cmp    0x10(%ebp),%eax
  800b90:	7d 3a                	jge    800bcc <strtol+0xc1>
  800b92:	83 c2 01             	add    $0x1,%edx
  800b95:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800b99:	01 c1                	add    %eax,%ecx
  800b9b:	0f b6 02             	movzbl (%edx),%eax
  800b9e:	8d 70 d0             	lea    -0x30(%eax),%esi
  800ba1:	89 f3                	mov    %esi,%ebx
  800ba3:	80 fb 09             	cmp    $0x9,%bl
  800ba6:	76 df                	jbe    800b87 <strtol+0x7c>
  800ba8:	8d 70 9f             	lea    -0x61(%eax),%esi
  800bab:	89 f3                	mov    %esi,%ebx
  800bad:	80 fb 19             	cmp    $0x19,%bl
  800bb0:	77 08                	ja     800bba <strtol+0xaf>
  800bb2:	0f be c0             	movsbl %al,%eax
  800bb5:	83 e8 57             	sub    $0x57,%eax
  800bb8:	eb d3                	jmp    800b8d <strtol+0x82>
  800bba:	8d 70 bf             	lea    -0x41(%eax),%esi
  800bbd:	89 f3                	mov    %esi,%ebx
  800bbf:	80 fb 19             	cmp    $0x19,%bl
  800bc2:	77 08                	ja     800bcc <strtol+0xc1>
  800bc4:	0f be c0             	movsbl %al,%eax
  800bc7:	83 e8 37             	sub    $0x37,%eax
  800bca:	eb c1                	jmp    800b8d <strtol+0x82>
  800bcc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800bd0:	74 05                	je     800bd7 <strtol+0xcc>
  800bd2:	8b 45 0c             	mov    0xc(%ebp),%eax
  800bd5:	89 10                	mov    %edx,(%eax)
  800bd7:	89 c8                	mov    %ecx,%eax
  800bd9:	f7 d8                	neg    %eax
  800bdb:	85 ff                	test   %edi,%edi
  800bdd:	0f 45 c8             	cmovne %eax,%ecx
  800be0:	89 c8                	mov    %ecx,%eax
  800be2:	5b                   	pop    %ebx
  800be3:	5e                   	pop    %esi
  800be4:	5f                   	pop    %edi
  800be5:	5d                   	pop    %ebp
  800be6:	c3                   	ret
  800be7:	66 90                	xchg   %ax,%ax
  800be9:	66 90                	xchg   %ax,%ax
  800beb:	66 90                	xchg   %ax,%ax
  800bed:	66 90                	xchg   %ax,%ax
  800bef:	90                   	nop

00800bf0 <__udivdi3>:
  800bf0:	f3 0f 1e fb          	endbr32
  800bf4:	55                   	push   %ebp
  800bf5:	57                   	push   %edi
  800bf6:	56                   	push   %esi
  800bf7:	53                   	push   %ebx
  800bf8:	83 ec 1c             	sub    $0x1c,%esp
  800bfb:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800bff:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c03:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c07:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c0b:	85 c0                	test   %eax,%eax
  800c0d:	75 19                	jne    800c28 <__udivdi3+0x38>
  800c0f:	39 de                	cmp    %ebx,%esi
  800c11:	73 4d                	jae    800c60 <__udivdi3+0x70>
  800c13:	31 ff                	xor    %edi,%edi
  800c15:	89 e8                	mov    %ebp,%eax
  800c17:	89 f2                	mov    %esi,%edx
  800c19:	f7 f3                	div    %ebx
  800c1b:	89 fa                	mov    %edi,%edx
  800c1d:	83 c4 1c             	add    $0x1c,%esp
  800c20:	5b                   	pop    %ebx
  800c21:	5e                   	pop    %esi
  800c22:	5f                   	pop    %edi
  800c23:	5d                   	pop    %ebp
  800c24:	c3                   	ret
  800c25:	8d 76 00             	lea    0x0(%esi),%esi
  800c28:	39 c6                	cmp    %eax,%esi
  800c2a:	73 14                	jae    800c40 <__udivdi3+0x50>
  800c2c:	31 ff                	xor    %edi,%edi
  800c2e:	31 c0                	xor    %eax,%eax
  800c30:	89 fa                	mov    %edi,%edx
  800c32:	83 c4 1c             	add    $0x1c,%esp
  800c35:	5b                   	pop    %ebx
  800c36:	5e                   	pop    %esi
  800c37:	5f                   	pop    %edi
  800c38:	5d                   	pop    %ebp
  800c39:	c3                   	ret
  800c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800c40:	0f bd f8             	bsr    %eax,%edi
  800c43:	83 f7 1f             	xor    $0x1f,%edi
  800c46:	75 48                	jne    800c90 <__udivdi3+0xa0>
  800c48:	39 f0                	cmp    %esi,%eax
  800c4a:	72 06                	jb     800c52 <__udivdi3+0x62>
  800c4c:	31 c0                	xor    %eax,%eax
  800c4e:	39 dd                	cmp    %ebx,%ebp
  800c50:	72 de                	jb     800c30 <__udivdi3+0x40>
  800c52:	b8 01 00 00 00       	mov    $0x1,%eax
  800c57:	eb d7                	jmp    800c30 <__udivdi3+0x40>
  800c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800c60:	89 d9                	mov    %ebx,%ecx
  800c62:	85 db                	test   %ebx,%ebx
  800c64:	75 0b                	jne    800c71 <__udivdi3+0x81>
  800c66:	b8 01 00 00 00       	mov    $0x1,%eax
  800c6b:	31 d2                	xor    %edx,%edx
  800c6d:	f7 f3                	div    %ebx
  800c6f:	89 c1                	mov    %eax,%ecx
  800c71:	31 d2                	xor    %edx,%edx
  800c73:	89 f0                	mov    %esi,%eax
  800c75:	f7 f1                	div    %ecx
  800c77:	89 c6                	mov    %eax,%esi
  800c79:	89 e8                	mov    %ebp,%eax
  800c7b:	89 f7                	mov    %esi,%edi
  800c7d:	f7 f1                	div    %ecx
  800c7f:	89 fa                	mov    %edi,%edx
  800c81:	83 c4 1c             	add    $0x1c,%esp
  800c84:	5b                   	pop    %ebx
  800c85:	5e                   	pop    %esi
  800c86:	5f                   	pop    %edi
  800c87:	5d                   	pop    %ebp
  800c88:	c3                   	ret
  800c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800c90:	89 f9                	mov    %edi,%ecx
  800c92:	ba 20 00 00 00       	mov    $0x20,%edx
  800c97:	29 fa                	sub    %edi,%edx
  800c99:	d3 e0                	shl    %cl,%eax
  800c9b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800c9f:	89 d1                	mov    %edx,%ecx
  800ca1:	89 d8                	mov    %ebx,%eax
  800ca3:	d3 e8                	shr    %cl,%eax
  800ca5:	89 c1                	mov    %eax,%ecx
  800ca7:	8b 44 24 08          	mov    0x8(%esp),%eax
  800cab:	09 c1                	or     %eax,%ecx
  800cad:	89 f0                	mov    %esi,%eax
  800caf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800cb3:	89 f9                	mov    %edi,%ecx
  800cb5:	d3 e3                	shl    %cl,%ebx
  800cb7:	89 d1                	mov    %edx,%ecx
  800cb9:	d3 e8                	shr    %cl,%eax
  800cbb:	89 f9                	mov    %edi,%ecx
  800cbd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800cc1:	89 eb                	mov    %ebp,%ebx
  800cc3:	d3 e6                	shl    %cl,%esi
  800cc5:	89 d1                	mov    %edx,%ecx
  800cc7:	d3 eb                	shr    %cl,%ebx
  800cc9:	09 f3                	or     %esi,%ebx
  800ccb:	89 c6                	mov    %eax,%esi
  800ccd:	89 f2                	mov    %esi,%edx
  800ccf:	89 d8                	mov    %ebx,%eax
  800cd1:	f7 74 24 08          	divl   0x8(%esp)
  800cd5:	89 d6                	mov    %edx,%esi
  800cd7:	89 c3                	mov    %eax,%ebx
  800cd9:	f7 64 24 0c          	mull   0xc(%esp)
  800cdd:	39 d6                	cmp    %edx,%esi
  800cdf:	72 1f                	jb     800d00 <__udivdi3+0x110>
  800ce1:	89 f9                	mov    %edi,%ecx
  800ce3:	d3 e5                	shl    %cl,%ebp
  800ce5:	39 c5                	cmp    %eax,%ebp
  800ce7:	73 04                	jae    800ced <__udivdi3+0xfd>
  800ce9:	39 d6                	cmp    %edx,%esi
  800ceb:	74 13                	je     800d00 <__udivdi3+0x110>
  800ced:	89 d8                	mov    %ebx,%eax
  800cef:	31 ff                	xor    %edi,%edi
  800cf1:	e9 3a ff ff ff       	jmp    800c30 <__udivdi3+0x40>
  800cf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800cfd:	00 
  800cfe:	66 90                	xchg   %ax,%ax
  800d00:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d03:	31 ff                	xor    %edi,%edi
  800d05:	e9 26 ff ff ff       	jmp    800c30 <__udivdi3+0x40>
  800d0a:	66 90                	xchg   %ax,%ax
  800d0c:	66 90                	xchg   %ax,%ax
  800d0e:	66 90                	xchg   %ax,%ax

00800d10 <__umoddi3>:
  800d10:	f3 0f 1e fb          	endbr32
  800d14:	55                   	push   %ebp
  800d15:	57                   	push   %edi
  800d16:	56                   	push   %esi
  800d17:	53                   	push   %ebx
  800d18:	83 ec 1c             	sub    $0x1c,%esp
  800d1b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d1f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d23:	8b 74 24 30          	mov    0x30(%esp),%esi
  800d27:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800d2b:	89 da                	mov    %ebx,%edx
  800d2d:	85 c0                	test   %eax,%eax
  800d2f:	75 17                	jne    800d48 <__umoddi3+0x38>
  800d31:	39 fb                	cmp    %edi,%ebx
  800d33:	73 53                	jae    800d88 <__umoddi3+0x78>
  800d35:	89 f0                	mov    %esi,%eax
  800d37:	f7 f7                	div    %edi
  800d39:	89 d0                	mov    %edx,%eax
  800d3b:	31 d2                	xor    %edx,%edx
  800d3d:	83 c4 1c             	add    $0x1c,%esp
  800d40:	5b                   	pop    %ebx
  800d41:	5e                   	pop    %esi
  800d42:	5f                   	pop    %edi
  800d43:	5d                   	pop    %ebp
  800d44:	c3                   	ret
  800d45:	8d 76 00             	lea    0x0(%esi),%esi
  800d48:	89 f1                	mov    %esi,%ecx
  800d4a:	39 c3                	cmp    %eax,%ebx
  800d4c:	73 12                	jae    800d60 <__umoddi3+0x50>
  800d4e:	89 f0                	mov    %esi,%eax
  800d50:	83 c4 1c             	add    $0x1c,%esp
  800d53:	5b                   	pop    %ebx
  800d54:	5e                   	pop    %esi
  800d55:	5f                   	pop    %edi
  800d56:	5d                   	pop    %ebp
  800d57:	c3                   	ret
  800d58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d5f:	00 
  800d60:	0f bd e8             	bsr    %eax,%ebp
  800d63:	83 f5 1f             	xor    $0x1f,%ebp
  800d66:	75 48                	jne    800db0 <__umoddi3+0xa0>
  800d68:	39 d8                	cmp    %ebx,%eax
  800d6a:	0f 82 d0 00 00 00    	jb     800e40 <__umoddi3+0x130>
  800d70:	39 fe                	cmp    %edi,%esi
  800d72:	0f 83 c8 00 00 00    	jae    800e40 <__umoddi3+0x130>
  800d78:	89 c8                	mov    %ecx,%eax
  800d7a:	83 c4 1c             	add    $0x1c,%esp
  800d7d:	5b                   	pop    %ebx
  800d7e:	5e                   	pop    %esi
  800d7f:	5f                   	pop    %edi
  800d80:	5d                   	pop    %ebp
  800d81:	c3                   	ret
  800d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800d88:	89 f9                	mov    %edi,%ecx
  800d8a:	85 ff                	test   %edi,%edi
  800d8c:	75 0b                	jne    800d99 <__umoddi3+0x89>
  800d8e:	b8 01 00 00 00       	mov    $0x1,%eax
  800d93:	31 d2                	xor    %edx,%edx
  800d95:	f7 f7                	div    %edi
  800d97:	89 c1                	mov    %eax,%ecx
  800d99:	89 d8                	mov    %ebx,%eax
  800d9b:	31 d2                	xor    %edx,%edx
  800d9d:	f7 f1                	div    %ecx
  800d9f:	89 f0                	mov    %esi,%eax
  800da1:	f7 f1                	div    %ecx
  800da3:	89 d0                	mov    %edx,%eax
  800da5:	31 d2                	xor    %edx,%edx
  800da7:	eb 94                	jmp    800d3d <__umoddi3+0x2d>
  800da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800db0:	89 e9                	mov    %ebp,%ecx
  800db2:	ba 20 00 00 00       	mov    $0x20,%edx
  800db7:	29 ea                	sub    %ebp,%edx
  800db9:	d3 e0                	shl    %cl,%eax
  800dbb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800dbf:	89 d1                	mov    %edx,%ecx
  800dc1:	89 f8                	mov    %edi,%eax
  800dc3:	d3 e8                	shr    %cl,%eax
  800dc5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800dc9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800dcd:	89 c1                	mov    %eax,%ecx
  800dcf:	8b 44 24 08          	mov    0x8(%esp),%eax
  800dd3:	09 c1                	or     %eax,%ecx
  800dd5:	89 d8                	mov    %ebx,%eax
  800dd7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800ddb:	89 e9                	mov    %ebp,%ecx
  800ddd:	d3 e7                	shl    %cl,%edi
  800ddf:	89 d1                	mov    %edx,%ecx
  800de1:	d3 e8                	shr    %cl,%eax
  800de3:	89 e9                	mov    %ebp,%ecx
  800de5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800de9:	d3 e3                	shl    %cl,%ebx
  800deb:	89 c7                	mov    %eax,%edi
  800ded:	89 d1                	mov    %edx,%ecx
  800def:	89 f0                	mov    %esi,%eax
  800df1:	d3 e8                	shr    %cl,%eax
  800df3:	89 fa                	mov    %edi,%edx
  800df5:	89 e9                	mov    %ebp,%ecx
  800df7:	09 d8                	or     %ebx,%eax
  800df9:	d3 e6                	shl    %cl,%esi
  800dfb:	f7 74 24 08          	divl   0x8(%esp)
  800dff:	89 d3                	mov    %edx,%ebx
  800e01:	f7 64 24 0c          	mull   0xc(%esp)
  800e05:	89 c7                	mov    %eax,%edi
  800e07:	89 d1                	mov    %edx,%ecx
  800e09:	39 d3                	cmp    %edx,%ebx
  800e0b:	72 06                	jb     800e13 <__umoddi3+0x103>
  800e0d:	75 10                	jne    800e1f <__umoddi3+0x10f>
  800e0f:	39 c6                	cmp    %eax,%esi
  800e11:	73 0c                	jae    800e1f <__umoddi3+0x10f>
  800e13:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e17:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e1b:	89 d1                	mov    %edx,%ecx
  800e1d:	89 c7                	mov    %eax,%edi
  800e1f:	89 f2                	mov    %esi,%edx
  800e21:	29 fa                	sub    %edi,%edx
  800e23:	19 cb                	sbb    %ecx,%ebx
  800e25:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800e2a:	89 d8                	mov    %ebx,%eax
  800e2c:	d3 e0                	shl    %cl,%eax
  800e2e:	89 e9                	mov    %ebp,%ecx
  800e30:	d3 ea                	shr    %cl,%edx
  800e32:	d3 eb                	shr    %cl,%ebx
  800e34:	09 d0                	or     %edx,%eax
  800e36:	89 da                	mov    %ebx,%edx
  800e38:	83 c4 1c             	add    $0x1c,%esp
  800e3b:	5b                   	pop    %ebx
  800e3c:	5e                   	pop    %esi
  800e3d:	5f                   	pop    %edi
  800e3e:	5d                   	pop    %ebp
  800e3f:	c3                   	ret
  800e40:	89 da                	mov    %ebx,%edx
  800e42:	89 f1                	mov    %esi,%ecx
  800e44:	29 f9                	sub    %edi,%ecx
  800e46:	19 c2                	sbb    %eax,%edx
  800e48:	89 c8                	mov    %ecx,%eax
  800e4a:	e9 2b ff ff ff       	jmp    800d7a <__umoddi3+0x6a>
