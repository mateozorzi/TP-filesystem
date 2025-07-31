
obj/user/breakpoint:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 04 00 00 00       	call   800035 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	cc                   	int3
  800034:	c3                   	ret

00800035 <libmain>:
  800035:	55                   	push   %ebp
  800036:	89 e5                	mov    %esp,%ebp
  800038:	56                   	push   %esi
  800039:	53                   	push   %ebx
  80003a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80003d:	8b 75 0c             	mov    0xc(%ebp),%esi
  800040:	e8 04 01 00 00       	call   800149 <sys_getenvid>
  800045:	85 c0                	test   %eax,%eax
  800047:	78 15                	js     80005e <libmain+0x29>
  800049:	25 ff 03 00 00       	and    $0x3ff,%eax
  80004e:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800054:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800059:	a3 04 20 80 00       	mov    %eax,0x802004
  80005e:	85 db                	test   %ebx,%ebx
  800060:	7e 07                	jle    800069 <libmain+0x34>
  800062:	8b 06                	mov    (%esi),%eax
  800064:	a3 00 20 80 00       	mov    %eax,0x802000
  800069:	83 ec 08             	sub    $0x8,%esp
  80006c:	56                   	push   %esi
  80006d:	53                   	push   %ebx
  80006e:	e8 c0 ff ff ff       	call   800033 <umain>
  800073:	e8 0a 00 00 00       	call   800082 <exit>
  800078:	83 c4 10             	add    $0x10,%esp
  80007b:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80007e:	5b                   	pop    %ebx
  80007f:	5e                   	pop    %esi
  800080:	5d                   	pop    %ebp
  800081:	c3                   	ret

00800082 <exit>:
  800082:	55                   	push   %ebp
  800083:	89 e5                	mov    %esp,%ebp
  800085:	83 ec 14             	sub    $0x14,%esp
  800088:	6a 00                	push   $0x0
  80008a:	e8 98 00 00 00       	call   800127 <sys_env_destroy>
  80008f:	83 c4 10             	add    $0x10,%esp
  800092:	c9                   	leave
  800093:	c3                   	ret

00800094 <syscall>:
  800094:	55                   	push   %ebp
  800095:	89 e5                	mov    %esp,%ebp
  800097:	57                   	push   %edi
  800098:	56                   	push   %esi
  800099:	53                   	push   %ebx
  80009a:	83 ec 1c             	sub    $0x1c,%esp
  80009d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8000a0:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8000a3:	89 ca                	mov    %ecx,%edx
  8000a5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000ab:	8b 7d 10             	mov    0x10(%ebp),%edi
  8000ae:	8b 75 14             	mov    0x14(%ebp),%esi
  8000b1:	cd 30                	int    $0x30
  8000b3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8000b7:	74 04                	je     8000bd <syscall+0x29>
  8000b9:	85 c0                	test   %eax,%eax
  8000bb:	7f 08                	jg     8000c5 <syscall+0x31>
  8000bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000c0:	5b                   	pop    %ebx
  8000c1:	5e                   	pop    %esi
  8000c2:	5f                   	pop    %edi
  8000c3:	5d                   	pop    %ebp
  8000c4:	c3                   	ret
  8000c5:	83 ec 0c             	sub    $0xc,%esp
  8000c8:	50                   	push   %eax
  8000c9:	ff 75 e0             	push   -0x20(%ebp)
  8000cc:	68 6a 0e 80 00       	push   $0x800e6a
  8000d1:	6a 1e                	push   $0x1e
  8000d3:	68 87 0e 80 00       	push   $0x800e87
  8000d8:	e8 b1 01 00 00       	call   80028e <_panic>

008000dd <sys_cputs>:
  8000dd:	55                   	push   %ebp
  8000de:	89 e5                	mov    %esp,%ebp
  8000e0:	83 ec 08             	sub    $0x8,%esp
  8000e3:	6a 00                	push   $0x0
  8000e5:	6a 00                	push   $0x0
  8000e7:	6a 00                	push   $0x0
  8000e9:	ff 75 0c             	push   0xc(%ebp)
  8000ec:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000ef:	ba 00 00 00 00       	mov    $0x0,%edx
  8000f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f9:	e8 96 ff ff ff       	call   800094 <syscall>
  8000fe:	83 c4 10             	add    $0x10,%esp
  800101:	c9                   	leave
  800102:	c3                   	ret

00800103 <sys_cgetc>:
  800103:	55                   	push   %ebp
  800104:	89 e5                	mov    %esp,%ebp
  800106:	83 ec 08             	sub    $0x8,%esp
  800109:	6a 00                	push   $0x0
  80010b:	6a 00                	push   $0x0
  80010d:	6a 00                	push   $0x0
  80010f:	6a 00                	push   $0x0
  800111:	b9 00 00 00 00       	mov    $0x0,%ecx
  800116:	ba 00 00 00 00       	mov    $0x0,%edx
  80011b:	b8 01 00 00 00       	mov    $0x1,%eax
  800120:	e8 6f ff ff ff       	call   800094 <syscall>
  800125:	c9                   	leave
  800126:	c3                   	ret

00800127 <sys_env_destroy>:
  800127:	55                   	push   %ebp
  800128:	89 e5                	mov    %esp,%ebp
  80012a:	83 ec 08             	sub    $0x8,%esp
  80012d:	6a 00                	push   $0x0
  80012f:	6a 00                	push   $0x0
  800131:	6a 00                	push   $0x0
  800133:	6a 00                	push   $0x0
  800135:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800138:	ba 01 00 00 00       	mov    $0x1,%edx
  80013d:	b8 03 00 00 00       	mov    $0x3,%eax
  800142:	e8 4d ff ff ff       	call   800094 <syscall>
  800147:	c9                   	leave
  800148:	c3                   	ret

00800149 <sys_getenvid>:
  800149:	55                   	push   %ebp
  80014a:	89 e5                	mov    %esp,%ebp
  80014c:	83 ec 08             	sub    $0x8,%esp
  80014f:	6a 00                	push   $0x0
  800151:	6a 00                	push   $0x0
  800153:	6a 00                	push   $0x0
  800155:	6a 00                	push   $0x0
  800157:	b9 00 00 00 00       	mov    $0x0,%ecx
  80015c:	ba 00 00 00 00       	mov    $0x0,%edx
  800161:	b8 02 00 00 00       	mov    $0x2,%eax
  800166:	e8 29 ff ff ff       	call   800094 <syscall>
  80016b:	c9                   	leave
  80016c:	c3                   	ret

0080016d <sys_yield>:
  80016d:	55                   	push   %ebp
  80016e:	89 e5                	mov    %esp,%ebp
  800170:	83 ec 08             	sub    $0x8,%esp
  800173:	6a 00                	push   $0x0
  800175:	6a 00                	push   $0x0
  800177:	6a 00                	push   $0x0
  800179:	6a 00                	push   $0x0
  80017b:	b9 00 00 00 00       	mov    $0x0,%ecx
  800180:	ba 00 00 00 00       	mov    $0x0,%edx
  800185:	b8 0a 00 00 00       	mov    $0xa,%eax
  80018a:	e8 05 ff ff ff       	call   800094 <syscall>
  80018f:	83 c4 10             	add    $0x10,%esp
  800192:	c9                   	leave
  800193:	c3                   	ret

00800194 <sys_page_alloc>:
  800194:	55                   	push   %ebp
  800195:	89 e5                	mov    %esp,%ebp
  800197:	83 ec 08             	sub    $0x8,%esp
  80019a:	6a 00                	push   $0x0
  80019c:	6a 00                	push   $0x0
  80019e:	ff 75 10             	push   0x10(%ebp)
  8001a1:	ff 75 0c             	push   0xc(%ebp)
  8001a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001a7:	ba 01 00 00 00       	mov    $0x1,%edx
  8001ac:	b8 04 00 00 00       	mov    $0x4,%eax
  8001b1:	e8 de fe ff ff       	call   800094 <syscall>
  8001b6:	c9                   	leave
  8001b7:	c3                   	ret

