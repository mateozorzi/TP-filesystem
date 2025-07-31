
obj/user/softint:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 05 00 00 00       	call   800036 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	cd 0e                	int    $0xe
  800035:	c3                   	ret

00800036 <libmain>:
  800036:	55                   	push   %ebp
  800037:	89 e5                	mov    %esp,%ebp
  800039:	56                   	push   %esi
  80003a:	53                   	push   %ebx
  80003b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80003e:	8b 75 0c             	mov    0xc(%ebp),%esi
  800041:	e8 04 01 00 00       	call   80014a <sys_getenvid>
  800046:	85 c0                	test   %eax,%eax
  800048:	78 15                	js     80005f <libmain+0x29>
  80004a:	25 ff 03 00 00       	and    $0x3ff,%eax
  80004f:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800055:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  80005a:	a3 04 20 80 00       	mov    %eax,0x802004
  80005f:	85 db                	test   %ebx,%ebx
  800061:	7e 07                	jle    80006a <libmain+0x34>
  800063:	8b 06                	mov    (%esi),%eax
  800065:	a3 00 20 80 00       	mov    %eax,0x802000
  80006a:	83 ec 08             	sub    $0x8,%esp
  80006d:	56                   	push   %esi
  80006e:	53                   	push   %ebx
  80006f:	e8 bf ff ff ff       	call   800033 <umain>
  800074:	e8 0a 00 00 00       	call   800083 <exit>
  800079:	83 c4 10             	add    $0x10,%esp
  80007c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80007f:	5b                   	pop    %ebx
  800080:	5e                   	pop    %esi
  800081:	5d                   	pop    %ebp
  800082:	c3                   	ret

00800083 <exit>:
  800083:	55                   	push   %ebp
  800084:	89 e5                	mov    %esp,%ebp
  800086:	83 ec 14             	sub    $0x14,%esp
  800089:	6a 00                	push   $0x0
  80008b:	e8 98 00 00 00       	call   800128 <sys_env_destroy>
  800090:	83 c4 10             	add    $0x10,%esp
  800093:	c9                   	leave
  800094:	c3                   	ret

00800095 <syscall>:
  800095:	55                   	push   %ebp
  800096:	89 e5                	mov    %esp,%ebp
  800098:	57                   	push   %edi
  800099:	56                   	push   %esi
  80009a:	53                   	push   %ebx
  80009b:	83 ec 1c             	sub    $0x1c,%esp
  80009e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8000a1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8000a4:	89 ca                	mov    %ecx,%edx
  8000a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000ac:	8b 7d 10             	mov    0x10(%ebp),%edi
  8000af:	8b 75 14             	mov    0x14(%ebp),%esi
  8000b2:	cd 30                	int    $0x30
  8000b4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8000b8:	74 04                	je     8000be <syscall+0x29>
  8000ba:	85 c0                	test   %eax,%eax
  8000bc:	7f 08                	jg     8000c6 <syscall+0x31>
  8000be:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000c1:	5b                   	pop    %ebx
  8000c2:	5e                   	pop    %esi
  8000c3:	5f                   	pop    %edi
  8000c4:	5d                   	pop    %ebp
  8000c5:	c3                   	ret
  8000c6:	83 ec 0c             	sub    $0xc,%esp
  8000c9:	50                   	push   %eax
  8000ca:	ff 75 e0             	push   -0x20(%ebp)
  8000cd:	68 6a 0e 80 00       	push   $0x800e6a
  8000d2:	6a 1e                	push   $0x1e
  8000d4:	68 87 0e 80 00       	push   $0x800e87
  8000d9:	e8 b1 01 00 00       	call   80028f <_panic>

008000de <sys_cputs>:
  8000de:	55                   	push   %ebp
  8000df:	89 e5                	mov    %esp,%ebp
  8000e1:	83 ec 08             	sub    $0x8,%esp
  8000e4:	6a 00                	push   $0x0
  8000e6:	6a 00                	push   $0x0
  8000e8:	6a 00                	push   $0x0
  8000ea:	ff 75 0c             	push   0xc(%ebp)
  8000ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000f0:	ba 00 00 00 00       	mov    $0x0,%edx
  8000f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8000fa:	e8 96 ff ff ff       	call   800095 <syscall>
  8000ff:	83 c4 10             	add    $0x10,%esp
  800102:	c9                   	leave
  800103:	c3                   	ret

00800104 <sys_cgetc>:
  800104:	55                   	push   %ebp
  800105:	89 e5                	mov    %esp,%ebp
  800107:	83 ec 08             	sub    $0x8,%esp
  80010a:	6a 00                	push   $0x0
  80010c:	6a 00                	push   $0x0
  80010e:	6a 00                	push   $0x0
  800110:	6a 00                	push   $0x0
  800112:	b9 00 00 00 00       	mov    $0x0,%ecx
  800117:	ba 00 00 00 00       	mov    $0x0,%edx
  80011c:	b8 01 00 00 00       	mov    $0x1,%eax
  800121:	e8 6f ff ff ff       	call   800095 <syscall>
  800126:	c9                   	leave
  800127:	c3                   	ret

00800128 <sys_env_destroy>:
  800128:	55                   	push   %ebp
  800129:	89 e5                	mov    %esp,%ebp
  80012b:	83 ec 08             	sub    $0x8,%esp
  80012e:	6a 00                	push   $0x0
  800130:	6a 00                	push   $0x0
  800132:	6a 00                	push   $0x0
  800134:	6a 00                	push   $0x0
  800136:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800139:	ba 01 00 00 00       	mov    $0x1,%edx
  80013e:	b8 03 00 00 00       	mov    $0x3,%eax
  800143:	e8 4d ff ff ff       	call   800095 <syscall>
  800148:	c9                   	leave
  800149:	c3                   	ret

0080014a <sys_getenvid>:
  80014a:	55                   	push   %ebp
  80014b:	89 e5                	mov    %esp,%ebp
  80014d:	83 ec 08             	sub    $0x8,%esp
  800150:	6a 00                	push   $0x0
  800152:	6a 00                	push   $0x0
  800154:	6a 00                	push   $0x0
  800156:	6a 00                	push   $0x0
  800158:	b9 00 00 00 00       	mov    $0x0,%ecx
  80015d:	ba 00 00 00 00       	mov    $0x0,%edx
  800162:	b8 02 00 00 00       	mov    $0x2,%eax
  800167:	e8 29 ff ff ff       	call   800095 <syscall>
  80016c:	c9                   	leave
  80016d:	c3                   	ret

0080016e <sys_yield>:
  80016e:	55                   	push   %ebp
  80016f:	89 e5                	mov    %esp,%ebp
  800171:	83 ec 08             	sub    $0x8,%esp
  800174:	6a 00                	push   $0x0
  800176:	6a 00                	push   $0x0
  800178:	6a 00                	push   $0x0
  80017a:	6a 00                	push   $0x0
  80017c:	b9 00 00 00 00       	mov    $0x0,%ecx
  800181:	ba 00 00 00 00       	mov    $0x0,%edx
  800186:	b8 0a 00 00 00       	mov    $0xa,%eax
  80018b:	e8 05 ff ff ff       	call   800095 <syscall>
  800190:	83 c4 10             	add    $0x10,%esp
  800193:	c9                   	leave
  800194:	c3                   	ret

00800195 <sys_page_alloc>:
  800195:	55                   	push   %ebp
  800196:	89 e5                	mov    %esp,%ebp
  800198:	83 ec 08             	sub    $0x8,%esp
  80019b:	6a 00                	push   $0x0
  80019d:	6a 00                	push   $0x0
  80019f:	ff 75 10             	push   0x10(%ebp)
  8001a2:	ff 75 0c             	push   0xc(%ebp)
  8001a5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001a8:	ba 01 00 00 00       	mov    $0x1,%edx
  8001ad:	b8 04 00 00 00       	mov    $0x4,%eax
  8001b2:	e8 de fe ff ff       	call   800095 <syscall>
  8001b7:	c9                   	leave
  8001b8:	c3                   	ret