008001b8 <sys_page_map>:
  8001b8:	55                   	push   %ebp
  8001b9:	89 e5                	mov    %esp,%ebp
  8001bb:	83 ec 08             	sub    $0x8,%esp
  8001be:	ff 75 18             	push   0x18(%ebp)
  8001c1:	ff 75 14             	push   0x14(%ebp)
  8001c4:	ff 75 10             	push   0x10(%ebp)
  8001c7:	ff 75 0c             	push   0xc(%ebp)
  8001ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001cd:	ba 01 00 00 00       	mov    $0x1,%edx
  8001d2:	b8 05 00 00 00       	mov    $0x5,%eax
  8001d7:	e8 b8 fe ff ff       	call   800094 <syscall>
  8001dc:	c9                   	leave
  8001dd:	c3                   	ret

008001de <sys_page_unmap>:
  8001de:	55                   	push   %ebp
  8001df:	89 e5                	mov    %esp,%ebp
  8001e1:	83 ec 08             	sub    $0x8,%esp
  8001e4:	6a 00                	push   $0x0
  8001e6:	6a 00                	push   $0x0
  8001e8:	6a 00                	push   $0x0
  8001ea:	ff 75 0c             	push   0xc(%ebp)
  8001ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001f0:	ba 01 00 00 00       	mov    $0x1,%edx
  8001f5:	b8 06 00 00 00       	mov    $0x6,%eax
  8001fa:	e8 95 fe ff ff       	call   800094 <syscall>
  8001ff:	c9                   	leave
  800200:	c3                   	ret

00800201 <sys_env_set_status>:
  800201:	55                   	push   %ebp
  800202:	89 e5                	mov    %esp,%ebp
  800204:	83 ec 08             	sub    $0x8,%esp
  800207:	6a 00                	push   $0x0
  800209:	6a 00                	push   $0x0
  80020b:	6a 00                	push   $0x0
  80020d:	ff 75 0c             	push   0xc(%ebp)
  800210:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800213:	ba 01 00 00 00       	mov    $0x1,%edx
  800218:	b8 08 00 00 00       	mov    $0x8,%eax
  80021d:	e8 72 fe ff ff       	call   800094 <syscall>
  800222:	c9                   	leave
  800223:	c3                   	ret

00800224 <sys_env_set_pgfault_upcall>:
  800224:	55                   	push   %ebp
  800225:	89 e5                	mov    %esp,%ebp
  800227:	83 ec 08             	sub    $0x8,%esp
  80022a:	6a 00                	push   $0x0
  80022c:	6a 00                	push   $0x0
  80022e:	6a 00                	push   $0x0
  800230:	ff 75 0c             	push   0xc(%ebp)
  800233:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800236:	ba 01 00 00 00       	mov    $0x1,%edx
  80023b:	b8 09 00 00 00       	mov    $0x9,%eax
  800240:	e8 4f fe ff ff       	call   800094 <syscall>
  800245:	c9                   	leave
  800246:	c3                   	ret

00800247 <sys_ipc_try_send>:
  800247:	55                   	push   %ebp
  800248:	89 e5                	mov    %esp,%ebp
  80024a:	83 ec 08             	sub    $0x8,%esp
  80024d:	6a 00                	push   $0x0
  80024f:	ff 75 14             	push   0x14(%ebp)
  800252:	ff 75 10             	push   0x10(%ebp)
  800255:	ff 75 0c             	push   0xc(%ebp)
  800258:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80025b:	ba 00 00 00 00       	mov    $0x0,%edx
  800260:	b8 0c 00 00 00       	mov    $0xc,%eax
  800265:	e8 2a fe ff ff       	call   800094 <syscall>
  80026a:	c9                   	leave
  80026b:	c3                   	ret

0080026c <sys_ipc_recv>:
  80026c:	55                   	push   %ebp
  80026d:	89 e5                	mov    %esp,%ebp
  80026f:	83 ec 08             	sub    $0x8,%esp
  800272:	6a 00                	push   $0x0
  800274:	6a 00                	push   $0x0
  800276:	6a 00                	push   $0x0
  800278:	6a 00                	push   $0x0
  80027a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80027d:	ba 01 00 00 00       	mov    $0x1,%edx
  800282:	b8 0d 00 00 00       	mov    $0xd,%eax
  800287:	e8 08 fe ff ff       	call   800094 <syscall>
  80028c:	c9                   	leave
  80028d:	c3                   	ret

0080028e <_panic>:
  80028e:	55                   	push   %ebp
  80028f:	89 e5                	mov    %esp,%ebp
  800291:	56                   	push   %esi
  800292:	53                   	push   %ebx
  800293:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800296:	8b 35 00 20 80 00    	mov    0x802000,%esi
  80029c:	e8 a8 fe ff ff       	call   800149 <sys_getenvid>
  8002a1:	83 ec 0c             	sub    $0xc,%esp
  8002a4:	ff 75 0c             	push   0xc(%ebp)
  8002a7:	ff 75 08             	push   0x8(%ebp)
  8002aa:	56                   	push   %esi
  8002ab:	50                   	push   %eax
  8002ac:	68 50 0f 80 00       	push   $0x800f50
  8002b1:	e8 b3 00 00 00       	call   800369 <cprintf>
  8002b6:	83 c4 18             	add    $0x18,%esp
  8002b9:	53                   	push   %ebx
  8002ba:	ff 75 10             	push   0x10(%ebp)
  8002bd:	e8 56 00 00 00       	call   800318 <vcprintf>
  8002c2:	c7 04 24 95 0e 80 00 	movl   $0x800e95,(%esp)
  8002c9:	e8 9b 00 00 00       	call   800369 <cprintf>
  8002ce:	83 c4 10             	add    $0x10,%esp
  8002d1:	cc                   	int3
  8002d2:	eb fd                	jmp    8002d1 <_panic+0x43>

008002d4 <putch>:
  8002d4:	55                   	push   %ebp
  8002d5:	89 e5                	mov    %esp,%ebp
  8002d7:	53                   	push   %ebx
  8002d8:	83 ec 04             	sub    $0x4,%esp
  8002db:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8002de:	8b 13                	mov    (%ebx),%edx
  8002e0:	8d 42 01             	lea    0x1(%edx),%eax
  8002e3:	89 03                	mov    %eax,(%ebx)
  8002e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8002e8:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8002ec:	3d ff 00 00 00       	cmp    $0xff,%eax
  8002f1:	74 09                	je     8002fc <putch+0x28>
  8002f3:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8002f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8002fa:	c9                   	leave
  8002fb:	c3                   	ret
  8002fc:	83 ec 08             	sub    $0x8,%esp
  8002ff:	68 ff 00 00 00       	push   $0xff
  800304:	8d 43 08             	lea    0x8(%ebx),%eax
  800307:	50                   	push   %eax
  800308:	e8 d0 fd ff ff       	call   8000dd <sys_cputs>
  80030d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800313:	83 c4 10             	add    $0x10,%esp
  800316:	eb db                	jmp    8002f3 <putch+0x1f>

00800318 <vcprintf>:
  800318:	55                   	push   %ebp
  800319:	89 e5                	mov    %esp,%ebp
  80031b:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800321:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800328:	00 00 00 
  80032b:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800332:	00 00 00 
  800335:	ff 75 0c             	push   0xc(%ebp)
  800338:	ff 75 08             	push   0x8(%ebp)
  80033b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800341:	50                   	push   %eax
  800342:	68 d4 02 80 00       	push   $0x8002d4
  800347:	e8 74 01 00 00       	call   8004c0 <vprintfmt>
  80034c:	83 c4 08             	add    $0x8,%esp
  80034f:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800355:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  80035b:	50                   	push   %eax
  80035c:	e8 7c fd ff ff       	call   8000dd <sys_cputs>
  800361:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800367:	c9                   	leave
  800368:	c3                   	ret

00800369 <cprintf>:
  800369:	55                   	push   %ebp
  80036a:	89 e5                	mov    %esp,%ebp
  80036c:	83 ec 10             	sub    $0x10,%esp
  80036f:	8d 45 0c             	lea    0xc(%ebp),%eax
  800372:	50                   	push   %eax
  800373:	ff 75 08             	push   0x8(%ebp)
  800376:	e8 9d ff ff ff       	call   800318 <vcprintf>
  80037b:	c9                   	leave
  80037c:	c3                   	ret

0080037d <printnum>:
  80037d:	55                   	push   %ebp
  80037e:	89 e5                	mov    %esp,%ebp
  800380:	57                   	push   %edi
  800381:	56                   	push   %esi
  800382:	53                   	push   %ebx
  800383:	83 ec 1c             	sub    $0x1c,%esp
  800386:	89 c7                	mov    %eax,%edi
  800388:	89 d6                	mov    %edx,%esi
  80038a:	8b 45 08             	mov    0x8(%ebp),%eax
  80038d:	8b 55 0c             	mov    0xc(%ebp),%edx
  800390:	89 d1                	mov    %edx,%ecx
  800392:	89 c2                	mov    %eax,%edx
  800394:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800397:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  80039a:	8b 45 10             	mov    0x10(%ebp),%eax
  80039d:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8003a0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003a3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8003aa:	39 c2                	cmp    %eax,%edx
  8003ac:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8003af:	72 3e                	jb     8003ef <printnum+0x72>
  8003b1:	83 ec 0c             	sub    $0xc,%esp
  8003b4:	ff 75 18             	push   0x18(%ebp)
  8003b7:	83 eb 01             	sub    $0x1,%ebx
  8003ba:	53                   	push   %ebx
  8003bb:	50                   	push   %eax
  8003bc:	83 ec 08             	sub    $0x8,%esp
  8003bf:	ff 75 e4             	push   -0x1c(%ebp)
  8003c2:	ff 75 e0             	push   -0x20(%ebp)
  8003c5:	ff 75 dc             	push   -0x24(%ebp)
  8003c8:	ff 75 d8             	push   -0x28(%ebp)
  8003cb:	e8 20 08 00 00       	call   800bf0 <__udivdi3>
  8003d0:	83 c4 18             	add    $0x18,%esp
  8003d3:	52                   	push   %edx
  8003d4:	50                   	push   %eax
  8003d5:	89 f2                	mov    %esi,%edx
  8003d7:	89 f8                	mov    %edi,%eax
  8003d9:	e8 9f ff ff ff       	call   80037d <printnum>
  8003de:	83 c4 20             	add    $0x20,%esp
  8003e1:	eb 13                	jmp    8003f6 <printnum+0x79>
  8003e3:	83 ec 08             	sub    $0x8,%esp
  8003e6:	56                   	push   %esi
  8003e7:	ff 75 18             	push   0x18(%ebp)
  8003ea:	ff d7                	call   *%edi
  8003ec:	83 c4 10             	add    $0x10,%esp
  8003ef:	83 eb 01             	sub    $0x1,%ebx
  8003f2:	85 db                	test   %ebx,%ebx
  8003f4:	7f ed                	jg     8003e3 <printnum+0x66>
  8003f6:	83 ec 08             	sub    $0x8,%esp
  8003f9:	56                   	push   %esi
  8003fa:	83 ec 04             	sub    $0x4,%esp
  8003fd:	ff 75 e4             	push   -0x1c(%ebp)
  800400:	ff 75 e0             	push   -0x20(%ebp)
  800403:	ff 75 dc             	push   -0x24(%ebp)
  800406:	ff 75 d8             	push   -0x28(%ebp)
  800409:	e8 02 09 00 00       	call   800d10 <__umoddi3>
  80040e:	83 c4 14             	add    $0x14,%esp
  800411:	0f be 80 97 0e 80 00 	movsbl 0x800e97(%eax),%eax
  800418:	50                   	push   %eax
  800419:	ff d7                	call   *%edi
  80041b:	83 c4 10             	add    $0x10,%esp
  80041e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800421:	5b                   	pop    %ebx
  800422:	5e                   	pop    %esi
  800423:	5f                   	pop    %edi
  800424:	5d                   	pop    %ebp
  800425:	c3                   	ret

00800426 <getuint>:
  800426:	83 fa 01             	cmp    $0x1,%edx
  800429:	7f 13                	jg     80043e <getuint+0x18>
  80042b:	85 d2                	test   %edx,%edx
  80042d:	74 1c                	je     80044b <getuint+0x25>
  80042f:	8b 10                	mov    (%eax),%edx
  800431:	8d 4a 04             	lea    0x4(%edx),%ecx
  800434:	89 08                	mov    %ecx,(%eax)
  800436:	8b 02                	mov    (%edx),%eax
  800438:	ba 00 00 00 00       	mov    $0x0,%edx
  80043d:	c3                   	ret
  80043e:	8b 10                	mov    (%eax),%edx
  800440:	8d 4a 08             	lea    0x8(%edx),%ecx
  800443:	89 08                	mov    %ecx,(%eax)
  800445:	8b 02                	mov    (%edx),%eax
  800447:	8b 52 04             	mov    0x4(%edx),%edx
  80044a:	c3                   	ret
  80044b:	8b 10                	mov    (%eax),%edx
  80044d:	8d 4a 04             	lea    0x4(%edx),%ecx
  800450:	89 08                	mov    %ecx,(%eax)
  800452:	8b 02                	mov    (%edx),%eax
  800454:	ba 00 00 00 00       	mov    $0x0,%edx
  800459:	c3                   	ret

0080045a <getint>:
  80045a:	83 fa 01             	cmp    $0x1,%edx
  80045d:	7f 0f                	jg     80046e <getint+0x14>
  80045f:	85 d2                	test   %edx,%edx
  800461:	74 18                	je     80047b <getint+0x21>
  800463:	8b 10                	mov    (%eax),%edx
  800465:	8d 4a 04             	lea    0x4(%edx),%ecx
  800468:	89 08                	mov    %ecx,(%eax)
  80046a:	8b 02                	mov    (%edx),%eax
  80046c:	99                   	cltd
  80046d:	c3                   	ret
  80046e:	8b 10                	mov    (%eax),%edx
  800470:	8d 4a 08             	lea    0x8(%edx),%ecx
  800473:	89 08                	mov    %ecx,(%eax)
  800475:	8b 02                	mov    (%edx),%eax
  800477:	8b 52 04             	mov    0x4(%edx),%edx
  80047a:	c3                   	ret
  80047b:	8b 10                	mov    (%eax),%edx
  80047d:	8d 4a 04             	lea    0x4(%edx),%ecx
  800480:	89 08                	mov    %ecx,(%eax)
  800482:	8b 02                	mov    (%edx),%eax
  800484:	99                   	cltd
  800485:	c3                   	ret

00800486 <sprintputch>:
  800486:	55                   	push   %ebp
  800487:	89 e5                	mov    %esp,%ebp
  800489:	8b 45 0c             	mov    0xc(%ebp),%eax
  80048c:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800490:	8b 10                	mov    (%eax),%edx
  800492:	3b 50 04             	cmp    0x4(%eax),%edx
  800495:	73 0a                	jae    8004a1 <sprintputch+0x1b>
  800497:	8d 4a 01             	lea    0x1(%edx),%ecx
  80049a:	89 08                	mov    %ecx,(%eax)
  80049c:	8b 45 08             	mov    0x8(%ebp),%eax
  80049f:	88 02                	mov    %al,(%edx)
  8004a1:	5d                   	pop    %ebp
  8004a2:	c3                   	ret

008004a3 <printfmt>:
  8004a3:	55                   	push   %ebp
  8004a4:	89 e5                	mov    %esp,%ebp
  8004a6:	83 ec 08             	sub    $0x8,%esp
  8004a9:	8d 45 14             	lea    0x14(%ebp),%eax
  8004ac:	50                   	push   %eax
  8004ad:	ff 75 10             	push   0x10(%ebp)
  8004b0:	ff 75 0c             	push   0xc(%ebp)
  8004b3:	ff 75 08             	push   0x8(%ebp)
  8004b6:	e8 05 00 00 00       	call   8004c0 <vprintfmt>
  8004bb:	83 c4 10             	add    $0x10,%esp
  8004be:	c9                   	leave
  8004bf:	c3                   	ret