008001b9 <sys_page_map>:
  8001b9:	55                   	push   %ebp
  8001ba:	89 e5                	mov    %esp,%ebp
  8001bc:	83 ec 08             	sub    $0x8,%esp
  8001bf:	ff 75 18             	push   0x18(%ebp)
  8001c2:	ff 75 14             	push   0x14(%ebp)
  8001c5:	ff 75 10             	push   0x10(%ebp)
  8001c8:	ff 75 0c             	push   0xc(%ebp)
  8001cb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001ce:	ba 01 00 00 00       	mov    $0x1,%edx
  8001d3:	b8 05 00 00 00       	mov    $0x5,%eax
  8001d8:	e8 b8 fe ff ff       	call   800095 <syscall>
  8001dd:	c9                   	leave
  8001de:	c3                   	ret

008001df <sys_page_unmap>:
  8001df:	55                   	push   %ebp
  8001e0:	89 e5                	mov    %esp,%ebp
  8001e2:	83 ec 08             	sub    $0x8,%esp
  8001e5:	6a 00                	push   $0x0
  8001e7:	6a 00                	push   $0x0
  8001e9:	6a 00                	push   $0x0
  8001eb:	ff 75 0c             	push   0xc(%ebp)
  8001ee:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001f1:	ba 01 00 00 00       	mov    $0x1,%edx
  8001f6:	b8 06 00 00 00       	mov    $0x6,%eax
  8001fb:	e8 95 fe ff ff       	call   800095 <syscall>
  800200:	c9                   	leave
  800201:	c3                   	ret

00800202 <sys_env_set_status>:
  800202:	55                   	push   %ebp
  800203:	89 e5                	mov    %esp,%ebp
  800205:	83 ec 08             	sub    $0x8,%esp
  800208:	6a 00                	push   $0x0
  80020a:	6a 00                	push   $0x0
  80020c:	6a 00                	push   $0x0
  80020e:	ff 75 0c             	push   0xc(%ebp)
  800211:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800214:	ba 01 00 00 00       	mov    $0x1,%edx
  800219:	b8 08 00 00 00       	mov    $0x8,%eax
  80021e:	e8 72 fe ff ff       	call   800095 <syscall>
  800223:	c9                   	leave
  800224:	c3                   	ret

00800225 <sys_env_set_pgfault_upcall>:
  800225:	55                   	push   %ebp
  800226:	89 e5                	mov    %esp,%ebp
  800228:	83 ec 08             	sub    $0x8,%esp
  80022b:	6a 00                	push   $0x0
  80022d:	6a 00                	push   $0x0
  80022f:	6a 00                	push   $0x0
  800231:	ff 75 0c             	push   0xc(%ebp)
  800234:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800237:	ba 01 00 00 00       	mov    $0x1,%edx
  80023c:	b8 09 00 00 00       	mov    $0x9,%eax
  800241:	e8 4f fe ff ff       	call   800095 <syscall>
  800246:	c9                   	leave
  800247:	c3                   	ret

00800248 <sys_ipc_try_send>:
  800248:	55                   	push   %ebp
  800249:	89 e5                	mov    %esp,%ebp
  80024b:	83 ec 08             	sub    $0x8,%esp
  80024e:	6a 00                	push   $0x0
  800250:	ff 75 14             	push   0x14(%ebp)
  800253:	ff 75 10             	push   0x10(%ebp)
  800256:	ff 75 0c             	push   0xc(%ebp)
  800259:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80025c:	ba 00 00 00 00       	mov    $0x0,%edx
  800261:	b8 0c 00 00 00       	mov    $0xc,%eax
  800266:	e8 2a fe ff ff       	call   800095 <syscall>
  80026b:	c9                   	leave
  80026c:	c3                   	ret

0080026d <sys_ipc_recv>:
  80026d:	55                   	push   %ebp
  80026e:	89 e5                	mov    %esp,%ebp
  800270:	83 ec 08             	sub    $0x8,%esp
  800273:	6a 00                	push   $0x0
  800275:	6a 00                	push   $0x0
  800277:	6a 00                	push   $0x0
  800279:	6a 00                	push   $0x0
  80027b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80027e:	ba 01 00 00 00       	mov    $0x1,%edx
  800283:	b8 0d 00 00 00       	mov    $0xd,%eax
  800288:	e8 08 fe ff ff       	call   800095 <syscall>
  80028d:	c9                   	leave
  80028e:	c3                   	ret

0080028f <_panic>:
  80028f:	55                   	push   %ebp
  800290:	89 e5                	mov    %esp,%ebp
  800292:	56                   	push   %esi
  800293:	53                   	push   %ebx
  800294:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800297:	8b 35 00 20 80 00    	mov    0x802000,%esi
  80029d:	e8 a8 fe ff ff       	call   80014a <sys_getenvid>
  8002a2:	83 ec 0c             	sub    $0xc,%esp
  8002a5:	ff 75 0c             	push   0xc(%ebp)
  8002a8:	ff 75 08             	push   0x8(%ebp)
  8002ab:	56                   	push   %esi
  8002ac:	50                   	push   %eax
  8002ad:	68 50 0f 80 00       	push   $0x800f50
  8002b2:	e8 b3 00 00 00       	call   80036a <cprintf>
  8002b7:	83 c4 18             	add    $0x18,%esp
  8002ba:	53                   	push   %ebx
  8002bb:	ff 75 10             	push   0x10(%ebp)
  8002be:	e8 56 00 00 00       	call   800319 <vcprintf>
  8002c3:	c7 04 24 95 0e 80 00 	movl   $0x800e95,(%esp)
  8002ca:	e8 9b 00 00 00       	call   80036a <cprintf>
  8002cf:	83 c4 10             	add    $0x10,%esp
  8002d2:	cc                   	int3
  8002d3:	eb fd                	jmp    8002d2 <_panic+0x43>

008002d5 <putch>:
  8002d5:	55                   	push   %ebp
  8002d6:	89 e5                	mov    %esp,%ebp
  8002d8:	53                   	push   %ebx
  8002d9:	83 ec 04             	sub    $0x4,%esp
  8002dc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8002df:	8b 13                	mov    (%ebx),%edx
  8002e1:	8d 42 01             	lea    0x1(%edx),%eax
  8002e4:	89 03                	mov    %eax,(%ebx)
  8002e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8002e9:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8002ed:	3d ff 00 00 00       	cmp    $0xff,%eax
  8002f2:	74 09                	je     8002fd <putch+0x28>
  8002f4:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8002f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8002fb:	c9                   	leave
  8002fc:	c3                   	ret
  8002fd:	83 ec 08             	sub    $0x8,%esp
  800300:	68 ff 00 00 00       	push   $0xff
  800305:	8d 43 08             	lea    0x8(%ebx),%eax
  800308:	50                   	push   %eax
  800309:	e8 d0 fd ff ff       	call   8000de <sys_cputs>
  80030e:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800314:	83 c4 10             	add    $0x10,%esp
  800317:	eb db                	jmp    8002f4 <putch+0x1f>

00800319 <vcprintf>:
  800319:	55                   	push   %ebp
  80031a:	89 e5                	mov    %esp,%ebp
  80031c:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800322:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800329:	00 00 00 
  80032c:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800333:	00 00 00 
  800336:	ff 75 0c             	push   0xc(%ebp)
  800339:	ff 75 08             	push   0x8(%ebp)
  80033c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800342:	50                   	push   %eax
  800343:	68 d5 02 80 00       	push   $0x8002d5
  800348:	e8 74 01 00 00       	call   8004c1 <vprintfmt>
  80034d:	83 c4 08             	add    $0x8,%esp
  800350:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800356:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  80035c:	50                   	push   %eax
  80035d:	e8 7c fd ff ff       	call   8000de <sys_cputs>
  800362:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800368:	c9                   	leave
  800369:	c3                   	ret

0080036a <cprintf>:
  80036a:	55                   	push   %ebp
  80036b:	89 e5                	mov    %esp,%ebp
  80036d:	83 ec 10             	sub    $0x10,%esp
  800370:	8d 45 0c             	lea    0xc(%ebp),%eax
  800373:	50                   	push   %eax
  800374:	ff 75 08             	push   0x8(%ebp)
  800377:	e8 9d ff ff ff       	call   800319 <vcprintf>
  80037c:	c9                   	leave
  80037d:	c3                   	ret