008004c0 <vprintfmt>:
  8004c0:	55                   	push   %ebp
  8004c1:	89 e5                	mov    %esp,%ebp
  8004c3:	57                   	push   %edi
  8004c4:	56                   	push   %esi
  8004c5:	53                   	push   %ebx
  8004c6:	83 ec 2c             	sub    $0x2c,%esp
  8004c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  8004cf:	8b 7d 10             	mov    0x10(%ebp),%edi
  8004d2:	eb 0a                	jmp    8004de <vprintfmt+0x1e>
  8004d4:	83 ec 08             	sub    $0x8,%esp
  8004d7:	56                   	push   %esi
  8004d8:	50                   	push   %eax
  8004d9:	ff d3                	call   *%ebx
  8004db:	83 c4 10             	add    $0x10,%esp
  8004de:	83 c7 01             	add    $0x1,%edi
  8004e1:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8004e5:	83 f8 25             	cmp    $0x25,%eax
  8004e8:	74 0c                	je     8004f6 <vprintfmt+0x36>
  8004ea:	85 c0                	test   %eax,%eax
  8004ec:	75 e6                	jne    8004d4 <vprintfmt+0x14>
  8004ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8004f1:	5b                   	pop    %ebx
  8004f2:	5e                   	pop    %esi
  8004f3:	5f                   	pop    %edi
  8004f4:	5d                   	pop    %ebp
  8004f5:	c3                   	ret
  8004f6:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8004fa:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800501:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800508:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80050f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800514:	8d 47 01             	lea    0x1(%edi),%eax
  800517:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80051a:	0f b6 17             	movzbl (%edi),%edx
  80051d:	8d 42 dd             	lea    -0x23(%edx),%eax
  800520:	3c 55                	cmp    $0x55,%al
  800522:	0f 87 c3 02 00 00    	ja     8007eb <vprintfmt+0x32b>
  800528:	0f b6 c0             	movzbl %al,%eax
  80052b:	ff 24 85 80 0f 80 00 	jmp    *0x800f80(,%eax,4)
  800532:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800535:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800539:	eb d9                	jmp    800514 <vprintfmt+0x54>
  80053b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80053e:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800542:	eb d0                	jmp    800514 <vprintfmt+0x54>
  800544:	0f b6 d2             	movzbl %dl,%edx
  800547:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80054a:	b8 00 00 00 00       	mov    $0x0,%eax
  80054f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800552:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800555:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800559:	0f be 17             	movsbl (%edi),%edx
  80055c:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80055f:	83 f9 09             	cmp    $0x9,%ecx
  800562:	77 52                	ja     8005b6 <vprintfmt+0xf6>
  800564:	83 c7 01             	add    $0x1,%edi
  800567:	eb e9                	jmp    800552 <vprintfmt+0x92>
  800569:	8b 45 14             	mov    0x14(%ebp),%eax
  80056c:	8d 50 04             	lea    0x4(%eax),%edx
  80056f:	89 55 14             	mov    %edx,0x14(%ebp)
  800572:	8b 00                	mov    (%eax),%eax
  800574:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800577:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80057a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80057e:	79 94                	jns    800514 <vprintfmt+0x54>
  800580:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800583:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800586:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80058d:	eb 85                	jmp    800514 <vprintfmt+0x54>
  80058f:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800592:	85 d2                	test   %edx,%edx
  800594:	b8 00 00 00 00       	mov    $0x0,%eax
  800599:	0f 49 c2             	cmovns %edx,%eax
  80059c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80059f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005a2:	e9 6d ff ff ff       	jmp    800514 <vprintfmt+0x54>
  8005a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005aa:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8005b1:	e9 5e ff ff ff       	jmp    800514 <vprintfmt+0x54>
  8005b6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8005b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005bc:	eb bc                	jmp    80057a <vprintfmt+0xba>
  8005be:	83 c1 01             	add    $0x1,%ecx
  8005c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005c4:	e9 4b ff ff ff       	jmp    800514 <vprintfmt+0x54>
  8005c9:	8b 45 14             	mov    0x14(%ebp),%eax
  8005cc:	8d 50 04             	lea    0x4(%eax),%edx
  8005cf:	89 55 14             	mov    %edx,0x14(%ebp)
  8005d2:	83 ec 08             	sub    $0x8,%esp
  8005d5:	56                   	push   %esi
  8005d6:	ff 30                	push   (%eax)
  8005d8:	ff d3                	call   *%ebx
  8005da:	83 c4 10             	add    $0x10,%esp
  8005dd:	e9 a0 01 00 00       	jmp    800782 <vprintfmt+0x2c2>
  8005e2:	8b 45 14             	mov    0x14(%ebp),%eax
  8005e5:	8d 50 04             	lea    0x4(%eax),%edx
  8005e8:	89 55 14             	mov    %edx,0x14(%ebp)
  8005eb:	8b 10                	mov    (%eax),%edx
  8005ed:	89 d0                	mov    %edx,%eax
  8005ef:	f7 d8                	neg    %eax
  8005f1:	0f 48 c2             	cmovs  %edx,%eax
  8005f4:	83 f8 08             	cmp    $0x8,%eax
  8005f7:	7f 20                	jg     800619 <vprintfmt+0x159>
  8005f9:	8b 14 85 e0 10 80 00 	mov    0x8010e0(,%eax,4),%edx
  800600:	85 d2                	test   %edx,%edx
  800602:	74 15                	je     800619 <vprintfmt+0x159>
  800604:	52                   	push   %edx
  800605:	68 b8 0e 80 00       	push   $0x800eb8
  80060a:	56                   	push   %esi
  80060b:	53                   	push   %ebx
  80060c:	e8 92 fe ff ff       	call   8004a3 <printfmt>
  800611:	83 c4 10             	add    $0x10,%esp
  800614:	e9 69 01 00 00       	jmp    800782 <vprintfmt+0x2c2>
  800619:	50                   	push   %eax
  80061a:	68 af 0e 80 00       	push   $0x800eaf
  80061f:	56                   	push   %esi
  800620:	53                   	push   %ebx
  800621:	e8 7d fe ff ff       	call   8004a3 <printfmt>
  800626:	83 c4 10             	add    $0x10,%esp
  800629:	e9 54 01 00 00       	jmp    800782 <vprintfmt+0x2c2>
  80062e:	8b 45 14             	mov    0x14(%ebp),%eax
  800631:	8d 50 04             	lea    0x4(%eax),%edx
  800634:	89 55 14             	mov    %edx,0x14(%ebp)
  800637:	8b 08                	mov    (%eax),%ecx
  800639:	85 c9                	test   %ecx,%ecx
  80063b:	b8 a8 0e 80 00       	mov    $0x800ea8,%eax
  800640:	0f 45 c1             	cmovne %ecx,%eax
  800643:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800646:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80064a:	7e 06                	jle    800652 <vprintfmt+0x192>
  80064c:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800650:	75 0b                	jne    80065d <vprintfmt+0x19d>
  800652:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800655:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800658:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80065b:	eb 5c                	jmp    8006b9 <vprintfmt+0x1f9>
  80065d:	83 ec 08             	sub    $0x8,%esp
  800660:	ff 75 d0             	push   -0x30(%ebp)
  800663:	ff 75 cc             	push   -0x34(%ebp)
  800666:	e8 20 02 00 00       	call   80088b <strnlen>
  80066b:	89 c2                	mov    %eax,%edx
  80066d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800670:	29 d0                	sub    %edx,%eax
  800672:	83 c4 10             	add    $0x10,%esp
  800675:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800679:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80067c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80067f:	89 c3                	mov    %eax,%ebx
  800681:	eb 0e                	jmp    800691 <vprintfmt+0x1d1>
  800683:	83 ec 08             	sub    $0x8,%esp
  800686:	56                   	push   %esi
  800687:	57                   	push   %edi
  800688:	ff 55 08             	call   *0x8(%ebp)
  80068b:	83 eb 01             	sub    $0x1,%ebx
  80068e:	83 c4 10             	add    $0x10,%esp
  800691:	85 db                	test   %ebx,%ebx
  800693:	7f ee                	jg     800683 <vprintfmt+0x1c3>
  800695:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800698:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80069b:	85 c0                	test   %eax,%eax
  80069d:	ba 00 00 00 00       	mov    $0x0,%edx
  8006a2:	0f 49 d0             	cmovns %eax,%edx
  8006a5:	29 d0                	sub    %edx,%eax
  8006a7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006aa:	eb a6                	jmp    800652 <vprintfmt+0x192>
  8006ac:	83 ec 08             	sub    $0x8,%esp
  8006af:	56                   	push   %esi
  8006b0:	52                   	push   %edx
  8006b1:	ff 55 08             	call   *0x8(%ebp)
  8006b4:	83 c4 10             	add    $0x10,%esp
  8006b7:	89 d9                	mov    %ebx,%ecx
  8006b9:	8d 59 01             	lea    0x1(%ecx),%ebx
  8006bc:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8006c0:	0f be d0             	movsbl %al,%edx
  8006c3:	85 d2                	test   %edx,%edx
  8006c5:	74 28                	je     8006ef <vprintfmt+0x22f>
  8006c7:	85 ff                	test   %edi,%edi
  8006c9:	78 05                	js     8006d0 <vprintfmt+0x210>
  8006cb:	83 ef 01             	sub    $0x1,%edi
  8006ce:	78 2e                	js     8006fe <vprintfmt+0x23e>
  8006d0:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8006d4:	74 d6                	je     8006ac <vprintfmt+0x1ec>
  8006d6:	0f be c0             	movsbl %al,%eax
  8006d9:	83 e8 20             	sub    $0x20,%eax
  8006dc:	83 f8 5e             	cmp    $0x5e,%eax
  8006df:	76 cb                	jbe    8006ac <vprintfmt+0x1ec>
  8006e1:	83 ec 08             	sub    $0x8,%esp
  8006e4:	56                   	push   %esi
  8006e5:	6a 3f                	push   $0x3f
  8006e7:	ff 55 08             	call   *0x8(%ebp)
  8006ea:	83 c4 10             	add    $0x10,%esp
  8006ed:	eb c8                	jmp    8006b7 <vprintfmt+0x1f7>
  8006ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006f2:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8006f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006f8:	01 c7                	add    %eax,%edi
  8006fa:	29 cf                	sub    %ecx,%edi
  8006fc:	eb 13                	jmp    800711 <vprintfmt+0x251>
  8006fe:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800701:	eb ef                	jmp    8006f2 <vprintfmt+0x232>
  800703:	83 ec 08             	sub    $0x8,%esp
  800706:	56                   	push   %esi
  800707:	6a 20                	push   $0x20
  800709:	ff d3                	call   *%ebx
  80070b:	83 ef 01             	sub    $0x1,%edi
  80070e:	83 c4 10             	add    $0x10,%esp
  800711:	85 ff                	test   %edi,%edi
  800713:	7f ee                	jg     800703 <vprintfmt+0x243>
  800715:	eb 6b                	jmp    800782 <vprintfmt+0x2c2>
  800717:	89 ca                	mov    %ecx,%edx
  800719:	8d 45 14             	lea    0x14(%ebp),%eax
  80071c:	e8 39 fd ff ff       	call   80045a <getint>
  800721:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800724:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800727:	85 d2                	test   %edx,%edx
  800729:	78 0b                	js     800736 <vprintfmt+0x276>
  80072b:	89 d1                	mov    %edx,%ecx
  80072d:	89 c2                	mov    %eax,%edx
  80072f:	bf 0a 00 00 00       	mov    $0xa,%edi
  800734:	eb 32                	jmp    800768 <vprintfmt+0x2a8>
  800736:	83 ec 08             	sub    $0x8,%esp
  800739:	56                   	push   %esi
  80073a:	6a 2d                	push   $0x2d
  80073c:	ff d3                	call   *%ebx
  80073e:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800741:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800744:	f7 da                	neg    %edx
  800746:	83 d1 00             	adc    $0x0,%ecx
  800749:	f7 d9                	neg    %ecx
  80074b:	83 c4 10             	add    $0x10,%esp
  80074e:	bf 0a 00 00 00       	mov    $0xa,%edi
  800753:	eb 13                	jmp    800768 <vprintfmt+0x2a8>
  800755:	89 ca                	mov    %ecx,%edx
  800757:	8d 45 14             	lea    0x14(%ebp),%eax
  80075a:	e8 c7 fc ff ff       	call   800426 <getuint>
  80075f:	89 d1                	mov    %edx,%ecx
  800761:	89 c2                	mov    %eax,%edx
  800763:	bf 0a 00 00 00       	mov    $0xa,%edi
  800768:	83 ec 0c             	sub    $0xc,%esp
  80076b:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80076f:	50                   	push   %eax
  800770:	ff 75 e0             	push   -0x20(%ebp)
  800773:	57                   	push   %edi
  800774:	51                   	push   %ecx
  800775:	52                   	push   %edx
  800776:	89 f2                	mov    %esi,%edx
  800778:	89 d8                	mov    %ebx,%eax
  80077a:	e8 fe fb ff ff       	call   80037d <printnum>
  80077f:	83 c4 20             	add    $0x20,%esp
  800782:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800785:	e9 54 fd ff ff       	jmp    8004de <vprintfmt+0x1e>
  80078a:	89 ca                	mov    %ecx,%edx
  80078c:	8d 45 14             	lea    0x14(%ebp),%eax
  80078f:	e8 92 fc ff ff       	call   800426 <getuint>
  800794:	89 d1                	mov    %edx,%ecx
  800796:	89 c2                	mov    %eax,%edx
  800798:	bf 08 00 00 00       	mov    $0x8,%edi
  80079d:	eb c9                	jmp    800768 <vprintfmt+0x2a8>
  80079f:	83 ec 08             	sub    $0x8,%esp
  8007a2:	56                   	push   %esi
  8007a3:	6a 30                	push   $0x30
  8007a5:	ff d3                	call   *%ebx
  8007a7:	83 c4 08             	add    $0x8,%esp
  8007aa:	56                   	push   %esi
  8007ab:	6a 78                	push   $0x78
  8007ad:	ff d3                	call   *%ebx
  8007af:	8b 45 14             	mov    0x14(%ebp),%eax
  8007b2:	8d 50 04             	lea    0x4(%eax),%edx
  8007b5:	89 55 14             	mov    %edx,0x14(%ebp)
  8007b8:	8b 10                	mov    (%eax),%edx
  8007ba:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007bf:	83 c4 10             	add    $0x10,%esp
  8007c2:	bf 10 00 00 00       	mov    $0x10,%edi
  8007c7:	eb 9f                	jmp    800768 <vprintfmt+0x2a8>
  8007c9:	89 ca                	mov    %ecx,%edx
  8007cb:	8d 45 14             	lea    0x14(%ebp),%eax
  8007ce:	e8 53 fc ff ff       	call   800426 <getuint>
  8007d3:	89 d1                	mov    %edx,%ecx
  8007d5:	89 c2                	mov    %eax,%edx
  8007d7:	bf 10 00 00 00       	mov    $0x10,%edi
  8007dc:	eb 8a                	jmp    800768 <vprintfmt+0x2a8>
  8007de:	83 ec 08             	sub    $0x8,%esp
  8007e1:	56                   	push   %esi
  8007e2:	6a 25                	push   $0x25
  8007e4:	ff d3                	call   *%ebx
  8007e6:	83 c4 10             	add    $0x10,%esp
  8007e9:	eb 97                	jmp    800782 <vprintfmt+0x2c2>
  8007eb:	83 ec 08             	sub    $0x8,%esp
  8007ee:	56                   	push   %esi
  8007ef:	6a 25                	push   $0x25
  8007f1:	ff d3                	call   *%ebx
  8007f3:	83 c4 10             	add    $0x10,%esp
  8007f6:	89 f8                	mov    %edi,%eax
  8007f8:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  8007fc:	74 05                	je     800803 <vprintfmt+0x343>
  8007fe:	83 e8 01             	sub    $0x1,%eax
  800801:	eb f5                	jmp    8007f8 <vprintfmt+0x338>
  800803:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800806:	e9 77 ff ff ff       	jmp    800782 <vprintfmt+0x2c2>

0080080b <vsnprintf>:
  80080b:	55                   	push   %ebp
  80080c:	89 e5                	mov    %esp,%ebp
  80080e:	83 ec 18             	sub    $0x18,%esp
  800811:	8b 45 08             	mov    0x8(%ebp),%eax
  800814:	8b 55 0c             	mov    0xc(%ebp),%edx
  800817:	89 45 ec             	mov    %eax,-0x14(%ebp)
  80081a:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  80081e:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800821:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800828:	85 c0                	test   %eax,%eax
  80082a:	74 26                	je     800852 <vsnprintf+0x47>
  80082c:	85 d2                	test   %edx,%edx
  80082e:	7e 22                	jle    800852 <vsnprintf+0x47>
  800830:	ff 75 14             	push   0x14(%ebp)
  800833:	ff 75 10             	push   0x10(%ebp)
  800836:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800839:	50                   	push   %eax
  80083a:	68 86 04 80 00       	push   $0x800486
  80083f:	e8 7c fc ff ff       	call   8004c0 <vprintfmt>
  800844:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800847:	c6 00 00             	movb   $0x0,(%eax)
  80084a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  80084d:	83 c4 10             	add    $0x10,%esp
  800850:	c9                   	leave
  800851:	c3                   	ret
  800852:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800857:	eb f7                	jmp    800850 <vsnprintf+0x45>