0080037e <printnum>:
  80037e:	55                   	push   %ebp
  80037f:	89 e5                	mov    %esp,%ebp
  800381:	57                   	push   %edi
  800382:	56                   	push   %esi
  800383:	53                   	push   %ebx
  800384:	83 ec 1c             	sub    $0x1c,%esp
  800387:	89 c7                	mov    %eax,%edi
  800389:	89 d6                	mov    %edx,%esi
  80038b:	8b 45 08             	mov    0x8(%ebp),%eax
  80038e:	8b 55 0c             	mov    0xc(%ebp),%edx
  800391:	89 d1                	mov    %edx,%ecx
  800393:	89 c2                	mov    %eax,%edx
  800395:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800398:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  80039b:	8b 45 10             	mov    0x10(%ebp),%eax
  80039e:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8003a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003a4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8003ab:	39 c2                	cmp    %eax,%edx
  8003ad:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8003b0:	72 3e                	jb     8003f0 <printnum+0x72>
  8003b2:	83 ec 0c             	sub    $0xc,%esp
  8003b5:	ff 75 18             	push   0x18(%ebp)
  8003b8:	83 eb 01             	sub    $0x1,%ebx
  8003bb:	53                   	push   %ebx
  8003bc:	50                   	push   %eax
  8003bd:	83 ec 08             	sub    $0x8,%esp
  8003c0:	ff 75 e4             	push   -0x1c(%ebp)
  8003c3:	ff 75 e0             	push   -0x20(%ebp)
  8003c6:	ff 75 dc             	push   -0x24(%ebp)
  8003c9:	ff 75 d8             	push   -0x28(%ebp)
  8003cc:	e8 1f 08 00 00       	call   800bf0 <__udivdi3>
  8003d1:	83 c4 18             	add    $0x18,%esp
  8003d4:	52                   	push   %edx
  8003d5:	50                   	push   %eax
  8003d6:	89 f2                	mov    %esi,%edx
  8003d8:	89 f8                	mov    %edi,%eax
  8003da:	e8 9f ff ff ff       	call   80037e <printnum>
  8003df:	83 c4 20             	add    $0x20,%esp
  8003e2:	eb 13                	jmp    8003f7 <printnum+0x79>
  8003e4:	83 ec 08             	sub    $0x8,%esp
  8003e7:	56                   	push   %esi
  8003e8:	ff 75 18             	push   0x18(%ebp)
  8003eb:	ff d7                	call   *%edi
  8003ed:	83 c4 10             	add    $0x10,%esp
  8003f0:	83 eb 01             	sub    $0x1,%ebx
  8003f3:	85 db                	test   %ebx,%ebx
  8003f5:	7f ed                	jg     8003e4 <printnum+0x66>
  8003f7:	83 ec 08             	sub    $0x8,%esp
  8003fa:	56                   	push   %esi
  8003fb:	83 ec 04             	sub    $0x4,%esp
  8003fe:	ff 75 e4             	push   -0x1c(%ebp)
  800401:	ff 75 e0             	push   -0x20(%ebp)
  800404:	ff 75 dc             	push   -0x24(%ebp)
  800407:	ff 75 d8             	push   -0x28(%ebp)
  80040a:	e8 01 09 00 00       	call   800d10 <__umoddi3>
  80040f:	83 c4 14             	add    $0x14,%esp
  800412:	0f be 80 97 0e 80 00 	movsbl 0x800e97(%eax),%eax
  800419:	50                   	push   %eax
  80041a:	ff d7                	call   *%edi
  80041c:	83 c4 10             	add    $0x10,%esp
  80041f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800422:	5b                   	pop    %ebx
  800423:	5e                   	pop    %esi
  800424:	5f                   	pop    %edi
  800425:	5d                   	pop    %ebp
  800426:	c3                   	ret

00800427 <getuint>:
  800427:	83 fa 01             	cmp    $0x1,%edx
  80042a:	7f 13                	jg     80043f <getuint+0x18>
  80042c:	85 d2                	test   %edx,%edx
  80042e:	74 1c                	je     80044c <getuint+0x25>
  800430:	8b 10                	mov    (%eax),%edx
  800432:	8d 4a 04             	lea    0x4(%edx),%ecx
  800435:	89 08                	mov    %ecx,(%eax)
  800437:	8b 02                	mov    (%edx),%eax
  800439:	ba 00 00 00 00       	mov    $0x0,%edx
  80043e:	c3                   	ret
  80043f:	8b 10                	mov    (%eax),%edx
  800441:	8d 4a 08             	lea    0x8(%edx),%ecx
  800444:	89 08                	mov    %ecx,(%eax)
  800446:	8b 02                	mov    (%edx),%eax
  800448:	8b 52 04             	mov    0x4(%edx),%edx
  80044b:	c3                   	ret
  80044c:	8b 10                	mov    (%eax),%edx
  80044e:	8d 4a 04             	lea    0x4(%edx),%ecx
  800451:	89 08                	mov    %ecx,(%eax)
  800453:	8b 02                	mov    (%edx),%eax
  800455:	ba 00 00 00 00       	mov    $0x0,%edx
  80045a:	c3                   	ret

0080045b <getint>:
  80045b:	83 fa 01             	cmp    $0x1,%edx
  80045e:	7f 0f                	jg     80046f <getint+0x14>
  800460:	85 d2                	test   %edx,%edx
  800462:	74 18                	je     80047c <getint+0x21>
  800464:	8b 10                	mov    (%eax),%edx
  800466:	8d 4a 04             	lea    0x4(%edx),%ecx
  800469:	89 08                	mov    %ecx,(%eax)
  80046b:	8b 02                	mov    (%edx),%eax
  80046d:	99                   	cltd
  80046e:	c3                   	ret
  80046f:	8b 10                	mov    (%eax),%edx
  800471:	8d 4a 08             	lea    0x8(%edx),%ecx
  800474:	89 08                	mov    %ecx,(%eax)
  800476:	8b 02                	mov    (%edx),%eax
  800478:	8b 52 04             	mov    0x4(%edx),%edx
  80047b:	c3                   	ret
  80047c:	8b 10                	mov    (%eax),%edx
  80047e:	8d 4a 04             	lea    0x4(%edx),%ecx
  800481:	89 08                	mov    %ecx,(%eax)
  800483:	8b 02                	mov    (%edx),%eax
  800485:	99                   	cltd
  800486:	c3                   	ret

00800487 <sprintputch>:
  800487:	55                   	push   %ebp
  800488:	89 e5                	mov    %esp,%ebp
  80048a:	8b 45 0c             	mov    0xc(%ebp),%eax
  80048d:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800491:	8b 10                	mov    (%eax),%edx
  800493:	3b 50 04             	cmp    0x4(%eax),%edx
  800496:	73 0a                	jae    8004a2 <sprintputch+0x1b>
  800498:	8d 4a 01             	lea    0x1(%edx),%ecx
  80049b:	89 08                	mov    %ecx,(%eax)
  80049d:	8b 45 08             	mov    0x8(%ebp),%eax
  8004a0:	88 02                	mov    %al,(%edx)
  8004a2:	5d                   	pop    %ebp
  8004a3:	c3                   	ret

008004a4 <printfmt>:
  8004a4:	55                   	push   %ebp
  8004a5:	89 e5                	mov    %esp,%ebp
  8004a7:	83 ec 08             	sub    $0x8,%esp
  8004aa:	8d 45 14             	lea    0x14(%ebp),%eax
  8004ad:	50                   	push   %eax
  8004ae:	ff 75 10             	push   0x10(%ebp)
  8004b1:	ff 75 0c             	push   0xc(%ebp)
  8004b4:	ff 75 08             	push   0x8(%ebp)
  8004b7:	e8 05 00 00 00       	call   8004c1 <vprintfmt>
  8004bc:	83 c4 10             	add    $0x10,%esp
  8004bf:	c9                   	leave
  8004c0:	c3                   	ret