00800859 <snprintf>:
  800859:	55                   	push   %ebp
  80085a:	89 e5                	mov    %esp,%ebp
  80085c:	83 ec 08             	sub    $0x8,%esp
  80085f:	8d 45 14             	lea    0x14(%ebp),%eax
  800862:	50                   	push   %eax
  800863:	ff 75 10             	push   0x10(%ebp)
  800866:	ff 75 0c             	push   0xc(%ebp)
  800869:	ff 75 08             	push   0x8(%ebp)
  80086c:	e8 9a ff ff ff       	call   80080b <vsnprintf>
  800871:	c9                   	leave
  800872:	c3                   	ret

00800873 <strlen>:
  800873:	55                   	push   %ebp
  800874:	89 e5                	mov    %esp,%ebp
  800876:	8b 55 08             	mov    0x8(%ebp),%edx
  800879:	b8 00 00 00 00       	mov    $0x0,%eax
  80087e:	eb 03                	jmp    800883 <strlen+0x10>
  800880:	83 c0 01             	add    $0x1,%eax
  800883:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800887:	75 f7                	jne    800880 <strlen+0xd>
  800889:	5d                   	pop    %ebp
  80088a:	c3                   	ret

0080088b <strnlen>:
  80088b:	55                   	push   %ebp
  80088c:	89 e5                	mov    %esp,%ebp
  80088e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800891:	8b 55 0c             	mov    0xc(%ebp),%edx
  800894:	b8 00 00 00 00       	mov    $0x0,%eax
  800899:	eb 03                	jmp    80089e <strnlen+0x13>
  80089b:	83 c0 01             	add    $0x1,%eax
  80089e:	39 d0                	cmp    %edx,%eax
  8008a0:	74 08                	je     8008aa <strnlen+0x1f>
  8008a2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8008a6:	75 f3                	jne    80089b <strnlen+0x10>
  8008a8:	89 c2                	mov    %eax,%edx
  8008aa:	89 d0                	mov    %edx,%eax
  8008ac:	5d                   	pop    %ebp
  8008ad:	c3                   	ret

008008ae <strcpy>:
  8008ae:	55                   	push   %ebp
  8008af:	89 e5                	mov    %esp,%ebp
  8008b1:	53                   	push   %ebx
  8008b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008b5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8008b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8008bd:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8008c1:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8008c4:	83 c0 01             	add    $0x1,%eax
  8008c7:	84 d2                	test   %dl,%dl
  8008c9:	75 f2                	jne    8008bd <strcpy+0xf>
  8008cb:	89 c8                	mov    %ecx,%eax
  8008cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008d0:	c9                   	leave
  8008d1:	c3                   	ret

008008d2 <strcat>:
  8008d2:	55                   	push   %ebp
  8008d3:	89 e5                	mov    %esp,%ebp
  8008d5:	53                   	push   %ebx
  8008d6:	83 ec 10             	sub    $0x10,%esp
  8008d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8008dc:	53                   	push   %ebx
  8008dd:	e8 91 ff ff ff       	call   800873 <strlen>
  8008e2:	83 c4 08             	add    $0x8,%esp
  8008e5:	ff 75 0c             	push   0xc(%ebp)
  8008e8:	01 d8                	add    %ebx,%eax
  8008ea:	50                   	push   %eax
  8008eb:	e8 be ff ff ff       	call   8008ae <strcpy>
  8008f0:	89 d8                	mov    %ebx,%eax
  8008f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008f5:	c9                   	leave
  8008f6:	c3                   	ret

008008f7 <strncpy>:
  8008f7:	55                   	push   %ebp
  8008f8:	89 e5                	mov    %esp,%ebp
  8008fa:	56                   	push   %esi
  8008fb:	53                   	push   %ebx
  8008fc:	8b 75 08             	mov    0x8(%ebp),%esi
  8008ff:	8b 55 0c             	mov    0xc(%ebp),%edx
  800902:	89 f3                	mov    %esi,%ebx
  800904:	03 5d 10             	add    0x10(%ebp),%ebx
  800907:	89 f0                	mov    %esi,%eax
  800909:	eb 0f                	jmp    80091a <strncpy+0x23>
  80090b:	83 c0 01             	add    $0x1,%eax
  80090e:	0f b6 0a             	movzbl (%edx),%ecx
  800911:	88 48 ff             	mov    %cl,-0x1(%eax)
  800914:	80 f9 01             	cmp    $0x1,%cl
  800917:	83 da ff             	sbb    $0xffffffff,%edx
  80091a:	39 d8                	cmp    %ebx,%eax
  80091c:	75 ed                	jne    80090b <strncpy+0x14>
  80091e:	89 f0                	mov    %esi,%eax
  800920:	5b                   	pop    %ebx
  800921:	5e                   	pop    %esi
  800922:	5d                   	pop    %ebp
  800923:	c3                   	ret

00800924 <strlcpy>:
  800924:	55                   	push   %ebp
  800925:	89 e5                	mov    %esp,%ebp
  800927:	56                   	push   %esi
  800928:	53                   	push   %ebx
  800929:	8b 75 08             	mov    0x8(%ebp),%esi
  80092c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80092f:	8b 55 10             	mov    0x10(%ebp),%edx
  800932:	89 f0                	mov    %esi,%eax
  800934:	85 d2                	test   %edx,%edx
  800936:	74 21                	je     800959 <strlcpy+0x35>
  800938:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  80093c:	89 f2                	mov    %esi,%edx
  80093e:	eb 09                	jmp    800949 <strlcpy+0x25>
  800940:	83 c1 01             	add    $0x1,%ecx
  800943:	83 c2 01             	add    $0x1,%edx
  800946:	88 5a ff             	mov    %bl,-0x1(%edx)
  800949:	39 c2                	cmp    %eax,%edx
  80094b:	74 09                	je     800956 <strlcpy+0x32>
  80094d:	0f b6 19             	movzbl (%ecx),%ebx
  800950:	84 db                	test   %bl,%bl
  800952:	75 ec                	jne    800940 <strlcpy+0x1c>
  800954:	89 d0                	mov    %edx,%eax
  800956:	c6 00 00             	movb   $0x0,(%eax)
  800959:	29 f0                	sub    %esi,%eax
  80095b:	5b                   	pop    %ebx
  80095c:	5e                   	pop    %esi
  80095d:	5d                   	pop    %ebp
  80095e:	c3                   	ret

0080095f <strcmp>:
  80095f:	55                   	push   %ebp
  800960:	89 e5                	mov    %esp,%ebp
  800962:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800965:	8b 55 0c             	mov    0xc(%ebp),%edx
  800968:	eb 06                	jmp    800970 <strcmp+0x11>
  80096a:	83 c1 01             	add    $0x1,%ecx
  80096d:	83 c2 01             	add    $0x1,%edx
  800970:	0f b6 01             	movzbl (%ecx),%eax
  800973:	84 c0                	test   %al,%al
  800975:	74 04                	je     80097b <strcmp+0x1c>
  800977:	3a 02                	cmp    (%edx),%al
  800979:	74 ef                	je     80096a <strcmp+0xb>
  80097b:	0f b6 c0             	movzbl %al,%eax
  80097e:	0f b6 12             	movzbl (%edx),%edx
  800981:	29 d0                	sub    %edx,%eax
  800983:	5d                   	pop    %ebp
  800984:	c3                   	ret

00800985 <strncmp>:
  800985:	55                   	push   %ebp
  800986:	89 e5                	mov    %esp,%ebp
  800988:	53                   	push   %ebx
  800989:	8b 45 08             	mov    0x8(%ebp),%eax
  80098c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80098f:	8b 55 10             	mov    0x10(%ebp),%edx
  800992:	eb 09                	jmp    80099d <strncmp+0x18>
  800994:	83 ea 01             	sub    $0x1,%edx
  800997:	83 c0 01             	add    $0x1,%eax
  80099a:	83 c1 01             	add    $0x1,%ecx
  80099d:	85 d2                	test   %edx,%edx
  80099f:	74 18                	je     8009b9 <strncmp+0x34>
  8009a1:	0f b6 18             	movzbl (%eax),%ebx
  8009a4:	84 db                	test   %bl,%bl
  8009a6:	74 04                	je     8009ac <strncmp+0x27>
  8009a8:	3a 19                	cmp    (%ecx),%bl
  8009aa:	74 e8                	je     800994 <strncmp+0xf>
  8009ac:	0f b6 00             	movzbl (%eax),%eax
  8009af:	0f b6 11             	movzbl (%ecx),%edx
  8009b2:	29 d0                	sub    %edx,%eax
  8009b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8009b7:	c9                   	leave
  8009b8:	c3                   	ret
  8009b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8009be:	eb f4                	jmp    8009b4 <strncmp+0x2f>

008009c0 <strchr>:
  8009c0:	55                   	push   %ebp
  8009c1:	89 e5                	mov    %esp,%ebp
  8009c3:	8b 45 08             	mov    0x8(%ebp),%eax
  8009c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009ca:	eb 03                	jmp    8009cf <strchr+0xf>
  8009cc:	83 c0 01             	add    $0x1,%eax
  8009cf:	0f b6 10             	movzbl (%eax),%edx
  8009d2:	84 d2                	test   %dl,%dl
  8009d4:	74 06                	je     8009dc <strchr+0x1c>
  8009d6:	38 ca                	cmp    %cl,%dl
  8009d8:	75 f2                	jne    8009cc <strchr+0xc>
  8009da:	eb 05                	jmp    8009e1 <strchr+0x21>
  8009dc:	b8 00 00 00 00       	mov    $0x0,%eax
  8009e1:	5d                   	pop    %ebp
  8009e2:	c3                   	ret

008009e3 <strfind>:
  8009e3:	55                   	push   %ebp
  8009e4:	89 e5                	mov    %esp,%ebp
  8009e6:	8b 45 08             	mov    0x8(%ebp),%eax
  8009e9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009ed:	0f b6 10             	movzbl (%eax),%edx
  8009f0:	38 ca                	cmp    %cl,%dl
  8009f2:	74 09                	je     8009fd <strfind+0x1a>
  8009f4:	84 d2                	test   %dl,%dl
  8009f6:	74 05                	je     8009fd <strfind+0x1a>
  8009f8:	83 c0 01             	add    $0x1,%eax
  8009fb:	eb f0                	jmp    8009ed <strfind+0xa>
  8009fd:	5d                   	pop    %ebp
  8009fe:	c3                   	ret

008009ff <memset>:
  8009ff:	55                   	push   %ebp
  800a00:	89 e5                	mov    %esp,%ebp
  800a02:	57                   	push   %edi
  800a03:	8b 55 08             	mov    0x8(%ebp),%edx
  800a06:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a09:	85 c9                	test   %ecx,%ecx
  800a0b:	74 24                	je     800a31 <memset+0x32>
  800a0d:	89 d0                	mov    %edx,%eax
  800a0f:	09 c8                	or     %ecx,%eax
  800a11:	a8 03                	test   $0x3,%al
  800a13:	75 14                	jne    800a29 <memset+0x2a>
  800a15:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800a19:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800a1f:	c1 e9 02             	shr    $0x2,%ecx
  800a22:	89 d7                	mov    %edx,%edi
  800a24:	fc                   	cld
  800a25:	f3 ab                	rep stos %eax,%es:(%edi)
  800a27:	eb 08                	jmp    800a31 <memset+0x32>
  800a29:	89 d7                	mov    %edx,%edi
  800a2b:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a2e:	fc                   	cld
  800a2f:	f3 aa                	rep stos %al,%es:(%edi)
  800a31:	89 d0                	mov    %edx,%eax
  800a33:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800a36:	c9                   	leave
  800a37:	c3                   	ret

00800a38 <memmove>:
  800a38:	55                   	push   %ebp
  800a39:	89 e5                	mov    %esp,%ebp
  800a3b:	57                   	push   %edi
  800a3c:	56                   	push   %esi
  800a3d:	8b 45 08             	mov    0x8(%ebp),%eax
  800a40:	8b 75 0c             	mov    0xc(%ebp),%esi
  800a43:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a46:	39 c6                	cmp    %eax,%esi
  800a48:	73 32                	jae    800a7c <memmove+0x44>
  800a4a:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800a4d:	39 d0                	cmp    %edx,%eax
  800a4f:	73 2b                	jae    800a7c <memmove+0x44>
  800a51:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800a54:	89 fe                	mov    %edi,%esi
  800a56:	09 ce                	or     %ecx,%esi
  800a58:	09 d6                	or     %edx,%esi
  800a5a:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800a60:	75 0e                	jne    800a70 <memmove+0x38>
  800a62:	83 ef 04             	sub    $0x4,%edi
  800a65:	8d 72 fc             	lea    -0x4(%edx),%esi
  800a68:	c1 e9 02             	shr    $0x2,%ecx
  800a6b:	fd                   	std
  800a6c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a6e:	eb 09                	jmp    800a79 <memmove+0x41>
  800a70:	83 ef 01             	sub    $0x1,%edi
  800a73:	8d 72 ff             	lea    -0x1(%edx),%esi
  800a76:	fd                   	std
  800a77:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a79:	fc                   	cld
  800a7a:	eb 1a                	jmp    800a96 <memmove+0x5e>
  800a7c:	89 c2                	mov    %eax,%edx
  800a7e:	09 ca                	or     %ecx,%edx
  800a80:	09 f2                	or     %esi,%edx
  800a82:	f6 c2 03             	test   $0x3,%dl
  800a85:	75 0a                	jne    800a91 <memmove+0x59>
  800a87:	c1 e9 02             	shr    $0x2,%ecx
  800a8a:	89 c7                	mov    %eax,%edi
  800a8c:	fc                   	cld
  800a8d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a8f:	eb 05                	jmp    800a96 <memmove+0x5e>
  800a91:	89 c7                	mov    %eax,%edi
  800a93:	fc                   	cld
  800a94:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a96:	5e                   	pop    %esi
  800a97:	5f                   	pop    %edi
  800a98:	5d                   	pop    %ebp
  800a99:	c3                   	ret

00800a9a <memcpy>:
  800a9a:	55                   	push   %ebp
  800a9b:	89 e5                	mov    %esp,%ebp
  800a9d:	83 ec 0c             	sub    $0xc,%esp
  800aa0:	ff 75 10             	push   0x10(%ebp)
  800aa3:	ff 75 0c             	push   0xc(%ebp)
  800aa6:	ff 75 08             	push   0x8(%ebp)
  800aa9:	e8 8a ff ff ff       	call   800a38 <memmove>
  800aae:	c9                   	leave
  800aaf:	c3                   	ret