008004c1 <vprintfmt>:
  8004c1:	55                   	push   %ebp
  8004c2:	89 e5                	mov    %esp,%ebp
  8004c4:	57                   	push   %edi
  8004c5:	56                   	push   %esi
  8004c6:	53                   	push   %ebx
  8004c7:	83 ec 2c             	sub    $0x2c,%esp
  8004ca:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004cd:	8b 75 0c             	mov    0xc(%ebp),%esi
  8004d0:	8b 7d 10             	mov    0x10(%ebp),%edi
  8004d3:	eb 0a                	jmp    8004df <vprintfmt+0x1e>
  8004d5:	83 ec 08             	sub    $0x8,%esp
  8004d8:	56                   	push   %esi
  8004d9:	50                   	push   %eax
  8004da:	ff d3                	call   *%ebx
  8004dc:	83 c4 10             	add    $0x10,%esp
  8004df:	83 c7 01             	add    $0x1,%edi
  8004e2:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8004e6:	83 f8 25             	cmp    $0x25,%eax
  8004e9:	74 0c                	je     8004f7 <vprintfmt+0x36>
  8004eb:	85 c0                	test   %eax,%eax
  8004ed:	75 e6                	jne    8004d5 <vprintfmt+0x14>
  8004ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8004f2:	5b                   	pop    %ebx
  8004f3:	5e                   	pop    %esi
  8004f4:	5f                   	pop    %edi
  8004f5:	5d                   	pop    %ebp
  8004f6:	c3                   	ret
  8004f7:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8004fb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800502:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800509:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800510:	b9 00 00 00 00       	mov    $0x0,%ecx
  800515:	8d 47 01             	lea    0x1(%edi),%eax
  800518:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80051b:	0f b6 17             	movzbl (%edi),%edx
  80051e:	8d 42 dd             	lea    -0x23(%edx),%eax
  800521:	3c 55                	cmp    $0x55,%al
  800523:	0f 87 c3 02 00 00    	ja     8007ec <vprintfmt+0x32b>
  800529:	0f b6 c0             	movzbl %al,%eax
  80052c:	ff 24 85 80 0f 80 00 	jmp    *0x800f80(,%eax,4)
  800533:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800536:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  80053a:	eb d9                	jmp    800515 <vprintfmt+0x54>
  80053c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80053f:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800543:	eb d0                	jmp    800515 <vprintfmt+0x54>
  800545:	0f b6 d2             	movzbl %dl,%edx
  800548:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80054b:	b8 00 00 00 00       	mov    $0x0,%eax
  800550:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800553:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800556:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  80055a:	0f be 17             	movsbl (%edi),%edx
  80055d:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800560:	83 f9 09             	cmp    $0x9,%ecx
  800563:	77 52                	ja     8005b7 <vprintfmt+0xf6>
  800565:	83 c7 01             	add    $0x1,%edi
  800568:	eb e9                	jmp    800553 <vprintfmt+0x92>
  80056a:	8b 45 14             	mov    0x14(%ebp),%eax
  80056d:	8d 50 04             	lea    0x4(%eax),%edx
  800570:	89 55 14             	mov    %edx,0x14(%ebp)
  800573:	8b 00                	mov    (%eax),%eax
  800575:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800578:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80057b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80057f:	79 94                	jns    800515 <vprintfmt+0x54>
  800581:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800584:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800587:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80058e:	eb 85                	jmp    800515 <vprintfmt+0x54>
  800590:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800593:	85 d2                	test   %edx,%edx
  800595:	b8 00 00 00 00       	mov    $0x0,%eax
  80059a:	0f 49 c2             	cmovns %edx,%eax
  80059d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005a3:	e9 6d ff ff ff       	jmp    800515 <vprintfmt+0x54>
  8005a8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005ab:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8005b2:	e9 5e ff ff ff       	jmp    800515 <vprintfmt+0x54>
  8005b7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8005ba:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005bd:	eb bc                	jmp    80057b <vprintfmt+0xba>
  8005bf:	83 c1 01             	add    $0x1,%ecx
  8005c2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005c5:	e9 4b ff ff ff       	jmp    800515 <vprintfmt+0x54>
  8005ca:	8b 45 14             	mov    0x14(%ebp),%eax
  8005cd:	8d 50 04             	lea    0x4(%eax),%edx
  8005d0:	89 55 14             	mov    %edx,0x14(%ebp)
  8005d3:	83 ec 08             	sub    $0x8,%esp
  8005d6:	56                   	push   %esi
  8005d7:	ff 30                	push   (%eax)
  8005d9:	ff d3                	call   *%ebx
  8005db:	83 c4 10             	add    $0x10,%esp
  8005de:	e9 a0 01 00 00       	jmp    800783 <vprintfmt+0x2c2>
  8005e3:	8b 45 14             	mov    0x14(%ebp),%eax
  8005e6:	8d 50 04             	lea    0x4(%eax),%edx
  8005e9:	89 55 14             	mov    %edx,0x14(%ebp)
  8005ec:	8b 10                	mov    (%eax),%edx
  8005ee:	89 d0                	mov    %edx,%eax
  8005f0:	f7 d8                	neg    %eax
  8005f2:	0f 48 c2             	cmovs  %edx,%eax
  8005f5:	83 f8 08             	cmp    $0x8,%eax
  8005f8:	7f 20                	jg     80061a <vprintfmt+0x159>
  8005fa:	8b 14 85 e0 10 80 00 	mov    0x8010e0(,%eax,4),%edx
  800601:	85 d2                	test   %edx,%edx
  800603:	74 15                	je     80061a <vprintfmt+0x159>
  800605:	52                   	push   %edx
  800606:	68 b8 0e 80 00       	push   $0x800eb8
  80060b:	56                   	push   %esi
  80060c:	53                   	push   %ebx
  80060d:	e8 92 fe ff ff       	call   8004a4 <printfmt>
  800612:	83 c4 10             	add    $0x10,%esp
  800615:	e9 69 01 00 00       	jmp    800783 <vprintfmt+0x2c2>
  80061a:	50                   	push   %eax
  80061b:	68 af 0e 80 00       	push   $0x800eaf
  800620:	56                   	push   %esi
  800621:	53                   	push   %ebx
  800622:	e8 7d fe ff ff       	call   8004a4 <printfmt>
  800627:	83 c4 10             	add    $0x10,%esp
  80062a:	e9 54 01 00 00       	jmp    800783 <vprintfmt+0x2c2>
  80062f:	8b 45 14             	mov    0x14(%ebp),%eax
  800632:	8d 50 04             	lea    0x4(%eax),%edx
  800635:	89 55 14             	mov    %edx,0x14(%ebp)
  800638:	8b 08                	mov    (%eax),%ecx
  80063a:	85 c9                	test   %ecx,%ecx
  80063c:	b8 a8 0e 80 00       	mov    $0x800ea8,%eax
  800641:	0f 45 c1             	cmovne %ecx,%eax
  800644:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800647:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80064b:	7e 06                	jle    800653 <vprintfmt+0x192>
  80064d:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800651:	75 0b                	jne    80065e <vprintfmt+0x19d>
  800653:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800656:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800659:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80065c:	eb 5c                	jmp    8006ba <vprintfmt+0x1f9>
  80065e:	83 ec 08             	sub    $0x8,%esp
  800661:	ff 75 d0             	push   -0x30(%ebp)
  800664:	ff 75 cc             	push   -0x34(%ebp)
  800667:	e8 20 02 00 00       	call   80088c <strnlen>
  80066c:	89 c2                	mov    %eax,%edx
  80066e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800671:	29 d0                	sub    %edx,%eax
  800673:	83 c4 10             	add    $0x10,%esp
  800676:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  80067a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80067d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800680:	89 c3                	mov    %eax,%ebx
  800682:	eb 0e                	jmp    800692 <vprintfmt+0x1d1>
  800684:	83 ec 08             	sub    $0x8,%esp
  800687:	56                   	push   %esi
  800688:	57                   	push   %edi
  800689:	ff 55 08             	call   *0x8(%ebp)
  80068c:	83 eb 01             	sub    $0x1,%ebx
  80068f:	83 c4 10             	add    $0x10,%esp
  800692:	85 db                	test   %ebx,%ebx
  800694:	7f ee                	jg     800684 <vprintfmt+0x1c3>
  800696:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800699:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80069c:	85 c0                	test   %eax,%eax
  80069e:	ba 00 00 00 00       	mov    $0x0,%edx
  8006a3:	0f 49 d0             	cmovns %eax,%edx
  8006a6:	29 d0                	sub    %edx,%eax
  8006a8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006ab:	eb a6                	jmp    800653 <vprintfmt+0x192>
  8006ad:	83 ec 08             	sub    $0x8,%esp
  8006b0:	56                   	push   %esi
  8006b1:	52                   	push   %edx
  8006b2:	ff 55 08             	call   *0x8(%ebp)
  8006b5:	83 c4 10             	add    $0x10,%esp
  8006b8:	89 d9                	mov    %ebx,%ecx
  8006ba:	8d 59 01             	lea    0x1(%ecx),%ebx
  8006bd:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8006c1:	0f be d0             	movsbl %al,%edx
  8006c4:	85 d2                	test   %edx,%edx
  8006c6:	74 28                	je     8006f0 <vprintfmt+0x22f>
  8006c8:	85 ff                	test   %edi,%edi
  8006ca:	78 05                	js     8006d1 <vprintfmt+0x210>
  8006cc:	83 ef 01             	sub    $0x1,%edi
  8006cf:	78 2e                	js     8006ff <vprintfmt+0x23e>
  8006d1:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8006d5:	74 d6                	je     8006ad <vprintfmt+0x1ec>
  8006d7:	0f be c0             	movsbl %al,%eax
  8006da:	83 e8 20             	sub    $0x20,%eax
  8006dd:	83 f8 5e             	cmp    $0x5e,%eax
  8006e0:	76 cb                	jbe    8006ad <vprintfmt+0x1ec>
  8006e2:	83 ec 08             	sub    $0x8,%esp
  8006e5:	56                   	push   %esi
  8006e6:	6a 3f                	push   $0x3f
  8006e8:	ff 55 08             	call   *0x8(%ebp)
  8006eb:	83 c4 10             	add    $0x10,%esp
  8006ee:	eb c8                	jmp    8006b8 <vprintfmt+0x1f7>
  8006f0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006f3:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8006f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006f9:	01 c7                	add    %eax,%edi
  8006fb:	29 cf                	sub    %ecx,%edi
  8006fd:	eb 13                	jmp    800712 <vprintfmt+0x251>
  8006ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800702:	eb ef                	jmp    8006f3 <vprintfmt+0x232>
  800704:	83 ec 08             	sub    $0x8,%esp
  800707:	56                   	push   %esi
  800708:	6a 20                	push   $0x20
  80070a:	ff d3                	call   *%ebx
  80070c:	83 ef 01             	sub    $0x1,%edi
  80070f:	83 c4 10             	add    $0x10,%esp
  800712:	85 ff                	test   %edi,%edi
  800714:	7f ee                	jg     800704 <vprintfmt+0x243>
  800716:	eb 6b                	jmp    800783 <vprintfmt+0x2c2>
  800718:	89 ca                	mov    %ecx,%edx
  80071a:	8d 45 14             	lea    0x14(%ebp),%eax
  80071d:	e8 39 fd ff ff       	call   80045b <getint>
  800722:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800725:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800728:	85 d2                	test   %edx,%edx
  80072a:	78 0b                	js     800737 <vprintfmt+0x276>
  80072c:	89 d1                	mov    %edx,%ecx
  80072e:	89 c2                	mov    %eax,%edx
  800730:	bf 0a 00 00 00       	mov    $0xa,%edi
  800735:	eb 32                	jmp    800769 <vprintfmt+0x2a8>
  800737:	83 ec 08             	sub    $0x8,%esp
  80073a:	56                   	push   %esi
  80073b:	6a 2d                	push   $0x2d
  80073d:	ff d3                	call   *%ebx
  80073f:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800742:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800745:	f7 da                	neg    %edx
  800747:	83 d1 00             	adc    $0x0,%ecx
  80074a:	f7 d9                	neg    %ecx
  80074c:	83 c4 10             	add    $0x10,%esp
  80074f:	bf 0a 00 00 00       	mov    $0xa,%edi
  800754:	eb 13                	jmp    800769 <vprintfmt+0x2a8>
  800756:	89 ca                	mov    %ecx,%edx
  800758:	8d 45 14             	lea    0x14(%ebp),%eax
  80075b:	e8 c7 fc ff ff       	call   800427 <getuint>
  800760:	89 d1                	mov    %edx,%ecx
  800762:	89 c2                	mov    %eax,%edx
  800764:	bf 0a 00 00 00       	mov    $0xa,%edi
  800769:	83 ec 0c             	sub    $0xc,%esp
  80076c:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800770:	50                   	push   %eax
  800771:	ff 75 e0             	push   -0x20(%ebp)
  800774:	57                   	push   %edi
  800775:	51                   	push   %ecx
  800776:	52                   	push   %edx
  800777:	89 f2                	mov    %esi,%edx
  800779:	89 d8                	mov    %ebx,%eax
  80077b:	e8 fe fb ff ff       	call   80037e <printnum>
  800780:	83 c4 20             	add    $0x20,%esp
  800783:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800786:	e9 54 fd ff ff       	jmp    8004df <vprintfmt+0x1e>
  80078b:	89 ca                	mov    %ecx,%edx
  80078d:	8d 45 14             	lea    0x14(%ebp),%eax
  800790:	e8 92 fc ff ff       	call   800427 <getuint>
  800795:	89 d1                	mov    %edx,%ecx
  800797:	89 c2                	mov    %eax,%edx
  800799:	bf 08 00 00 00       	mov    $0x8,%edi
  80079e:	eb c9                	jmp    800769 <vprintfmt+0x2a8>
  8007a0:	83 ec 08             	sub    $0x8,%esp
  8007a3:	56                   	push   %esi
  8007a4:	6a 30                	push   $0x30
  8007a6:	ff d3                	call   *%ebx
  8007a8:	83 c4 08             	add    $0x8,%esp
  8007ab:	56                   	push   %esi
  8007ac:	6a 78                	push   $0x78
  8007ae:	ff d3                	call   *%ebx
  8007b0:	8b 45 14             	mov    0x14(%ebp),%eax
  8007b3:	8d 50 04             	lea    0x4(%eax),%edx
  8007b6:	89 55 14             	mov    %edx,0x14(%ebp)
  8007b9:	8b 10                	mov    (%eax),%edx
  8007bb:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007c0:	83 c4 10             	add    $0x10,%esp
  8007c3:	bf 10 00 00 00       	mov    $0x10,%edi
  8007c8:	eb 9f                	jmp    800769 <vprintfmt+0x2a8>
  8007ca:	89 ca                	mov    %ecx,%edx
  8007cc:	8d 45 14             	lea    0x14(%ebp),%eax
  8007cf:	e8 53 fc ff ff       	call   800427 <getuint>
  8007d4:	89 d1                	mov    %edx,%ecx
  8007d6:	89 c2                	mov    %eax,%edx
  8007d8:	bf 10 00 00 00       	mov    $0x10,%edi
  8007dd:	eb 8a                	jmp    800769 <vprintfmt+0x2a8>
  8007df:	83 ec 08             	sub    $0x8,%esp
  8007e2:	56                   	push   %esi
  8007e3:	6a 25                	push   $0x25
  8007e5:	ff d3                	call   *%ebx
  8007e7:	83 c4 10             	add    $0x10,%esp
  8007ea:	eb 97                	jmp    800783 <vprintfmt+0x2c2>
  8007ec:	83 ec 08             	sub    $0x8,%esp
  8007ef:	56                   	push   %esi
  8007f0:	6a 25                	push   $0x25
  8007f2:	ff d3                	call   *%ebx
  8007f4:	83 c4 10             	add    $0x10,%esp
  8007f7:	89 f8                	mov    %edi,%eax
  8007f9:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  8007fd:	74 05                	je     800804 <vprintfmt+0x343>
  8007ff:	83 e8 01             	sub    $0x1,%eax
  800802:	eb f5                	jmp    8007f9 <vprintfmt+0x338>
  800804:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800807:	e9 77 ff ff ff       	jmp    800783 <vprintfmt+0x2c2>