00800ab0 <memcmp>:
  800ab0:	55                   	push   %ebp
  800ab1:	89 e5                	mov    %esp,%ebp
  800ab3:	56                   	push   %esi
  800ab4:	53                   	push   %ebx
  800ab5:	8b 45 08             	mov    0x8(%ebp),%eax
  800ab8:	8b 55 0c             	mov    0xc(%ebp),%edx
  800abb:	89 c6                	mov    %eax,%esi
  800abd:	03 75 10             	add    0x10(%ebp),%esi
  800ac0:	eb 06                	jmp    800ac8 <memcmp+0x18>
  800ac2:	83 c0 01             	add    $0x1,%eax
  800ac5:	83 c2 01             	add    $0x1,%edx
  800ac8:	39 f0                	cmp    %esi,%eax
  800aca:	74 14                	je     800ae0 <memcmp+0x30>
  800acc:	0f b6 08             	movzbl (%eax),%ecx
  800acf:	0f b6 1a             	movzbl (%edx),%ebx
  800ad2:	38 d9                	cmp    %bl,%cl
  800ad4:	74 ec                	je     800ac2 <memcmp+0x12>
  800ad6:	0f b6 c1             	movzbl %cl,%eax
  800ad9:	0f b6 db             	movzbl %bl,%ebx
  800adc:	29 d8                	sub    %ebx,%eax
  800ade:	eb 05                	jmp    800ae5 <memcmp+0x35>
  800ae0:	b8 00 00 00 00       	mov    $0x0,%eax
  800ae5:	5b                   	pop    %ebx
  800ae6:	5e                   	pop    %esi
  800ae7:	5d                   	pop    %ebp
  800ae8:	c3                   	ret

00800ae9 <memfind>:
  800ae9:	55                   	push   %ebp
  800aea:	89 e5                	mov    %esp,%ebp
  800aec:	8b 45 08             	mov    0x8(%ebp),%eax
  800aef:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800af2:	89 c2                	mov    %eax,%edx
  800af4:	03 55 10             	add    0x10(%ebp),%edx
  800af7:	eb 03                	jmp    800afc <memfind+0x13>
  800af9:	83 c0 01             	add    $0x1,%eax
  800afc:	39 d0                	cmp    %edx,%eax
  800afe:	73 04                	jae    800b04 <memfind+0x1b>
  800b00:	38 08                	cmp    %cl,(%eax)
  800b02:	75 f5                	jne    800af9 <memfind+0x10>
  800b04:	5d                   	pop    %ebp
  800b05:	c3                   	ret

00800b06 <strtol>:
  800b06:	55                   	push   %ebp
  800b07:	89 e5                	mov    %esp,%ebp
  800b09:	57                   	push   %edi
  800b0a:	56                   	push   %esi
  800b0b:	53                   	push   %ebx
  800b0c:	8b 55 08             	mov    0x8(%ebp),%edx
  800b0f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800b12:	eb 03                	jmp    800b17 <strtol+0x11>
  800b14:	83 c2 01             	add    $0x1,%edx
  800b17:	0f b6 02             	movzbl (%edx),%eax
  800b1a:	3c 20                	cmp    $0x20,%al
  800b1c:	74 f6                	je     800b14 <strtol+0xe>
  800b1e:	3c 09                	cmp    $0x9,%al
  800b20:	74 f2                	je     800b14 <strtol+0xe>
  800b22:	3c 2b                	cmp    $0x2b,%al
  800b24:	74 2a                	je     800b50 <strtol+0x4a>
  800b26:	bf 00 00 00 00       	mov    $0x0,%edi
  800b2b:	3c 2d                	cmp    $0x2d,%al
  800b2d:	74 2b                	je     800b5a <strtol+0x54>
  800b2f:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800b35:	75 0f                	jne    800b46 <strtol+0x40>
  800b37:	80 3a 30             	cmpb   $0x30,(%edx)
  800b3a:	74 28                	je     800b64 <strtol+0x5e>
  800b3c:	85 db                	test   %ebx,%ebx
  800b3e:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b43:	0f 44 d8             	cmove  %eax,%ebx
  800b46:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b4b:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800b4e:	eb 46                	jmp    800b96 <strtol+0x90>
  800b50:	83 c2 01             	add    $0x1,%edx
  800b53:	bf 00 00 00 00       	mov    $0x0,%edi
  800b58:	eb d5                	jmp    800b2f <strtol+0x29>
  800b5a:	83 c2 01             	add    $0x1,%edx
  800b5d:	bf 01 00 00 00       	mov    $0x1,%edi
  800b62:	eb cb                	jmp    800b2f <strtol+0x29>
  800b64:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800b68:	74 0e                	je     800b78 <strtol+0x72>
  800b6a:	85 db                	test   %ebx,%ebx
  800b6c:	75 d8                	jne    800b46 <strtol+0x40>
  800b6e:	83 c2 01             	add    $0x1,%edx
  800b71:	bb 08 00 00 00       	mov    $0x8,%ebx
  800b76:	eb ce                	jmp    800b46 <strtol+0x40>
  800b78:	83 c2 02             	add    $0x2,%edx
  800b7b:	bb 10 00 00 00       	mov    $0x10,%ebx
  800b80:	eb c4                	jmp    800b46 <strtol+0x40>
  800b82:	0f be c0             	movsbl %al,%eax
  800b85:	83 e8 30             	sub    $0x30,%eax
  800b88:	3b 45 10             	cmp    0x10(%ebp),%eax
  800b8b:	7d 3a                	jge    800bc7 <strtol+0xc1>
  800b8d:	83 c2 01             	add    $0x1,%edx
  800b90:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800b94:	01 c1                	add    %eax,%ecx
  800b96:	0f b6 02             	movzbl (%edx),%eax
  800b99:	8d 70 d0             	lea    -0x30(%eax),%esi
  800b9c:	89 f3                	mov    %esi,%ebx
  800b9e:	80 fb 09             	cmp    $0x9,%bl
  800ba1:	76 df                	jbe    800b82 <strtol+0x7c>
  800ba3:	8d 70 9f             	lea    -0x61(%eax),%esi
  800ba6:	89 f3                	mov    %esi,%ebx
  800ba8:	80 fb 19             	cmp    $0x19,%bl
  800bab:	77 08                	ja     800bb5 <strtol+0xaf>
  800bad:	0f be c0             	movsbl %al,%eax
  800bb0:	83 e8 57             	sub    $0x57,%eax
  800bb3:	eb d3                	jmp    800b88 <strtol+0x82>
  800bb5:	8d 70 bf             	lea    -0x41(%eax),%esi
  800bb8:	89 f3                	mov    %esi,%ebx
  800bba:	80 fb 19             	cmp    $0x19,%bl
  800bbd:	77 08                	ja     800bc7 <strtol+0xc1>
  800bbf:	0f be c0             	movsbl %al,%eax
  800bc2:	83 e8 37             	sub    $0x37,%eax
  800bc5:	eb c1                	jmp    800b88 <strtol+0x82>
  800bc7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800bcb:	74 05                	je     800bd2 <strtol+0xcc>
  800bcd:	8b 45 0c             	mov    0xc(%ebp),%eax
  800bd0:	89 10                	mov    %edx,(%eax)
  800bd2:	89 c8                	mov    %ecx,%eax
  800bd4:	f7 d8                	neg    %eax
  800bd6:	85 ff                	test   %edi,%edi
  800bd8:	0f 45 c8             	cmovne %eax,%ecx
  800bdb:	89 c8                	mov    %ecx,%eax
  800bdd:	5b                   	pop    %ebx
  800bde:	5e                   	pop    %esi
  800bdf:	5f                   	pop    %edi
  800be0:	5d                   	pop    %ebp
  800be1:	c3                   	ret
  800be2:	66 90                	xchg   %ax,%ax
  800be4:	66 90                	xchg   %ax,%ax
  800be6:	66 90                	xchg   %ax,%ax
  800be8:	66 90                	xchg   %ax,%ax
  800bea:	66 90                	xchg   %ax,%ax
  800bec:	66 90                	xchg   %ax,%ax
  800bee:	66 90                	xchg   %ax,%ax

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