0080080c <vsnprintf>:
  80080c:	55                   	push   %ebp
  80080d:	89 e5                	mov    %esp,%ebp
  80080f:	83 ec 18             	sub    $0x18,%esp
  800812:	8b 45 08             	mov    0x8(%ebp),%eax
  800815:	8b 55 0c             	mov    0xc(%ebp),%edx
  800818:	89 45 ec             	mov    %eax,-0x14(%ebp)
  80081b:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  80081f:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800822:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800829:	85 c0                	test   %eax,%eax
  80082b:	74 26                	je     800853 <vsnprintf+0x47>
  80082d:	85 d2                	test   %edx,%edx
  80082f:	7e 22                	jle    800853 <vsnprintf+0x47>
  800831:	ff 75 14             	push   0x14(%ebp)
  800834:	ff 75 10             	push   0x10(%ebp)
  800837:	8d 45 ec             	lea    -0x14(%ebp),%eax
  80083a:	50                   	push   %eax
  80083b:	68 87 04 80 00       	push   $0x800487
  800840:	e8 7c fc ff ff       	call   8004c1 <vprintfmt>
  800845:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800848:	c6 00 00             	movb   $0x0,(%eax)
  80084b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  80084e:	83 c4 10             	add    $0x10,%esp
  800851:	c9                   	leave
  800852:	c3                   	ret
  800853:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800858:	eb f7                	jmp    800851 <vsnprintf+0x45>

0080085a <snprintf>:
  80085a:	55                   	push   %ebp
  80085b:	89 e5                	mov    %esp,%ebp
  80085d:	83 ec 08             	sub    $0x8,%esp
  800860:	8d 45 14             	lea    0x14(%ebp),%eax
  800863:	50                   	push   %eax
  800864:	ff 75 10             	push   0x10(%ebp)
  800867:	ff 75 0c             	push   0xc(%ebp)
  80086a:	ff 75 08             	push   0x8(%ebp)
  80086d:	e8 9a ff ff ff       	call   80080c <vsnprintf>
  800872:	c9                   	leave
  800873:	c3                   	ret

00800874 <strlen>:
  800874:	55                   	push   %ebp
  800875:	89 e5                	mov    %esp,%ebp
  800877:	8b 55 08             	mov    0x8(%ebp),%edx
  80087a:	b8 00 00 00 00       	mov    $0x0,%eax
  80087f:	eb 03                	jmp    800884 <strlen+0x10>
  800881:	83 c0 01             	add    $0x1,%eax
  800884:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800888:	75 f7                	jne    800881 <strlen+0xd>
  80088a:	5d                   	pop    %ebp
  80088b:	c3                   	ret

0080088c <strnlen>:
  80088c:	55                   	push   %ebp
  80088d:	89 e5                	mov    %esp,%ebp
  80088f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800892:	8b 55 0c             	mov    0xc(%ebp),%edx
  800895:	b8 00 00 00 00       	mov    $0x0,%eax
  80089a:	eb 03                	jmp    80089f <strnlen+0x13>
  80089c:	83 c0 01             	add    $0x1,%eax
  80089f:	39 d0                	cmp    %edx,%eax
  8008a1:	74 08                	je     8008ab <strnlen+0x1f>
  8008a3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8008a7:	75 f3                	jne    80089c <strnlen+0x10>
  8008a9:	89 c2                	mov    %eax,%edx
  8008ab:	89 d0                	mov    %edx,%eax
  8008ad:	5d                   	pop    %ebp
  8008ae:	c3                   	ret

008008af <strcpy>:
  8008af:	55                   	push   %ebp
  8008b0:	89 e5                	mov    %esp,%ebp
  8008b2:	53                   	push   %ebx
  8008b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008b6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8008b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8008be:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8008c2:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8008c5:	83 c0 01             	add    $0x1,%eax
  8008c8:	84 d2                	test   %dl,%dl
  8008ca:	75 f2                	jne    8008be <strcpy+0xf>
  8008cc:	89 c8                	mov    %ecx,%eax
  8008ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008d1:	c9                   	leave
  8008d2:	c3                   	ret

008008d3 <strcat>:
  8008d3:	55                   	push   %ebp
  8008d4:	89 e5                	mov    %esp,%ebp
  8008d6:	53                   	push   %ebx
  8008d7:	83 ec 10             	sub    $0x10,%esp
  8008da:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8008dd:	53                   	push   %ebx
  8008de:	e8 91 ff ff ff       	call   800874 <strlen>
  8008e3:	83 c4 08             	add    $0x8,%esp
  8008e6:	ff 75 0c             	push   0xc(%ebp)
  8008e9:	01 d8                	add    %ebx,%eax
  8008eb:	50                   	push   %eax
  8008ec:	e8 be ff ff ff       	call   8008af <strcpy>
  8008f1:	89 d8                	mov    %ebx,%eax
  8008f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008f6:	c9                   	leave
  8008f7:	c3                   	ret

008008f8 <strncpy>:
  8008f8:	55                   	push   %ebp
  8008f9:	89 e5                	mov    %esp,%ebp
  8008fb:	56                   	push   %esi
  8008fc:	53                   	push   %ebx
  8008fd:	8b 75 08             	mov    0x8(%ebp),%esi
  800900:	8b 55 0c             	mov    0xc(%ebp),%edx
  800903:	89 f3                	mov    %esi,%ebx
  800905:	03 5d 10             	add    0x10(%ebp),%ebx
  800908:	89 f0                	mov    %esi,%eax
  80090a:	eb 0f                	jmp    80091b <strncpy+0x23>
  80090c:	83 c0 01             	add    $0x1,%eax
  80090f:	0f b6 0a             	movzbl (%edx),%ecx
  800912:	88 48 ff             	mov    %cl,-0x1(%eax)
  800915:	80 f9 01             	cmp    $0x1,%cl
  800918:	83 da ff             	sbb    $0xffffffff,%edx
  80091b:	39 d8                	cmp    %ebx,%eax
  80091d:	75 ed                	jne    80090c <strncpy+0x14>
  80091f:	89 f0                	mov    %esi,%eax
  800921:	5b                   	pop    %ebx
  800922:	5e                   	pop    %esi
  800923:	5d                   	pop    %ebp
  800924:	c3                   	ret

00800925 <strlcpy>:
  800925:	55                   	push   %ebp
  800926:	89 e5                	mov    %esp,%ebp
  800928:	56                   	push   %esi
  800929:	53                   	push   %ebx
  80092a:	8b 75 08             	mov    0x8(%ebp),%esi
  80092d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800930:	8b 55 10             	mov    0x10(%ebp),%edx
  800933:	89 f0                	mov    %esi,%eax
  800935:	85 d2                	test   %edx,%edx
  800937:	74 21                	je     80095a <strlcpy+0x35>
  800939:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  80093d:	89 f2                	mov    %esi,%edx
  80093f:	eb 09                	jmp    80094a <strlcpy+0x25>
  800941:	83 c1 01             	add    $0x1,%ecx
  800944:	83 c2 01             	add    $0x1,%edx
  800947:	88 5a ff             	mov    %bl,-0x1(%edx)
  80094a:	39 c2                	cmp    %eax,%edx
  80094c:	74 09                	je     800957 <strlcpy+0x32>
  80094e:	0f b6 19             	movzbl (%ecx),%ebx
  800951:	84 db                	test   %bl,%bl
  800953:	75 ec                	jne    800941 <strlcpy+0x1c>
  800955:	89 d0                	mov    %edx,%eax
  800957:	c6 00 00             	movb   $0x0,(%eax)
  80095a:	29 f0                	sub    %esi,%eax
  80095c:	5b                   	pop    %ebx
  80095d:	5e                   	pop    %esi
  80095e:	5d                   	pop    %ebp
  80095f:	c3                   	ret

00800960 <strcmp>:
  800960:	55                   	push   %ebp
  800961:	89 e5                	mov    %esp,%ebp
  800963:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800966:	8b 55 0c             	mov    0xc(%ebp),%edx
  800969:	eb 06                	jmp    800971 <strcmp+0x11>
  80096b:	83 c1 01             	add    $0x1,%ecx
  80096e:	83 c2 01             	add    $0x1,%edx
  800971:	0f b6 01             	movzbl (%ecx),%eax
  800974:	84 c0                	test   %al,%al
  800976:	74 04                	je     80097c <strcmp+0x1c>
  800978:	3a 02                	cmp    (%edx),%al
  80097a:	74 ef                	je     80096b <strcmp+0xb>
  80097c:	0f b6 c0             	movzbl %al,%eax
  80097f:	0f b6 12             	movzbl (%edx),%edx
  800982:	29 d0                	sub    %edx,%eax
  800984:	5d                   	pop    %ebp
  800985:	c3                   	ret

00800986 <strncmp>:
  800986:	55                   	push   %ebp
  800987:	89 e5                	mov    %esp,%ebp
  800989:	53                   	push   %ebx
  80098a:	8b 45 08             	mov    0x8(%ebp),%eax
  80098d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800990:	8b 55 10             	mov    0x10(%ebp),%edx
  800993:	eb 09                	jmp    80099e <strncmp+0x18>
  800995:	83 ea 01             	sub    $0x1,%edx
  800998:	83 c0 01             	add    $0x1,%eax
  80099b:	83 c1 01             	add    $0x1,%ecx
  80099e:	85 d2                	test   %edx,%edx
  8009a0:	74 18                	je     8009ba <strncmp+0x34>
  8009a2:	0f b6 18             	movzbl (%eax),%ebx
  8009a5:	84 db                	test   %bl,%bl
  8009a7:	74 04                	je     8009ad <strncmp+0x27>
  8009a9:	3a 19                	cmp    (%ecx),%bl
  8009ab:	74 e8                	je     800995 <strncmp+0xf>
  8009ad:	0f b6 00             	movzbl (%eax),%eax
  8009b0:	0f b6 11             	movzbl (%ecx),%edx
  8009b3:	29 d0                	sub    %edx,%eax
  8009b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8009b8:	c9                   	leave
  8009b9:	c3                   	ret
  8009ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8009bf:	eb f4                	jmp    8009b5 <strncmp+0x2f>

008009c1 <strchr>:
  8009c1:	55                   	push   %ebp
  8009c2:	89 e5                	mov    %esp,%ebp
  8009c4:	8b 45 08             	mov    0x8(%ebp),%eax
  8009c7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009cb:	eb 03                	jmp    8009d0 <strchr+0xf>
  8009cd:	83 c0 01             	add    $0x1,%eax
  8009d0:	0f b6 10             	movzbl (%eax),%edx
  8009d3:	84 d2                	test   %dl,%dl
  8009d5:	74 06                	je     8009dd <strchr+0x1c>
  8009d7:	38 ca                	cmp    %cl,%dl
  8009d9:	75 f2                	jne    8009cd <strchr+0xc>
  8009db:	eb 05                	jmp    8009e2 <strchr+0x21>
  8009dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8009e2:	5d                   	pop    %ebp
  8009e3:	c3                   	ret

008009e4 <strfind>:
  8009e4:	55                   	push   %ebp
  8009e5:	89 e5                	mov    %esp,%ebp
  8009e7:	8b 45 08             	mov    0x8(%ebp),%eax
  8009ea:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009ee:	0f b6 10             	movzbl (%eax),%edx
  8009f1:	38 ca                	cmp    %cl,%dl
  8009f3:	74 09                	je     8009fe <strfind+0x1a>
  8009f5:	84 d2                	test   %dl,%dl
  8009f7:	74 05                	je     8009fe <strfind+0x1a>
  8009f9:	83 c0 01             	add    $0x1,%eax
  8009fc:	eb f0                	jmp    8009ee <strfind+0xa>
  8009fe:	5d                   	pop    %ebp
  8009ff:	c3                   	ret

00800a00 <memset>:
  800a00:	55                   	push   %ebp
  800a01:	89 e5                	mov    %esp,%ebp
  800a03:	57                   	push   %edi
  800a04:	8b 55 08             	mov    0x8(%ebp),%edx
  800a07:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a0a:	85 c9                	test   %ecx,%ecx
  800a0c:	74 24                	je     800a32 <memset+0x32>
  800a0e:	89 d0                	mov    %edx,%eax
  800a10:	09 c8                	or     %ecx,%eax
  800a12:	a8 03                	test   $0x3,%al
  800a14:	75 14                	jne    800a2a <memset+0x2a>
  800a16:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800a1a:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800a20:	c1 e9 02             	shr    $0x2,%ecx
  800a23:	89 d7                	mov    %edx,%edi
  800a25:	fc                   	cld
  800a26:	f3 ab                	rep stos %eax,%es:(%edi)
  800a28:	eb 08                	jmp    800a32 <memset+0x32>
  800a2a:	89 d7                	mov    %edx,%edi
  800a2c:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a2f:	fc                   	cld
  800a30:	f3 aa                	rep stos %al,%es:(%edi)
  800a32:	89 d0                	mov    %edx,%eax
  800a34:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800a37:	c9                   	leave
  800a38:	c3                   	ret

00800a39 <memmove>:
  800a39:	55                   	push   %ebp
  800a3a:	89 e5                	mov    %esp,%ebp
  800a3c:	57                   	push   %edi
  800a3d:	56                   	push   %esi
  800a3e:	8b 45 08             	mov    0x8(%ebp),%eax
  800a41:	8b 75 0c             	mov    0xc(%ebp),%esi
  800a44:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a47:	39 c6                	cmp    %eax,%esi
  800a49:	73 32                	jae    800a7d <memmove+0x44>
  800a4b:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800a4e:	39 d0                	cmp    %edx,%eax
  800a50:	73 2b                	jae    800a7d <memmove+0x44>
  800a52:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800a55:	89 fe                	mov    %edi,%esi
  800a57:	09 ce                	or     %ecx,%esi
  800a59:	09 d6                	or     %edx,%esi
  800a5b:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800a61:	75 0e                	jne    800a71 <memmove+0x38>
  800a63:	83 ef 04             	sub    $0x4,%edi
  800a66:	8d 72 fc             	lea    -0x4(%edx),%esi
  800a69:	c1 e9 02             	shr    $0x2,%ecx
  800a6c:	fd                   	std
  800a6d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a6f:	eb 09                	jmp    800a7a <memmove+0x41>
  800a71:	83 ef 01             	sub    $0x1,%edi
  800a74:	8d 72 ff             	lea    -0x1(%edx),%esi
  800a77:	fd                   	std
  800a78:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a7a:	fc                   	cld
  800a7b:	eb 1a                	jmp    800a97 <memmove+0x5e>
  800a7d:	89 c2                	mov    %eax,%edx
  800a7f:	09 ca                	or     %ecx,%edx
  800a81:	09 f2                	or     %esi,%edx
  800a83:	f6 c2 03             	test   $0x3,%dl
  800a86:	75 0a                	jne    800a92 <memmove+0x59>
  800a88:	c1 e9 02             	shr    $0x2,%ecx
  800a8b:	89 c7                	mov    %eax,%edi
  800a8d:	fc                   	cld
  800a8e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a90:	eb 05                	jmp    800a97 <memmove+0x5e>
  800a92:	89 c7                	mov    %eax,%edi
  800a94:	fc                   	cld
  800a95:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a97:	5e                   	pop    %esi
  800a98:	5f                   	pop    %edi
  800a99:	5d                   	pop    %ebp
  800a9a:	c3                   	ret

00800a9b <memcpy>:
  800a9b:	55                   	push   %ebp
  800a9c:	89 e5                	mov    %esp,%ebp
  800a9e:	83 ec 0c             	sub    $0xc,%esp
  800aa1:	ff 75 10             	push   0x10(%ebp)
  800aa4:	ff 75 0c             	push   0xc(%ebp)
  800aa7:	ff 75 08             	push   0x8(%ebp)
  800aaa:	e8 8a ff ff ff       	call   800a39 <memmove>
  800aaf:	c9                   	leave
  800ab0:	c3                   	ret

00800ab1 <memcmp>:
  800ab1:	55                   	push   %ebp
  800ab2:	89 e5                	mov    %esp,%ebp
  800ab4:	56                   	push   %esi
  800ab5:	53                   	push   %ebx
  800ab6:	8b 45 08             	mov    0x8(%ebp),%eax
  800ab9:	8b 55 0c             	mov    0xc(%ebp),%edx
  800abc:	89 c6                	mov    %eax,%esi
  800abe:	03 75 10             	add    0x10(%ebp),%esi
  800ac1:	eb 06                	jmp    800ac9 <memcmp+0x18>
  800ac3:	83 c0 01             	add    $0x1,%eax
  800ac6:	83 c2 01             	add    $0x1,%edx
  800ac9:	39 f0                	cmp    %esi,%eax
  800acb:	74 14                	je     800ae1 <memcmp+0x30>
  800acd:	0f b6 08             	movzbl (%eax),%ecx
  800ad0:	0f b6 1a             	movzbl (%edx),%ebx
  800ad3:	38 d9                	cmp    %bl,%cl
  800ad5:	74 ec                	je     800ac3 <memcmp+0x12>
  800ad7:	0f b6 c1             	movzbl %cl,%eax
  800ada:	0f b6 db             	movzbl %bl,%ebx
  800add:	29 d8                	sub    %ebx,%eax
  800adf:	eb 05                	jmp    800ae6 <memcmp+0x35>
  800ae1:	b8 00 00 00 00       	mov    $0x0,%eax
  800ae6:	5b                   	pop    %ebx
  800ae7:	5e                   	pop    %esi
  800ae8:	5d                   	pop    %ebp
  800ae9:	c3                   	ret

00800aea <memfind>:
  800aea:	55                   	push   %ebp
  800aeb:	89 e5                	mov    %esp,%ebp
  800aed:	8b 45 08             	mov    0x8(%ebp),%eax
  800af0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800af3:	89 c2                	mov    %eax,%edx
  800af5:	03 55 10             	add    0x10(%ebp),%edx
  800af8:	eb 03                	jmp    800afd <memfind+0x13>
  800afa:	83 c0 01             	add    $0x1,%eax
  800afd:	39 d0                	cmp    %edx,%eax
  800aff:	73 04                	jae    800b05 <memfind+0x1b>
  800b01:	38 08                	cmp    %cl,(%eax)
  800b03:	75 f5                	jne    800afa <memfind+0x10>
  800b05:	5d                   	pop    %ebp
  800b06:	c3                   	ret

00800b07 <strtol>:
  800b07:	55                   	push   %ebp
  800b08:	89 e5                	mov    %esp,%ebp
  800b0a:	57                   	push   %edi
  800b0b:	56                   	push   %esi
  800b0c:	53                   	push   %ebx
  800b0d:	8b 55 08             	mov    0x8(%ebp),%edx
  800b10:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800b13:	eb 03                	jmp    800b18 <strtol+0x11>
  800b15:	83 c2 01             	add    $0x1,%edx
  800b18:	0f b6 02             	movzbl (%edx),%eax
  800b1b:	3c 20                	cmp    $0x20,%al
  800b1d:	74 f6                	je     800b15 <strtol+0xe>
  800b1f:	3c 09                	cmp    $0x9,%al
  800b21:	74 f2                	je     800b15 <strtol+0xe>
  800b23:	3c 2b                	cmp    $0x2b,%al
  800b25:	74 2a                	je     800b51 <strtol+0x4a>
  800b27:	bf 00 00 00 00       	mov    $0x0,%edi
  800b2c:	3c 2d                	cmp    $0x2d,%al
  800b2e:	74 2b                	je     800b5b <strtol+0x54>
  800b30:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800b36:	75 0f                	jne    800b47 <strtol+0x40>
  800b38:	80 3a 30             	cmpb   $0x30,(%edx)
  800b3b:	74 28                	je     800b65 <strtol+0x5e>
  800b3d:	85 db                	test   %ebx,%ebx
  800b3f:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b44:	0f 44 d8             	cmove  %eax,%ebx
  800b47:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b4c:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800b4f:	eb 46                	jmp    800b97 <strtol+0x90>
  800b51:	83 c2 01             	add    $0x1,%edx
  800b54:	bf 00 00 00 00       	mov    $0x0,%edi
  800b59:	eb d5                	jmp    800b30 <strtol+0x29>
  800b5b:	83 c2 01             	add    $0x1,%edx
  800b5e:	bf 01 00 00 00       	mov    $0x1,%edi
  800b63:	eb cb                	jmp    800b30 <strtol+0x29>
  800b65:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800b69:	74 0e                	je     800b79 <strtol+0x72>
  800b6b:	85 db                	test   %ebx,%ebx
  800b6d:	75 d8                	jne    800b47 <strtol+0x40>
  800b6f:	83 c2 01             	add    $0x1,%edx
  800b72:	bb 08 00 00 00       	mov    $0x8,%ebx
  800b77:	eb ce                	jmp    800b47 <strtol+0x40>
  800b79:	83 c2 02             	add    $0x2,%edx
  800b7c:	bb 10 00 00 00       	mov    $0x10,%ebx
  800b81:	eb c4                	jmp    800b47 <strtol+0x40>
  800b83:	0f be c0             	movsbl %al,%eax
  800b86:	83 e8 30             	sub    $0x30,%eax
  800b89:	3b 45 10             	cmp    0x10(%ebp),%eax
  800b8c:	7d 3a                	jge    800bc8 <strtol+0xc1>
  800b8e:	83 c2 01             	add    $0x1,%edx
  800b91:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800b95:	01 c1                	add    %eax,%ecx
  800b97:	0f b6 02             	movzbl (%edx),%eax
  800b9a:	8d 70 d0             	lea    -0x30(%eax),%esi
  800b9d:	89 f3                	mov    %esi,%ebx
  800b9f:	80 fb 09             	cmp    $0x9,%bl
  800ba2:	76 df                	jbe    800b83 <strtol+0x7c>
  800ba4:	8d 70 9f             	lea    -0x61(%eax),%esi
  800ba7:	89 f3                	mov    %esi,%ebx
  800ba9:	80 fb 19             	cmp    $0x19,%bl
  800bac:	77 08                	ja     800bb6 <strtol+0xaf>
  800bae:	0f be c0             	movsbl %al,%eax
  800bb1:	83 e8 57             	sub    $0x57,%eax
  800bb4:	eb d3                	jmp    800b89 <strtol+0x82>
  800bb6:	8d 70 bf             	lea    -0x41(%eax),%esi
  800bb9:	89 f3                	mov    %esi,%ebx
  800bbb:	80 fb 19             	cmp    $0x19,%bl
  800bbe:	77 08                	ja     800bc8 <strtol+0xc1>
  800bc0:	0f be c0             	movsbl %al,%eax
  800bc3:	83 e8 37             	sub    $0x37,%eax
  800bc6:	eb c1                	jmp    800b89 <strtol+0x82>
  800bc8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800bcc:	74 05                	je     800bd3 <strtol+0xcc>
  800bce:	8b 45 0c             	mov    0xc(%ebp),%eax
  800bd1:	89 10                	mov    %edx,(%eax)
  800bd3:	89 c8                	mov    %ecx,%eax
  800bd5:	f7 d8                	neg    %eax
  800bd7:	85 ff                	test   %edi,%edi
  800bd9:	0f 45 c8             	cmovne %eax,%ecx
  800bdc:	89 c8                	mov    %ecx,%eax
  800bde:	5b                   	pop    %ebx
  800bdf:	5e                   	pop    %esi
  800be0:	5f                   	pop    %edi
  800be1:	5d                   	pop    %ebp
  800be2:	c3                   	ret
  800be3:	66 90                	xchg   %ax,%ax
  800be5:	66 90                	xchg   %ax,%ax
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
