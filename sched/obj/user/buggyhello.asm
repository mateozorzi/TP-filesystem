
obj/user/buggyhello:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 16 00 00 00       	call   800047 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 10             	sub    $0x10,%esp
  800039:	6a 01                	push   $0x1
  80003b:	6a 01                	push   $0x1
  80003d:	e8 ad 00 00 00       	call   8000ef <sys_cputs>
  800042:	83 c4 10             	add    $0x10,%esp
  800045:	c9                   	leave
  800046:	c3                   	ret

00800047 <libmain>:
  800047:	55                   	push   %ebp
  800048:	89 e5                	mov    %esp,%ebp
  80004a:	56                   	push   %esi
  80004b:	53                   	push   %ebx
  80004c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80004f:	8b 75 0c             	mov    0xc(%ebp),%esi
  800052:	e8 04 01 00 00       	call   80015b <sys_getenvid>
  800057:	85 c0                	test   %eax,%eax
  800059:	78 15                	js     800070 <libmain+0x29>
  80005b:	25 ff 03 00 00       	and    $0x3ff,%eax
  800060:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800066:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  80006b:	a3 04 20 80 00       	mov    %eax,0x802004
  800070:	85 db                	test   %ebx,%ebx
  800072:	7e 07                	jle    80007b <libmain+0x34>
  800074:	8b 06                	mov    (%esi),%eax
  800076:	a3 00 20 80 00       	mov    %eax,0x802000
  80007b:	83 ec 08             	sub    $0x8,%esp
  80007e:	56                   	push   %esi
  80007f:	53                   	push   %ebx
  800080:	e8 ae ff ff ff       	call   800033 <umain>
  800085:	e8 0a 00 00 00       	call   800094 <exit>
  80008a:	83 c4 10             	add    $0x10,%esp
  80008d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800090:	5b                   	pop    %ebx
  800091:	5e                   	pop    %esi
  800092:	5d                   	pop    %ebp
  800093:	c3                   	ret

00800094 <exit>:
  800094:	55                   	push   %ebp
  800095:	89 e5                	mov    %esp,%ebp
  800097:	83 ec 14             	sub    $0x14,%esp
  80009a:	6a 00                	push   $0x0
  80009c:	e8 98 00 00 00       	call   800139 <sys_env_destroy>
  8000a1:	83 c4 10             	add    $0x10,%esp
  8000a4:	c9                   	leave
  8000a5:	c3                   	ret

008000a6 <syscall>:
  8000a6:	55                   	push   %ebp
  8000a7:	89 e5                	mov    %esp,%ebp
  8000a9:	57                   	push   %edi
  8000aa:	56                   	push   %esi
  8000ab:	53                   	push   %ebx
  8000ac:	83 ec 1c             	sub    $0x1c,%esp
  8000af:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8000b2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8000b5:	89 ca                	mov    %ecx,%edx
  8000b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000bd:	8b 7d 10             	mov    0x10(%ebp),%edi
  8000c0:	8b 75 14             	mov    0x14(%ebp),%esi
  8000c3:	cd 30                	int    $0x30
  8000c5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8000c9:	74 04                	je     8000cf <syscall+0x29>
  8000cb:	85 c0                	test   %eax,%eax
  8000cd:	7f 08                	jg     8000d7 <syscall+0x31>
  8000cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000d2:	5b                   	pop    %ebx
  8000d3:	5e                   	pop    %esi
  8000d4:	5f                   	pop    %edi
  8000d5:	5d                   	pop    %ebp
  8000d6:	c3                   	ret
  8000d7:	83 ec 0c             	sub    $0xc,%esp
  8000da:	50                   	push   %eax
  8000db:	ff 75 e0             	push   -0x20(%ebp)
  8000de:	68 6a 0e 80 00       	push   $0x800e6a
  8000e3:	6a 1e                	push   $0x1e
  8000e5:	68 87 0e 80 00       	push   $0x800e87
  8000ea:	e8 b1 01 00 00       	call   8002a0 <_panic>

008000ef <sys_cputs>:
  8000ef:	55                   	push   %ebp
  8000f0:	89 e5                	mov    %esp,%ebp
  8000f2:	83 ec 08             	sub    $0x8,%esp
  8000f5:	6a 00                	push   $0x0
  8000f7:	6a 00                	push   $0x0
  8000f9:	6a 00                	push   $0x0
  8000fb:	ff 75 0c             	push   0xc(%ebp)
  8000fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800101:	ba 00 00 00 00       	mov    $0x0,%edx
  800106:	b8 00 00 00 00       	mov    $0x0,%eax
  80010b:	e8 96 ff ff ff       	call   8000a6 <syscall>
  800110:	83 c4 10             	add    $0x10,%esp
  800113:	c9                   	leave
  800114:	c3                   	ret

00800115 <sys_cgetc>:
  800115:	55                   	push   %ebp
  800116:	89 e5                	mov    %esp,%ebp
  800118:	83 ec 08             	sub    $0x8,%esp
  80011b:	6a 00                	push   $0x0
  80011d:	6a 00                	push   $0x0
  80011f:	6a 00                	push   $0x0
  800121:	6a 00                	push   $0x0
  800123:	b9 00 00 00 00       	mov    $0x0,%ecx
  800128:	ba 00 00 00 00       	mov    $0x0,%edx
  80012d:	b8 01 00 00 00       	mov    $0x1,%eax
  800132:	e8 6f ff ff ff       	call   8000a6 <syscall>
  800137:	c9                   	leave
  800138:	c3                   	ret

00800139 <sys_env_destroy>:
  800139:	55                   	push   %ebp
  80013a:	89 e5                	mov    %esp,%ebp
  80013c:	83 ec 08             	sub    $0x8,%esp
  80013f:	6a 00                	push   $0x0
  800141:	6a 00                	push   $0x0
  800143:	6a 00                	push   $0x0
  800145:	6a 00                	push   $0x0
  800147:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80014a:	ba 01 00 00 00       	mov    $0x1,%edx
  80014f:	b8 03 00 00 00       	mov    $0x3,%eax
  800154:	e8 4d ff ff ff       	call   8000a6 <syscall>
  800159:	c9                   	leave
  80015a:	c3                   	ret

0080015b <sys_getenvid>:
  80015b:	55                   	push   %ebp
  80015c:	89 e5                	mov    %esp,%ebp
  80015e:	83 ec 08             	sub    $0x8,%esp
  800161:	6a 00                	push   $0x0
  800163:	6a 00                	push   $0x0
  800165:	6a 00                	push   $0x0
  800167:	6a 00                	push   $0x0
  800169:	b9 00 00 00 00       	mov    $0x0,%ecx
  80016e:	ba 00 00 00 00       	mov    $0x0,%edx
  800173:	b8 02 00 00 00       	mov    $0x2,%eax
  800178:	e8 29 ff ff ff       	call   8000a6 <syscall>
  80017d:	c9                   	leave
  80017e:	c3                   	ret

0080017f <sys_yield>:
  80017f:	55                   	push   %ebp
  800180:	89 e5                	mov    %esp,%ebp
  800182:	83 ec 08             	sub    $0x8,%esp
  800185:	6a 00                	push   $0x0
  800187:	6a 00                	push   $0x0
  800189:	6a 00                	push   $0x0
  80018b:	6a 00                	push   $0x0
  80018d:	b9 00 00 00 00       	mov    $0x0,%ecx
  800192:	ba 00 00 00 00       	mov    $0x0,%edx
  800197:	b8 0a 00 00 00       	mov    $0xa,%eax
  80019c:	e8 05 ff ff ff       	call   8000a6 <syscall>
  8001a1:	83 c4 10             	add    $0x10,%esp
  8001a4:	c9                   	leave
  8001a5:	c3                   	ret

008001a6 <sys_page_alloc>:
  8001a6:	55                   	push   %ebp
  8001a7:	89 e5                	mov    %esp,%ebp
  8001a9:	83 ec 08             	sub    $0x8,%esp
  8001ac:	6a 00                	push   $0x0
  8001ae:	6a 00                	push   $0x0
  8001b0:	ff 75 10             	push   0x10(%ebp)
  8001b3:	ff 75 0c             	push   0xc(%ebp)
  8001b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001b9:	ba 01 00 00 00       	mov    $0x1,%edx
  8001be:	b8 04 00 00 00       	mov    $0x4,%eax
  8001c3:	e8 de fe ff ff       	call   8000a6 <syscall>
  8001c8:	c9                   	leave
  8001c9:	c3                   	ret

008001ca <sys_page_map>:
  8001ca:	55                   	push   %ebp
  8001cb:	89 e5                	mov    %esp,%ebp
  8001cd:	83 ec 08             	sub    $0x8,%esp
  8001d0:	ff 75 18             	push   0x18(%ebp)
  8001d3:	ff 75 14             	push   0x14(%ebp)
  8001d6:	ff 75 10             	push   0x10(%ebp)
  8001d9:	ff 75 0c             	push   0xc(%ebp)
  8001dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001df:	ba 01 00 00 00       	mov    $0x1,%edx
  8001e4:	b8 05 00 00 00       	mov    $0x5,%eax
  8001e9:	e8 b8 fe ff ff       	call   8000a6 <syscall>
  8001ee:	c9                   	leave
  8001ef:	c3                   	ret

008001f0 <sys_page_unmap>:
  8001f0:	55                   	push   %ebp
  8001f1:	89 e5                	mov    %esp,%ebp
  8001f3:	83 ec 08             	sub    $0x8,%esp
  8001f6:	6a 00                	push   $0x0
  8001f8:	6a 00                	push   $0x0
  8001fa:	6a 00                	push   $0x0
  8001fc:	ff 75 0c             	push   0xc(%ebp)
  8001ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800202:	ba 01 00 00 00       	mov    $0x1,%edx
  800207:	b8 06 00 00 00       	mov    $0x6,%eax
  80020c:	e8 95 fe ff ff       	call   8000a6 <syscall>
  800211:	c9                   	leave
  800212:	c3                   	ret

00800213 <sys_env_set_status>:
  800213:	55                   	push   %ebp
  800214:	89 e5                	mov    %esp,%ebp
  800216:	83 ec 08             	sub    $0x8,%esp
  800219:	6a 00                	push   $0x0
  80021b:	6a 00                	push   $0x0
  80021d:	6a 00                	push   $0x0
  80021f:	ff 75 0c             	push   0xc(%ebp)
  800222:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800225:	ba 01 00 00 00       	mov    $0x1,%edx
  80022a:	b8 08 00 00 00       	mov    $0x8,%eax
  80022f:	e8 72 fe ff ff       	call   8000a6 <syscall>
  800234:	c9                   	leave
  800235:	c3                   	ret

00800236 <sys_env_set_pgfault_upcall>:
  800236:	55                   	push   %ebp
  800237:	89 e5                	mov    %esp,%ebp
  800239:	83 ec 08             	sub    $0x8,%esp
  80023c:	6a 00                	push   $0x0
  80023e:	6a 00                	push   $0x0
  800240:	6a 00                	push   $0x0
  800242:	ff 75 0c             	push   0xc(%ebp)
  800245:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800248:	ba 01 00 00 00       	mov    $0x1,%edx
  80024d:	b8 09 00 00 00       	mov    $0x9,%eax
  800252:	e8 4f fe ff ff       	call   8000a6 <syscall>
  800257:	c9                   	leave
  800258:	c3                   	ret

00800259 <sys_ipc_try_send>:
  800259:	55                   	push   %ebp
  80025a:	89 e5                	mov    %esp,%ebp
  80025c:	83 ec 08             	sub    $0x8,%esp
  80025f:	6a 00                	push   $0x0
  800261:	ff 75 14             	push   0x14(%ebp)
  800264:	ff 75 10             	push   0x10(%ebp)
  800267:	ff 75 0c             	push   0xc(%ebp)
  80026a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80026d:	ba 00 00 00 00       	mov    $0x0,%edx
  800272:	b8 0c 00 00 00       	mov    $0xc,%eax
  800277:	e8 2a fe ff ff       	call   8000a6 <syscall>
  80027c:	c9                   	leave
  80027d:	c3                   	ret

0080027e <sys_ipc_recv>:
  80027e:	55                   	push   %ebp
  80027f:	89 e5                	mov    %esp,%ebp
  800281:	83 ec 08             	sub    $0x8,%esp
  800284:	6a 00                	push   $0x0
  800286:	6a 00                	push   $0x0
  800288:	6a 00                	push   $0x0
  80028a:	6a 00                	push   $0x0
  80028c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80028f:	ba 01 00 00 00       	mov    $0x1,%edx
  800294:	b8 0d 00 00 00       	mov    $0xd,%eax
  800299:	e8 08 fe ff ff       	call   8000a6 <syscall>
  80029e:	c9                   	leave
  80029f:	c3                   	ret

008002a0 <_panic>:
  8002a0:	55                   	push   %ebp
  8002a1:	89 e5                	mov    %esp,%ebp
  8002a3:	56                   	push   %esi
  8002a4:	53                   	push   %ebx
  8002a5:	8d 5d 14             	lea    0x14(%ebp),%ebx
  8002a8:	8b 35 00 20 80 00    	mov    0x802000,%esi
  8002ae:	e8 a8 fe ff ff       	call   80015b <sys_getenvid>
  8002b3:	83 ec 0c             	sub    $0xc,%esp
  8002b6:	ff 75 0c             	push   0xc(%ebp)
  8002b9:	ff 75 08             	push   0x8(%ebp)
  8002bc:	56                   	push   %esi
  8002bd:	50                   	push   %eax
  8002be:	68 50 0f 80 00       	push   $0x800f50
  8002c3:	e8 b3 00 00 00       	call   80037b <cprintf>
  8002c8:	83 c4 18             	add    $0x18,%esp
  8002cb:	53                   	push   %ebx
  8002cc:	ff 75 10             	push   0x10(%ebp)
  8002cf:	e8 56 00 00 00       	call   80032a <vcprintf>
  8002d4:	c7 04 24 95 0e 80 00 	movl   $0x800e95,(%esp)
  8002db:	e8 9b 00 00 00       	call   80037b <cprintf>
  8002e0:	83 c4 10             	add    $0x10,%esp
  8002e3:	cc                   	int3
  8002e4:	eb fd                	jmp    8002e3 <_panic+0x43>

008002e6 <putch>:
  8002e6:	55                   	push   %ebp
  8002e7:	89 e5                	mov    %esp,%ebp
  8002e9:	53                   	push   %ebx
  8002ea:	83 ec 04             	sub    $0x4,%esp
  8002ed:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8002f0:	8b 13                	mov    (%ebx),%edx
  8002f2:	8d 42 01             	lea    0x1(%edx),%eax
  8002f5:	89 03                	mov    %eax,(%ebx)
  8002f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8002fa:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8002fe:	3d ff 00 00 00       	cmp    $0xff,%eax
  800303:	74 09                	je     80030e <putch+0x28>
  800305:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800309:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80030c:	c9                   	leave
  80030d:	c3                   	ret
  80030e:	83 ec 08             	sub    $0x8,%esp
  800311:	68 ff 00 00 00       	push   $0xff
  800316:	8d 43 08             	lea    0x8(%ebx),%eax
  800319:	50                   	push   %eax
  80031a:	e8 d0 fd ff ff       	call   8000ef <sys_cputs>
  80031f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800325:	83 c4 10             	add    $0x10,%esp
  800328:	eb db                	jmp    800305 <putch+0x1f>

0080032a <vcprintf>:
  80032a:	55                   	push   %ebp
  80032b:	89 e5                	mov    %esp,%ebp
  80032d:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800333:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  80033a:	00 00 00 
  80033d:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800344:	00 00 00 
  800347:	ff 75 0c             	push   0xc(%ebp)
  80034a:	ff 75 08             	push   0x8(%ebp)
  80034d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800353:	50                   	push   %eax
  800354:	68 e6 02 80 00       	push   $0x8002e6
  800359:	e8 74 01 00 00       	call   8004d2 <vprintfmt>
  80035e:	83 c4 08             	add    $0x8,%esp
  800361:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800367:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  80036d:	50                   	push   %eax
  80036e:	e8 7c fd ff ff       	call   8000ef <sys_cputs>
  800373:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800379:	c9                   	leave
  80037a:	c3                   	ret

0080037b <cprintf>:
  80037b:	55                   	push   %ebp
  80037c:	89 e5                	mov    %esp,%ebp
  80037e:	83 ec 10             	sub    $0x10,%esp
  800381:	8d 45 0c             	lea    0xc(%ebp),%eax
  800384:	50                   	push   %eax
  800385:	ff 75 08             	push   0x8(%ebp)
  800388:	e8 9d ff ff ff       	call   80032a <vcprintf>
  80038d:	c9                   	leave
  80038e:	c3                   	ret

0080038f <printnum>:
  80038f:	55                   	push   %ebp
  800390:	89 e5                	mov    %esp,%ebp
  800392:	57                   	push   %edi
  800393:	56                   	push   %esi
  800394:	53                   	push   %ebx
  800395:	83 ec 1c             	sub    $0x1c,%esp
  800398:	89 c7                	mov    %eax,%edi
  80039a:	89 d6                	mov    %edx,%esi
  80039c:	8b 45 08             	mov    0x8(%ebp),%eax
  80039f:	8b 55 0c             	mov    0xc(%ebp),%edx
  8003a2:	89 d1                	mov    %edx,%ecx
  8003a4:	89 c2                	mov    %eax,%edx
  8003a6:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8003a9:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8003ac:	8b 45 10             	mov    0x10(%ebp),%eax
  8003af:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8003b2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003b5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8003bc:	39 c2                	cmp    %eax,%edx
  8003be:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8003c1:	72 3e                	jb     800401 <printnum+0x72>
  8003c3:	83 ec 0c             	sub    $0xc,%esp
  8003c6:	ff 75 18             	push   0x18(%ebp)
  8003c9:	83 eb 01             	sub    $0x1,%ebx
  8003cc:	53                   	push   %ebx
  8003cd:	50                   	push   %eax
  8003ce:	83 ec 08             	sub    $0x8,%esp
  8003d1:	ff 75 e4             	push   -0x1c(%ebp)
  8003d4:	ff 75 e0             	push   -0x20(%ebp)
  8003d7:	ff 75 dc             	push   -0x24(%ebp)
  8003da:	ff 75 d8             	push   -0x28(%ebp)
  8003dd:	e8 1e 08 00 00       	call   800c00 <__udivdi3>
  8003e2:	83 c4 18             	add    $0x18,%esp
  8003e5:	52                   	push   %edx
  8003e6:	50                   	push   %eax
  8003e7:	89 f2                	mov    %esi,%edx
  8003e9:	89 f8                	mov    %edi,%eax
  8003eb:	e8 9f ff ff ff       	call   80038f <printnum>
  8003f0:	83 c4 20             	add    $0x20,%esp
  8003f3:	eb 13                	jmp    800408 <printnum+0x79>
  8003f5:	83 ec 08             	sub    $0x8,%esp
  8003f8:	56                   	push   %esi
  8003f9:	ff 75 18             	push   0x18(%ebp)
  8003fc:	ff d7                	call   *%edi
  8003fe:	83 c4 10             	add    $0x10,%esp
  800401:	83 eb 01             	sub    $0x1,%ebx
  800404:	85 db                	test   %ebx,%ebx
  800406:	7f ed                	jg     8003f5 <printnum+0x66>
  800408:	83 ec 08             	sub    $0x8,%esp
  80040b:	56                   	push   %esi
  80040c:	83 ec 04             	sub    $0x4,%esp
  80040f:	ff 75 e4             	push   -0x1c(%ebp)
  800412:	ff 75 e0             	push   -0x20(%ebp)
  800415:	ff 75 dc             	push   -0x24(%ebp)
  800418:	ff 75 d8             	push   -0x28(%ebp)
  80041b:	e8 00 09 00 00       	call   800d20 <__umoddi3>
  800420:	83 c4 14             	add    $0x14,%esp
  800423:	0f be 80 97 0e 80 00 	movsbl 0x800e97(%eax),%eax
  80042a:	50                   	push   %eax
  80042b:	ff d7                	call   *%edi
  80042d:	83 c4 10             	add    $0x10,%esp
  800430:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800433:	5b                   	pop    %ebx
  800434:	5e                   	pop    %esi
  800435:	5f                   	pop    %edi
  800436:	5d                   	pop    %ebp
  800437:	c3                   	ret

00800438 <getuint>:
  800438:	83 fa 01             	cmp    $0x1,%edx
  80043b:	7f 13                	jg     800450 <getuint+0x18>
  80043d:	85 d2                	test   %edx,%edx
  80043f:	74 1c                	je     80045d <getuint+0x25>
  800441:	8b 10                	mov    (%eax),%edx
  800443:	8d 4a 04             	lea    0x4(%edx),%ecx
  800446:	89 08                	mov    %ecx,(%eax)
  800448:	8b 02                	mov    (%edx),%eax
  80044a:	ba 00 00 00 00       	mov    $0x0,%edx
  80044f:	c3                   	ret
  800450:	8b 10                	mov    (%eax),%edx
  800452:	8d 4a 08             	lea    0x8(%edx),%ecx
  800455:	89 08                	mov    %ecx,(%eax)
  800457:	8b 02                	mov    (%edx),%eax
  800459:	8b 52 04             	mov    0x4(%edx),%edx
  80045c:	c3                   	ret
  80045d:	8b 10                	mov    (%eax),%edx
  80045f:	8d 4a 04             	lea    0x4(%edx),%ecx
  800462:	89 08                	mov    %ecx,(%eax)
  800464:	8b 02                	mov    (%edx),%eax
  800466:	ba 00 00 00 00       	mov    $0x0,%edx
  80046b:	c3                   	ret

0080046c <getint>:
  80046c:	83 fa 01             	cmp    $0x1,%edx
  80046f:	7f 0f                	jg     800480 <getint+0x14>
  800471:	85 d2                	test   %edx,%edx
  800473:	74 18                	je     80048d <getint+0x21>
  800475:	8b 10                	mov    (%eax),%edx
  800477:	8d 4a 04             	lea    0x4(%edx),%ecx
  80047a:	89 08                	mov    %ecx,(%eax)
  80047c:	8b 02                	mov    (%edx),%eax
  80047e:	99                   	cltd
  80047f:	c3                   	ret
  800480:	8b 10                	mov    (%eax),%edx
  800482:	8d 4a 08             	lea    0x8(%edx),%ecx
  800485:	89 08                	mov    %ecx,(%eax)
  800487:	8b 02                	mov    (%edx),%eax
  800489:	8b 52 04             	mov    0x4(%edx),%edx
  80048c:	c3                   	ret
  80048d:	8b 10                	mov    (%eax),%edx
  80048f:	8d 4a 04             	lea    0x4(%edx),%ecx
  800492:	89 08                	mov    %ecx,(%eax)
  800494:	8b 02                	mov    (%edx),%eax
  800496:	99                   	cltd
  800497:	c3                   	ret

00800498 <sprintputch>:
  800498:	55                   	push   %ebp
  800499:	89 e5                	mov    %esp,%ebp
  80049b:	8b 45 0c             	mov    0xc(%ebp),%eax
  80049e:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8004a2:	8b 10                	mov    (%eax),%edx
  8004a4:	3b 50 04             	cmp    0x4(%eax),%edx
  8004a7:	73 0a                	jae    8004b3 <sprintputch+0x1b>
  8004a9:	8d 4a 01             	lea    0x1(%edx),%ecx
  8004ac:	89 08                	mov    %ecx,(%eax)
  8004ae:	8b 45 08             	mov    0x8(%ebp),%eax
  8004b1:	88 02                	mov    %al,(%edx)
  8004b3:	5d                   	pop    %ebp
  8004b4:	c3                   	ret

008004b5 <printfmt>:
  8004b5:	55                   	push   %ebp
  8004b6:	89 e5                	mov    %esp,%ebp
  8004b8:	83 ec 08             	sub    $0x8,%esp
  8004bb:	8d 45 14             	lea    0x14(%ebp),%eax
  8004be:	50                   	push   %eax
  8004bf:	ff 75 10             	push   0x10(%ebp)
  8004c2:	ff 75 0c             	push   0xc(%ebp)
  8004c5:	ff 75 08             	push   0x8(%ebp)
  8004c8:	e8 05 00 00 00       	call   8004d2 <vprintfmt>
  8004cd:	83 c4 10             	add    $0x10,%esp
  8004d0:	c9                   	leave
  8004d1:	c3                   	ret

008004d2 <vprintfmt>:
  8004d2:	55                   	push   %ebp
  8004d3:	89 e5                	mov    %esp,%ebp
  8004d5:	57                   	push   %edi
  8004d6:	56                   	push   %esi
  8004d7:	53                   	push   %ebx
  8004d8:	83 ec 2c             	sub    $0x2c,%esp
  8004db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004de:	8b 75 0c             	mov    0xc(%ebp),%esi
  8004e1:	8b 7d 10             	mov    0x10(%ebp),%edi
  8004e4:	eb 0a                	jmp    8004f0 <vprintfmt+0x1e>
  8004e6:	83 ec 08             	sub    $0x8,%esp
  8004e9:	56                   	push   %esi
  8004ea:	50                   	push   %eax
  8004eb:	ff d3                	call   *%ebx
  8004ed:	83 c4 10             	add    $0x10,%esp
  8004f0:	83 c7 01             	add    $0x1,%edi
  8004f3:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8004f7:	83 f8 25             	cmp    $0x25,%eax
  8004fa:	74 0c                	je     800508 <vprintfmt+0x36>
  8004fc:	85 c0                	test   %eax,%eax
  8004fe:	75 e6                	jne    8004e6 <vprintfmt+0x14>
  800500:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800503:	5b                   	pop    %ebx
  800504:	5e                   	pop    %esi
  800505:	5f                   	pop    %edi
  800506:	5d                   	pop    %ebp
  800507:	c3                   	ret
  800508:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  80050c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800513:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80051a:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800521:	b9 00 00 00 00       	mov    $0x0,%ecx
  800526:	8d 47 01             	lea    0x1(%edi),%eax
  800529:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80052c:	0f b6 17             	movzbl (%edi),%edx
  80052f:	8d 42 dd             	lea    -0x23(%edx),%eax
  800532:	3c 55                	cmp    $0x55,%al
  800534:	0f 87 c3 02 00 00    	ja     8007fd <vprintfmt+0x32b>
  80053a:	0f b6 c0             	movzbl %al,%eax
  80053d:	ff 24 85 80 0f 80 00 	jmp    *0x800f80(,%eax,4)
  800544:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800547:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  80054b:	eb d9                	jmp    800526 <vprintfmt+0x54>
  80054d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800550:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800554:	eb d0                	jmp    800526 <vprintfmt+0x54>
  800556:	0f b6 d2             	movzbl %dl,%edx
  800559:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80055c:	b8 00 00 00 00       	mov    $0x0,%eax
  800561:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800564:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800567:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  80056b:	0f be 17             	movsbl (%edi),%edx
  80056e:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800571:	83 f9 09             	cmp    $0x9,%ecx
  800574:	77 52                	ja     8005c8 <vprintfmt+0xf6>
  800576:	83 c7 01             	add    $0x1,%edi
  800579:	eb e9                	jmp    800564 <vprintfmt+0x92>
  80057b:	8b 45 14             	mov    0x14(%ebp),%eax
  80057e:	8d 50 04             	lea    0x4(%eax),%edx
  800581:	89 55 14             	mov    %edx,0x14(%ebp)
  800584:	8b 00                	mov    (%eax),%eax
  800586:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800589:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80058c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800590:	79 94                	jns    800526 <vprintfmt+0x54>
  800592:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800595:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800598:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80059f:	eb 85                	jmp    800526 <vprintfmt+0x54>
  8005a1:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8005a4:	85 d2                	test   %edx,%edx
  8005a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8005ab:	0f 49 c2             	cmovns %edx,%eax
  8005ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005b1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005b4:	e9 6d ff ff ff       	jmp    800526 <vprintfmt+0x54>
  8005b9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005bc:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8005c3:	e9 5e ff ff ff       	jmp    800526 <vprintfmt+0x54>
  8005c8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8005cb:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005ce:	eb bc                	jmp    80058c <vprintfmt+0xba>
  8005d0:	83 c1 01             	add    $0x1,%ecx
  8005d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005d6:	e9 4b ff ff ff       	jmp    800526 <vprintfmt+0x54>
  8005db:	8b 45 14             	mov    0x14(%ebp),%eax
  8005de:	8d 50 04             	lea    0x4(%eax),%edx
  8005e1:	89 55 14             	mov    %edx,0x14(%ebp)
  8005e4:	83 ec 08             	sub    $0x8,%esp
  8005e7:	56                   	push   %esi
  8005e8:	ff 30                	push   (%eax)
  8005ea:	ff d3                	call   *%ebx
  8005ec:	83 c4 10             	add    $0x10,%esp
  8005ef:	e9 a0 01 00 00       	jmp    800794 <vprintfmt+0x2c2>
  8005f4:	8b 45 14             	mov    0x14(%ebp),%eax
  8005f7:	8d 50 04             	lea    0x4(%eax),%edx
  8005fa:	89 55 14             	mov    %edx,0x14(%ebp)
  8005fd:	8b 10                	mov    (%eax),%edx
  8005ff:	89 d0                	mov    %edx,%eax
  800601:	f7 d8                	neg    %eax
  800603:	0f 48 c2             	cmovs  %edx,%eax
  800606:	83 f8 08             	cmp    $0x8,%eax
  800609:	7f 20                	jg     80062b <vprintfmt+0x159>
  80060b:	8b 14 85 e0 10 80 00 	mov    0x8010e0(,%eax,4),%edx
  800612:	85 d2                	test   %edx,%edx
  800614:	74 15                	je     80062b <vprintfmt+0x159>
  800616:	52                   	push   %edx
  800617:	68 b8 0e 80 00       	push   $0x800eb8
  80061c:	56                   	push   %esi
  80061d:	53                   	push   %ebx
  80061e:	e8 92 fe ff ff       	call   8004b5 <printfmt>
  800623:	83 c4 10             	add    $0x10,%esp
  800626:	e9 69 01 00 00       	jmp    800794 <vprintfmt+0x2c2>
  80062b:	50                   	push   %eax
  80062c:	68 af 0e 80 00       	push   $0x800eaf
  800631:	56                   	push   %esi
  800632:	53                   	push   %ebx
  800633:	e8 7d fe ff ff       	call   8004b5 <printfmt>
  800638:	83 c4 10             	add    $0x10,%esp
  80063b:	e9 54 01 00 00       	jmp    800794 <vprintfmt+0x2c2>
  800640:	8b 45 14             	mov    0x14(%ebp),%eax
  800643:	8d 50 04             	lea    0x4(%eax),%edx
  800646:	89 55 14             	mov    %edx,0x14(%ebp)
  800649:	8b 08                	mov    (%eax),%ecx
  80064b:	85 c9                	test   %ecx,%ecx
  80064d:	b8 a8 0e 80 00       	mov    $0x800ea8,%eax
  800652:	0f 45 c1             	cmovne %ecx,%eax
  800655:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800658:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80065c:	7e 06                	jle    800664 <vprintfmt+0x192>
  80065e:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800662:	75 0b                	jne    80066f <vprintfmt+0x19d>
  800664:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800667:	8b 7d d0             	mov    -0x30(%ebp),%edi
  80066a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80066d:	eb 5c                	jmp    8006cb <vprintfmt+0x1f9>
  80066f:	83 ec 08             	sub    $0x8,%esp
  800672:	ff 75 d0             	push   -0x30(%ebp)
  800675:	ff 75 cc             	push   -0x34(%ebp)
  800678:	e8 20 02 00 00       	call   80089d <strnlen>
  80067d:	89 c2                	mov    %eax,%edx
  80067f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800682:	29 d0                	sub    %edx,%eax
  800684:	83 c4 10             	add    $0x10,%esp
  800687:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  80068b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80068e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800691:	89 c3                	mov    %eax,%ebx
  800693:	eb 0e                	jmp    8006a3 <vprintfmt+0x1d1>
  800695:	83 ec 08             	sub    $0x8,%esp
  800698:	56                   	push   %esi
  800699:	57                   	push   %edi
  80069a:	ff 55 08             	call   *0x8(%ebp)
  80069d:	83 eb 01             	sub    $0x1,%ebx
  8006a0:	83 c4 10             	add    $0x10,%esp
  8006a3:	85 db                	test   %ebx,%ebx
  8006a5:	7f ee                	jg     800695 <vprintfmt+0x1c3>
  8006a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006aa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006ad:	85 c0                	test   %eax,%eax
  8006af:	ba 00 00 00 00       	mov    $0x0,%edx
  8006b4:	0f 49 d0             	cmovns %eax,%edx
  8006b7:	29 d0                	sub    %edx,%eax
  8006b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006bc:	eb a6                	jmp    800664 <vprintfmt+0x192>
  8006be:	83 ec 08             	sub    $0x8,%esp
  8006c1:	56                   	push   %esi
  8006c2:	52                   	push   %edx
  8006c3:	ff 55 08             	call   *0x8(%ebp)
  8006c6:	83 c4 10             	add    $0x10,%esp
  8006c9:	89 d9                	mov    %ebx,%ecx
  8006cb:	8d 59 01             	lea    0x1(%ecx),%ebx
  8006ce:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8006d2:	0f be d0             	movsbl %al,%edx
  8006d5:	85 d2                	test   %edx,%edx
  8006d7:	74 28                	je     800701 <vprintfmt+0x22f>
  8006d9:	85 ff                	test   %edi,%edi
  8006db:	78 05                	js     8006e2 <vprintfmt+0x210>
  8006dd:	83 ef 01             	sub    $0x1,%edi
  8006e0:	78 2e                	js     800710 <vprintfmt+0x23e>
  8006e2:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8006e6:	74 d6                	je     8006be <vprintfmt+0x1ec>
  8006e8:	0f be c0             	movsbl %al,%eax
  8006eb:	83 e8 20             	sub    $0x20,%eax
  8006ee:	83 f8 5e             	cmp    $0x5e,%eax
  8006f1:	76 cb                	jbe    8006be <vprintfmt+0x1ec>
  8006f3:	83 ec 08             	sub    $0x8,%esp
  8006f6:	56                   	push   %esi
  8006f7:	6a 3f                	push   $0x3f
  8006f9:	ff 55 08             	call   *0x8(%ebp)
  8006fc:	83 c4 10             	add    $0x10,%esp
  8006ff:	eb c8                	jmp    8006c9 <vprintfmt+0x1f7>
  800701:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800704:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800707:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80070a:	01 c7                	add    %eax,%edi
  80070c:	29 cf                	sub    %ecx,%edi
  80070e:	eb 13                	jmp    800723 <vprintfmt+0x251>
  800710:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800713:	eb ef                	jmp    800704 <vprintfmt+0x232>
  800715:	83 ec 08             	sub    $0x8,%esp
  800718:	56                   	push   %esi
  800719:	6a 20                	push   $0x20
  80071b:	ff d3                	call   *%ebx
  80071d:	83 ef 01             	sub    $0x1,%edi
  800720:	83 c4 10             	add    $0x10,%esp
  800723:	85 ff                	test   %edi,%edi
  800725:	7f ee                	jg     800715 <vprintfmt+0x243>
  800727:	eb 6b                	jmp    800794 <vprintfmt+0x2c2>
  800729:	89 ca                	mov    %ecx,%edx
  80072b:	8d 45 14             	lea    0x14(%ebp),%eax
  80072e:	e8 39 fd ff ff       	call   80046c <getint>
  800733:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800736:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800739:	85 d2                	test   %edx,%edx
  80073b:	78 0b                	js     800748 <vprintfmt+0x276>
  80073d:	89 d1                	mov    %edx,%ecx
  80073f:	89 c2                	mov    %eax,%edx
  800741:	bf 0a 00 00 00       	mov    $0xa,%edi
  800746:	eb 32                	jmp    80077a <vprintfmt+0x2a8>
  800748:	83 ec 08             	sub    $0x8,%esp
  80074b:	56                   	push   %esi
  80074c:	6a 2d                	push   $0x2d
  80074e:	ff d3                	call   *%ebx
  800750:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800753:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800756:	f7 da                	neg    %edx
  800758:	83 d1 00             	adc    $0x0,%ecx
  80075b:	f7 d9                	neg    %ecx
  80075d:	83 c4 10             	add    $0x10,%esp
  800760:	bf 0a 00 00 00       	mov    $0xa,%edi
  800765:	eb 13                	jmp    80077a <vprintfmt+0x2a8>
  800767:	89 ca                	mov    %ecx,%edx
  800769:	8d 45 14             	lea    0x14(%ebp),%eax
  80076c:	e8 c7 fc ff ff       	call   800438 <getuint>
  800771:	89 d1                	mov    %edx,%ecx
  800773:	89 c2                	mov    %eax,%edx
  800775:	bf 0a 00 00 00       	mov    $0xa,%edi
  80077a:	83 ec 0c             	sub    $0xc,%esp
  80077d:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800781:	50                   	push   %eax
  800782:	ff 75 e0             	push   -0x20(%ebp)
  800785:	57                   	push   %edi
  800786:	51                   	push   %ecx
  800787:	52                   	push   %edx
  800788:	89 f2                	mov    %esi,%edx
  80078a:	89 d8                	mov    %ebx,%eax
  80078c:	e8 fe fb ff ff       	call   80038f <printnum>
  800791:	83 c4 20             	add    $0x20,%esp
  800794:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800797:	e9 54 fd ff ff       	jmp    8004f0 <vprintfmt+0x1e>
  80079c:	89 ca                	mov    %ecx,%edx
  80079e:	8d 45 14             	lea    0x14(%ebp),%eax
  8007a1:	e8 92 fc ff ff       	call   800438 <getuint>
  8007a6:	89 d1                	mov    %edx,%ecx
  8007a8:	89 c2                	mov    %eax,%edx
  8007aa:	bf 08 00 00 00       	mov    $0x8,%edi
  8007af:	eb c9                	jmp    80077a <vprintfmt+0x2a8>
  8007b1:	83 ec 08             	sub    $0x8,%esp
  8007b4:	56                   	push   %esi
  8007b5:	6a 30                	push   $0x30
  8007b7:	ff d3                	call   *%ebx
  8007b9:	83 c4 08             	add    $0x8,%esp
  8007bc:	56                   	push   %esi
  8007bd:	6a 78                	push   $0x78
  8007bf:	ff d3                	call   *%ebx
  8007c1:	8b 45 14             	mov    0x14(%ebp),%eax
  8007c4:	8d 50 04             	lea    0x4(%eax),%edx
  8007c7:	89 55 14             	mov    %edx,0x14(%ebp)
  8007ca:	8b 10                	mov    (%eax),%edx
  8007cc:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007d1:	83 c4 10             	add    $0x10,%esp
  8007d4:	bf 10 00 00 00       	mov    $0x10,%edi
  8007d9:	eb 9f                	jmp    80077a <vprintfmt+0x2a8>
  8007db:	89 ca                	mov    %ecx,%edx
  8007dd:	8d 45 14             	lea    0x14(%ebp),%eax
  8007e0:	e8 53 fc ff ff       	call   800438 <getuint>
  8007e5:	89 d1                	mov    %edx,%ecx
  8007e7:	89 c2                	mov    %eax,%edx
  8007e9:	bf 10 00 00 00       	mov    $0x10,%edi
  8007ee:	eb 8a                	jmp    80077a <vprintfmt+0x2a8>
  8007f0:	83 ec 08             	sub    $0x8,%esp
  8007f3:	56                   	push   %esi
  8007f4:	6a 25                	push   $0x25
  8007f6:	ff d3                	call   *%ebx
  8007f8:	83 c4 10             	add    $0x10,%esp
  8007fb:	eb 97                	jmp    800794 <vprintfmt+0x2c2>
  8007fd:	83 ec 08             	sub    $0x8,%esp
  800800:	56                   	push   %esi
  800801:	6a 25                	push   $0x25
  800803:	ff d3                	call   *%ebx
  800805:	83 c4 10             	add    $0x10,%esp
  800808:	89 f8                	mov    %edi,%eax
  80080a:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  80080e:	74 05                	je     800815 <vprintfmt+0x343>
  800810:	83 e8 01             	sub    $0x1,%eax
  800813:	eb f5                	jmp    80080a <vprintfmt+0x338>
  800815:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800818:	e9 77 ff ff ff       	jmp    800794 <vprintfmt+0x2c2>

0080081d <vsnprintf>:
  80081d:	55                   	push   %ebp
  80081e:	89 e5                	mov    %esp,%ebp
  800820:	83 ec 18             	sub    $0x18,%esp
  800823:	8b 45 08             	mov    0x8(%ebp),%eax
  800826:	8b 55 0c             	mov    0xc(%ebp),%edx
  800829:	89 45 ec             	mov    %eax,-0x14(%ebp)
  80082c:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800830:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800833:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  80083a:	85 c0                	test   %eax,%eax
  80083c:	74 26                	je     800864 <vsnprintf+0x47>
  80083e:	85 d2                	test   %edx,%edx
  800840:	7e 22                	jle    800864 <vsnprintf+0x47>
  800842:	ff 75 14             	push   0x14(%ebp)
  800845:	ff 75 10             	push   0x10(%ebp)
  800848:	8d 45 ec             	lea    -0x14(%ebp),%eax
  80084b:	50                   	push   %eax
  80084c:	68 98 04 80 00       	push   $0x800498
  800851:	e8 7c fc ff ff       	call   8004d2 <vprintfmt>
  800856:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800859:	c6 00 00             	movb   $0x0,(%eax)
  80085c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  80085f:	83 c4 10             	add    $0x10,%esp
  800862:	c9                   	leave
  800863:	c3                   	ret
  800864:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800869:	eb f7                	jmp    800862 <vsnprintf+0x45>

0080086b <snprintf>:
  80086b:	55                   	push   %ebp
  80086c:	89 e5                	mov    %esp,%ebp
  80086e:	83 ec 08             	sub    $0x8,%esp
  800871:	8d 45 14             	lea    0x14(%ebp),%eax
  800874:	50                   	push   %eax
  800875:	ff 75 10             	push   0x10(%ebp)
  800878:	ff 75 0c             	push   0xc(%ebp)
  80087b:	ff 75 08             	push   0x8(%ebp)
  80087e:	e8 9a ff ff ff       	call   80081d <vsnprintf>
  800883:	c9                   	leave
  800884:	c3                   	ret

00800885 <strlen>:
  800885:	55                   	push   %ebp
  800886:	89 e5                	mov    %esp,%ebp
  800888:	8b 55 08             	mov    0x8(%ebp),%edx
  80088b:	b8 00 00 00 00       	mov    $0x0,%eax
  800890:	eb 03                	jmp    800895 <strlen+0x10>
  800892:	83 c0 01             	add    $0x1,%eax
  800895:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800899:	75 f7                	jne    800892 <strlen+0xd>
  80089b:	5d                   	pop    %ebp
  80089c:	c3                   	ret

0080089d <strnlen>:
  80089d:	55                   	push   %ebp
  80089e:	89 e5                	mov    %esp,%ebp
  8008a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008a3:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8008ab:	eb 03                	jmp    8008b0 <strnlen+0x13>
  8008ad:	83 c0 01             	add    $0x1,%eax
  8008b0:	39 d0                	cmp    %edx,%eax
  8008b2:	74 08                	je     8008bc <strnlen+0x1f>
  8008b4:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8008b8:	75 f3                	jne    8008ad <strnlen+0x10>
  8008ba:	89 c2                	mov    %eax,%edx
  8008bc:	89 d0                	mov    %edx,%eax
  8008be:	5d                   	pop    %ebp
  8008bf:	c3                   	ret

008008c0 <strcpy>:
  8008c0:	55                   	push   %ebp
  8008c1:	89 e5                	mov    %esp,%ebp
  8008c3:	53                   	push   %ebx
  8008c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8008ca:	b8 00 00 00 00       	mov    $0x0,%eax
  8008cf:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8008d3:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8008d6:	83 c0 01             	add    $0x1,%eax
  8008d9:	84 d2                	test   %dl,%dl
  8008db:	75 f2                	jne    8008cf <strcpy+0xf>
  8008dd:	89 c8                	mov    %ecx,%eax
  8008df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008e2:	c9                   	leave
  8008e3:	c3                   	ret

008008e4 <strcat>:
  8008e4:	55                   	push   %ebp
  8008e5:	89 e5                	mov    %esp,%ebp
  8008e7:	53                   	push   %ebx
  8008e8:	83 ec 10             	sub    $0x10,%esp
  8008eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8008ee:	53                   	push   %ebx
  8008ef:	e8 91 ff ff ff       	call   800885 <strlen>
  8008f4:	83 c4 08             	add    $0x8,%esp
  8008f7:	ff 75 0c             	push   0xc(%ebp)
  8008fa:	01 d8                	add    %ebx,%eax
  8008fc:	50                   	push   %eax
  8008fd:	e8 be ff ff ff       	call   8008c0 <strcpy>
  800902:	89 d8                	mov    %ebx,%eax
  800904:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800907:	c9                   	leave
  800908:	c3                   	ret

00800909 <strncpy>:
  800909:	55                   	push   %ebp
  80090a:	89 e5                	mov    %esp,%ebp
  80090c:	56                   	push   %esi
  80090d:	53                   	push   %ebx
  80090e:	8b 75 08             	mov    0x8(%ebp),%esi
  800911:	8b 55 0c             	mov    0xc(%ebp),%edx
  800914:	89 f3                	mov    %esi,%ebx
  800916:	03 5d 10             	add    0x10(%ebp),%ebx
  800919:	89 f0                	mov    %esi,%eax
  80091b:	eb 0f                	jmp    80092c <strncpy+0x23>
  80091d:	83 c0 01             	add    $0x1,%eax
  800920:	0f b6 0a             	movzbl (%edx),%ecx
  800923:	88 48 ff             	mov    %cl,-0x1(%eax)
  800926:	80 f9 01             	cmp    $0x1,%cl
  800929:	83 da ff             	sbb    $0xffffffff,%edx
  80092c:	39 d8                	cmp    %ebx,%eax
  80092e:	75 ed                	jne    80091d <strncpy+0x14>
  800930:	89 f0                	mov    %esi,%eax
  800932:	5b                   	pop    %ebx
  800933:	5e                   	pop    %esi
  800934:	5d                   	pop    %ebp
  800935:	c3                   	ret

00800936 <strlcpy>:
  800936:	55                   	push   %ebp
  800937:	89 e5                	mov    %esp,%ebp
  800939:	56                   	push   %esi
  80093a:	53                   	push   %ebx
  80093b:	8b 75 08             	mov    0x8(%ebp),%esi
  80093e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800941:	8b 55 10             	mov    0x10(%ebp),%edx
  800944:	89 f0                	mov    %esi,%eax
  800946:	85 d2                	test   %edx,%edx
  800948:	74 21                	je     80096b <strlcpy+0x35>
  80094a:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  80094e:	89 f2                	mov    %esi,%edx
  800950:	eb 09                	jmp    80095b <strlcpy+0x25>
  800952:	83 c1 01             	add    $0x1,%ecx
  800955:	83 c2 01             	add    $0x1,%edx
  800958:	88 5a ff             	mov    %bl,-0x1(%edx)
  80095b:	39 c2                	cmp    %eax,%edx
  80095d:	74 09                	je     800968 <strlcpy+0x32>
  80095f:	0f b6 19             	movzbl (%ecx),%ebx
  800962:	84 db                	test   %bl,%bl
  800964:	75 ec                	jne    800952 <strlcpy+0x1c>
  800966:	89 d0                	mov    %edx,%eax
  800968:	c6 00 00             	movb   $0x0,(%eax)
  80096b:	29 f0                	sub    %esi,%eax
  80096d:	5b                   	pop    %ebx
  80096e:	5e                   	pop    %esi
  80096f:	5d                   	pop    %ebp
  800970:	c3                   	ret

00800971 <strcmp>:
  800971:	55                   	push   %ebp
  800972:	89 e5                	mov    %esp,%ebp
  800974:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800977:	8b 55 0c             	mov    0xc(%ebp),%edx
  80097a:	eb 06                	jmp    800982 <strcmp+0x11>
  80097c:	83 c1 01             	add    $0x1,%ecx
  80097f:	83 c2 01             	add    $0x1,%edx
  800982:	0f b6 01             	movzbl (%ecx),%eax
  800985:	84 c0                	test   %al,%al
  800987:	74 04                	je     80098d <strcmp+0x1c>
  800989:	3a 02                	cmp    (%edx),%al
  80098b:	74 ef                	je     80097c <strcmp+0xb>
  80098d:	0f b6 c0             	movzbl %al,%eax
  800990:	0f b6 12             	movzbl (%edx),%edx
  800993:	29 d0                	sub    %edx,%eax
  800995:	5d                   	pop    %ebp
  800996:	c3                   	ret

00800997 <strncmp>:
  800997:	55                   	push   %ebp
  800998:	89 e5                	mov    %esp,%ebp
  80099a:	53                   	push   %ebx
  80099b:	8b 45 08             	mov    0x8(%ebp),%eax
  80099e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8009a1:	8b 55 10             	mov    0x10(%ebp),%edx
  8009a4:	eb 09                	jmp    8009af <strncmp+0x18>
  8009a6:	83 ea 01             	sub    $0x1,%edx
  8009a9:	83 c0 01             	add    $0x1,%eax
  8009ac:	83 c1 01             	add    $0x1,%ecx
  8009af:	85 d2                	test   %edx,%edx
  8009b1:	74 18                	je     8009cb <strncmp+0x34>
  8009b3:	0f b6 18             	movzbl (%eax),%ebx
  8009b6:	84 db                	test   %bl,%bl
  8009b8:	74 04                	je     8009be <strncmp+0x27>
  8009ba:	3a 19                	cmp    (%ecx),%bl
  8009bc:	74 e8                	je     8009a6 <strncmp+0xf>
  8009be:	0f b6 00             	movzbl (%eax),%eax
  8009c1:	0f b6 11             	movzbl (%ecx),%edx
  8009c4:	29 d0                	sub    %edx,%eax
  8009c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8009c9:	c9                   	leave
  8009ca:	c3                   	ret
  8009cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8009d0:	eb f4                	jmp    8009c6 <strncmp+0x2f>

008009d2 <strchr>:
  8009d2:	55                   	push   %ebp
  8009d3:	89 e5                	mov    %esp,%ebp
  8009d5:	8b 45 08             	mov    0x8(%ebp),%eax
  8009d8:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009dc:	eb 03                	jmp    8009e1 <strchr+0xf>
  8009de:	83 c0 01             	add    $0x1,%eax
  8009e1:	0f b6 10             	movzbl (%eax),%edx
  8009e4:	84 d2                	test   %dl,%dl
  8009e6:	74 06                	je     8009ee <strchr+0x1c>
  8009e8:	38 ca                	cmp    %cl,%dl
  8009ea:	75 f2                	jne    8009de <strchr+0xc>
  8009ec:	eb 05                	jmp    8009f3 <strchr+0x21>
  8009ee:	b8 00 00 00 00       	mov    $0x0,%eax
  8009f3:	5d                   	pop    %ebp
  8009f4:	c3                   	ret

008009f5 <strfind>:
  8009f5:	55                   	push   %ebp
  8009f6:	89 e5                	mov    %esp,%ebp
  8009f8:	8b 45 08             	mov    0x8(%ebp),%eax
  8009fb:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009ff:	0f b6 10             	movzbl (%eax),%edx
  800a02:	38 ca                	cmp    %cl,%dl
  800a04:	74 09                	je     800a0f <strfind+0x1a>
  800a06:	84 d2                	test   %dl,%dl
  800a08:	74 05                	je     800a0f <strfind+0x1a>
  800a0a:	83 c0 01             	add    $0x1,%eax
  800a0d:	eb f0                	jmp    8009ff <strfind+0xa>
  800a0f:	5d                   	pop    %ebp
  800a10:	c3                   	ret

00800a11 <memset>:
  800a11:	55                   	push   %ebp
  800a12:	89 e5                	mov    %esp,%ebp
  800a14:	57                   	push   %edi
  800a15:	8b 55 08             	mov    0x8(%ebp),%edx
  800a18:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a1b:	85 c9                	test   %ecx,%ecx
  800a1d:	74 24                	je     800a43 <memset+0x32>
  800a1f:	89 d0                	mov    %edx,%eax
  800a21:	09 c8                	or     %ecx,%eax
  800a23:	a8 03                	test   $0x3,%al
  800a25:	75 14                	jne    800a3b <memset+0x2a>
  800a27:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800a2b:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800a31:	c1 e9 02             	shr    $0x2,%ecx
  800a34:	89 d7                	mov    %edx,%edi
  800a36:	fc                   	cld
  800a37:	f3 ab                	rep stos %eax,%es:(%edi)
  800a39:	eb 08                	jmp    800a43 <memset+0x32>
  800a3b:	89 d7                	mov    %edx,%edi
  800a3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a40:	fc                   	cld
  800a41:	f3 aa                	rep stos %al,%es:(%edi)
  800a43:	89 d0                	mov    %edx,%eax
  800a45:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800a48:	c9                   	leave
  800a49:	c3                   	ret

00800a4a <memmove>:
  800a4a:	55                   	push   %ebp
  800a4b:	89 e5                	mov    %esp,%ebp
  800a4d:	57                   	push   %edi
  800a4e:	56                   	push   %esi
  800a4f:	8b 45 08             	mov    0x8(%ebp),%eax
  800a52:	8b 75 0c             	mov    0xc(%ebp),%esi
  800a55:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a58:	39 c6                	cmp    %eax,%esi
  800a5a:	73 32                	jae    800a8e <memmove+0x44>
  800a5c:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800a5f:	39 d0                	cmp    %edx,%eax
  800a61:	73 2b                	jae    800a8e <memmove+0x44>
  800a63:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800a66:	89 fe                	mov    %edi,%esi
  800a68:	09 ce                	or     %ecx,%esi
  800a6a:	09 d6                	or     %edx,%esi
  800a6c:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800a72:	75 0e                	jne    800a82 <memmove+0x38>
  800a74:	83 ef 04             	sub    $0x4,%edi
  800a77:	8d 72 fc             	lea    -0x4(%edx),%esi
  800a7a:	c1 e9 02             	shr    $0x2,%ecx
  800a7d:	fd                   	std
  800a7e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a80:	eb 09                	jmp    800a8b <memmove+0x41>
  800a82:	83 ef 01             	sub    $0x1,%edi
  800a85:	8d 72 ff             	lea    -0x1(%edx),%esi
  800a88:	fd                   	std
  800a89:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a8b:	fc                   	cld
  800a8c:	eb 1a                	jmp    800aa8 <memmove+0x5e>
  800a8e:	89 c2                	mov    %eax,%edx
  800a90:	09 ca                	or     %ecx,%edx
  800a92:	09 f2                	or     %esi,%edx
  800a94:	f6 c2 03             	test   $0x3,%dl
  800a97:	75 0a                	jne    800aa3 <memmove+0x59>
  800a99:	c1 e9 02             	shr    $0x2,%ecx
  800a9c:	89 c7                	mov    %eax,%edi
  800a9e:	fc                   	cld
  800a9f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800aa1:	eb 05                	jmp    800aa8 <memmove+0x5e>
  800aa3:	89 c7                	mov    %eax,%edi
  800aa5:	fc                   	cld
  800aa6:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800aa8:	5e                   	pop    %esi
  800aa9:	5f                   	pop    %edi
  800aaa:	5d                   	pop    %ebp
  800aab:	c3                   	ret

00800aac <memcpy>:
  800aac:	55                   	push   %ebp
  800aad:	89 e5                	mov    %esp,%ebp
  800aaf:	83 ec 0c             	sub    $0xc,%esp
  800ab2:	ff 75 10             	push   0x10(%ebp)
  800ab5:	ff 75 0c             	push   0xc(%ebp)
  800ab8:	ff 75 08             	push   0x8(%ebp)
  800abb:	e8 8a ff ff ff       	call   800a4a <memmove>
  800ac0:	c9                   	leave
  800ac1:	c3                   	ret

00800ac2 <memcmp>:
  800ac2:	55                   	push   %ebp
  800ac3:	89 e5                	mov    %esp,%ebp
  800ac5:	56                   	push   %esi
  800ac6:	53                   	push   %ebx
  800ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  800aca:	8b 55 0c             	mov    0xc(%ebp),%edx
  800acd:	89 c6                	mov    %eax,%esi
  800acf:	03 75 10             	add    0x10(%ebp),%esi
  800ad2:	eb 06                	jmp    800ada <memcmp+0x18>
  800ad4:	83 c0 01             	add    $0x1,%eax
  800ad7:	83 c2 01             	add    $0x1,%edx
  800ada:	39 f0                	cmp    %esi,%eax
  800adc:	74 14                	je     800af2 <memcmp+0x30>
  800ade:	0f b6 08             	movzbl (%eax),%ecx
  800ae1:	0f b6 1a             	movzbl (%edx),%ebx
  800ae4:	38 d9                	cmp    %bl,%cl
  800ae6:	74 ec                	je     800ad4 <memcmp+0x12>
  800ae8:	0f b6 c1             	movzbl %cl,%eax
  800aeb:	0f b6 db             	movzbl %bl,%ebx
  800aee:	29 d8                	sub    %ebx,%eax
  800af0:	eb 05                	jmp    800af7 <memcmp+0x35>
  800af2:	b8 00 00 00 00       	mov    $0x0,%eax
  800af7:	5b                   	pop    %ebx
  800af8:	5e                   	pop    %esi
  800af9:	5d                   	pop    %ebp
  800afa:	c3                   	ret

00800afb <memfind>:
  800afb:	55                   	push   %ebp
  800afc:	89 e5                	mov    %esp,%ebp
  800afe:	8b 45 08             	mov    0x8(%ebp),%eax
  800b01:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800b04:	89 c2                	mov    %eax,%edx
  800b06:	03 55 10             	add    0x10(%ebp),%edx
  800b09:	eb 03                	jmp    800b0e <memfind+0x13>
  800b0b:	83 c0 01             	add    $0x1,%eax
  800b0e:	39 d0                	cmp    %edx,%eax
  800b10:	73 04                	jae    800b16 <memfind+0x1b>
  800b12:	38 08                	cmp    %cl,(%eax)
  800b14:	75 f5                	jne    800b0b <memfind+0x10>
  800b16:	5d                   	pop    %ebp
  800b17:	c3                   	ret

00800b18 <strtol>:
  800b18:	55                   	push   %ebp
  800b19:	89 e5                	mov    %esp,%ebp
  800b1b:	57                   	push   %edi
  800b1c:	56                   	push   %esi
  800b1d:	53                   	push   %ebx
  800b1e:	8b 55 08             	mov    0x8(%ebp),%edx
  800b21:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800b24:	eb 03                	jmp    800b29 <strtol+0x11>
  800b26:	83 c2 01             	add    $0x1,%edx
  800b29:	0f b6 02             	movzbl (%edx),%eax
  800b2c:	3c 20                	cmp    $0x20,%al
  800b2e:	74 f6                	je     800b26 <strtol+0xe>
  800b30:	3c 09                	cmp    $0x9,%al
  800b32:	74 f2                	je     800b26 <strtol+0xe>
  800b34:	3c 2b                	cmp    $0x2b,%al
  800b36:	74 2a                	je     800b62 <strtol+0x4a>
  800b38:	bf 00 00 00 00       	mov    $0x0,%edi
  800b3d:	3c 2d                	cmp    $0x2d,%al
  800b3f:	74 2b                	je     800b6c <strtol+0x54>
  800b41:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800b47:	75 0f                	jne    800b58 <strtol+0x40>
  800b49:	80 3a 30             	cmpb   $0x30,(%edx)
  800b4c:	74 28                	je     800b76 <strtol+0x5e>
  800b4e:	85 db                	test   %ebx,%ebx
  800b50:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b55:	0f 44 d8             	cmove  %eax,%ebx
  800b58:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b5d:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800b60:	eb 46                	jmp    800ba8 <strtol+0x90>
  800b62:	83 c2 01             	add    $0x1,%edx
  800b65:	bf 00 00 00 00       	mov    $0x0,%edi
  800b6a:	eb d5                	jmp    800b41 <strtol+0x29>
  800b6c:	83 c2 01             	add    $0x1,%edx
  800b6f:	bf 01 00 00 00       	mov    $0x1,%edi
  800b74:	eb cb                	jmp    800b41 <strtol+0x29>
  800b76:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800b7a:	74 0e                	je     800b8a <strtol+0x72>
  800b7c:	85 db                	test   %ebx,%ebx
  800b7e:	75 d8                	jne    800b58 <strtol+0x40>
  800b80:	83 c2 01             	add    $0x1,%edx
  800b83:	bb 08 00 00 00       	mov    $0x8,%ebx
  800b88:	eb ce                	jmp    800b58 <strtol+0x40>
  800b8a:	83 c2 02             	add    $0x2,%edx
  800b8d:	bb 10 00 00 00       	mov    $0x10,%ebx
  800b92:	eb c4                	jmp    800b58 <strtol+0x40>
  800b94:	0f be c0             	movsbl %al,%eax
  800b97:	83 e8 30             	sub    $0x30,%eax
  800b9a:	3b 45 10             	cmp    0x10(%ebp),%eax
  800b9d:	7d 3a                	jge    800bd9 <strtol+0xc1>
  800b9f:	83 c2 01             	add    $0x1,%edx
  800ba2:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800ba6:	01 c1                	add    %eax,%ecx
  800ba8:	0f b6 02             	movzbl (%edx),%eax
  800bab:	8d 70 d0             	lea    -0x30(%eax),%esi
  800bae:	89 f3                	mov    %esi,%ebx
  800bb0:	80 fb 09             	cmp    $0x9,%bl
  800bb3:	76 df                	jbe    800b94 <strtol+0x7c>
  800bb5:	8d 70 9f             	lea    -0x61(%eax),%esi
  800bb8:	89 f3                	mov    %esi,%ebx
  800bba:	80 fb 19             	cmp    $0x19,%bl
  800bbd:	77 08                	ja     800bc7 <strtol+0xaf>
  800bbf:	0f be c0             	movsbl %al,%eax
  800bc2:	83 e8 57             	sub    $0x57,%eax
  800bc5:	eb d3                	jmp    800b9a <strtol+0x82>
  800bc7:	8d 70 bf             	lea    -0x41(%eax),%esi
  800bca:	89 f3                	mov    %esi,%ebx
  800bcc:	80 fb 19             	cmp    $0x19,%bl
  800bcf:	77 08                	ja     800bd9 <strtol+0xc1>
  800bd1:	0f be c0             	movsbl %al,%eax
  800bd4:	83 e8 37             	sub    $0x37,%eax
  800bd7:	eb c1                	jmp    800b9a <strtol+0x82>
  800bd9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800bdd:	74 05                	je     800be4 <strtol+0xcc>
  800bdf:	8b 45 0c             	mov    0xc(%ebp),%eax
  800be2:	89 10                	mov    %edx,(%eax)
  800be4:	89 c8                	mov    %ecx,%eax
  800be6:	f7 d8                	neg    %eax
  800be8:	85 ff                	test   %edi,%edi
  800bea:	0f 45 c8             	cmovne %eax,%ecx
  800bed:	89 c8                	mov    %ecx,%eax
  800bef:	5b                   	pop    %ebx
  800bf0:	5e                   	pop    %esi
  800bf1:	5f                   	pop    %edi
  800bf2:	5d                   	pop    %ebp
  800bf3:	c3                   	ret
  800bf4:	66 90                	xchg   %ax,%ax
  800bf6:	66 90                	xchg   %ax,%ax
  800bf8:	66 90                	xchg   %ax,%ax
  800bfa:	66 90                	xchg   %ax,%ax
  800bfc:	66 90                	xchg   %ax,%ax
  800bfe:	66 90                	xchg   %ax,%ax

00800c00 <__udivdi3>:
  800c00:	f3 0f 1e fb          	endbr32
  800c04:	55                   	push   %ebp
  800c05:	57                   	push   %edi
  800c06:	56                   	push   %esi
  800c07:	53                   	push   %ebx
  800c08:	83 ec 1c             	sub    $0x1c,%esp
  800c0b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800c0f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c13:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c17:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c1b:	85 c0                	test   %eax,%eax
  800c1d:	75 19                	jne    800c38 <__udivdi3+0x38>
  800c1f:	39 de                	cmp    %ebx,%esi
  800c21:	73 4d                	jae    800c70 <__udivdi3+0x70>
  800c23:	31 ff                	xor    %edi,%edi
  800c25:	89 e8                	mov    %ebp,%eax
  800c27:	89 f2                	mov    %esi,%edx
  800c29:	f7 f3                	div    %ebx
  800c2b:	89 fa                	mov    %edi,%edx
  800c2d:	83 c4 1c             	add    $0x1c,%esp
  800c30:	5b                   	pop    %ebx
  800c31:	5e                   	pop    %esi
  800c32:	5f                   	pop    %edi
  800c33:	5d                   	pop    %ebp
  800c34:	c3                   	ret
  800c35:	8d 76 00             	lea    0x0(%esi),%esi
  800c38:	39 c6                	cmp    %eax,%esi
  800c3a:	73 14                	jae    800c50 <__udivdi3+0x50>
  800c3c:	31 ff                	xor    %edi,%edi
  800c3e:	31 c0                	xor    %eax,%eax
  800c40:	89 fa                	mov    %edi,%edx
  800c42:	83 c4 1c             	add    $0x1c,%esp
  800c45:	5b                   	pop    %ebx
  800c46:	5e                   	pop    %esi
  800c47:	5f                   	pop    %edi
  800c48:	5d                   	pop    %ebp
  800c49:	c3                   	ret
  800c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800c50:	0f bd f8             	bsr    %eax,%edi
  800c53:	83 f7 1f             	xor    $0x1f,%edi
  800c56:	75 48                	jne    800ca0 <__udivdi3+0xa0>
  800c58:	39 f0                	cmp    %esi,%eax
  800c5a:	72 06                	jb     800c62 <__udivdi3+0x62>
  800c5c:	31 c0                	xor    %eax,%eax
  800c5e:	39 dd                	cmp    %ebx,%ebp
  800c60:	72 de                	jb     800c40 <__udivdi3+0x40>
  800c62:	b8 01 00 00 00       	mov    $0x1,%eax
  800c67:	eb d7                	jmp    800c40 <__udivdi3+0x40>
  800c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800c70:	89 d9                	mov    %ebx,%ecx
  800c72:	85 db                	test   %ebx,%ebx
  800c74:	75 0b                	jne    800c81 <__udivdi3+0x81>
  800c76:	b8 01 00 00 00       	mov    $0x1,%eax
  800c7b:	31 d2                	xor    %edx,%edx
  800c7d:	f7 f3                	div    %ebx
  800c7f:	89 c1                	mov    %eax,%ecx
  800c81:	31 d2                	xor    %edx,%edx
  800c83:	89 f0                	mov    %esi,%eax
  800c85:	f7 f1                	div    %ecx
  800c87:	89 c6                	mov    %eax,%esi
  800c89:	89 e8                	mov    %ebp,%eax
  800c8b:	89 f7                	mov    %esi,%edi
  800c8d:	f7 f1                	div    %ecx
  800c8f:	89 fa                	mov    %edi,%edx
  800c91:	83 c4 1c             	add    $0x1c,%esp
  800c94:	5b                   	pop    %ebx
  800c95:	5e                   	pop    %esi
  800c96:	5f                   	pop    %edi
  800c97:	5d                   	pop    %ebp
  800c98:	c3                   	ret
  800c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800ca0:	89 f9                	mov    %edi,%ecx
  800ca2:	ba 20 00 00 00       	mov    $0x20,%edx
  800ca7:	29 fa                	sub    %edi,%edx
  800ca9:	d3 e0                	shl    %cl,%eax
  800cab:	89 44 24 08          	mov    %eax,0x8(%esp)
  800caf:	89 d1                	mov    %edx,%ecx
  800cb1:	89 d8                	mov    %ebx,%eax
  800cb3:	d3 e8                	shr    %cl,%eax
  800cb5:	89 c1                	mov    %eax,%ecx
  800cb7:	8b 44 24 08          	mov    0x8(%esp),%eax
  800cbb:	09 c1                	or     %eax,%ecx
  800cbd:	89 f0                	mov    %esi,%eax
  800cbf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800cc3:	89 f9                	mov    %edi,%ecx
  800cc5:	d3 e3                	shl    %cl,%ebx
  800cc7:	89 d1                	mov    %edx,%ecx
  800cc9:	d3 e8                	shr    %cl,%eax
  800ccb:	89 f9                	mov    %edi,%ecx
  800ccd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800cd1:	89 eb                	mov    %ebp,%ebx
  800cd3:	d3 e6                	shl    %cl,%esi
  800cd5:	89 d1                	mov    %edx,%ecx
  800cd7:	d3 eb                	shr    %cl,%ebx
  800cd9:	09 f3                	or     %esi,%ebx
  800cdb:	89 c6                	mov    %eax,%esi
  800cdd:	89 f2                	mov    %esi,%edx
  800cdf:	89 d8                	mov    %ebx,%eax
  800ce1:	f7 74 24 08          	divl   0x8(%esp)
  800ce5:	89 d6                	mov    %edx,%esi
  800ce7:	89 c3                	mov    %eax,%ebx
  800ce9:	f7 64 24 0c          	mull   0xc(%esp)
  800ced:	39 d6                	cmp    %edx,%esi
  800cef:	72 1f                	jb     800d10 <__udivdi3+0x110>
  800cf1:	89 f9                	mov    %edi,%ecx
  800cf3:	d3 e5                	shl    %cl,%ebp
  800cf5:	39 c5                	cmp    %eax,%ebp
  800cf7:	73 04                	jae    800cfd <__udivdi3+0xfd>
  800cf9:	39 d6                	cmp    %edx,%esi
  800cfb:	74 13                	je     800d10 <__udivdi3+0x110>
  800cfd:	89 d8                	mov    %ebx,%eax
  800cff:	31 ff                	xor    %edi,%edi
  800d01:	e9 3a ff ff ff       	jmp    800c40 <__udivdi3+0x40>
  800d06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d0d:	00 
  800d0e:	66 90                	xchg   %ax,%ax
  800d10:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d13:	31 ff                	xor    %edi,%edi
  800d15:	e9 26 ff ff ff       	jmp    800c40 <__udivdi3+0x40>
  800d1a:	66 90                	xchg   %ax,%ax
  800d1c:	66 90                	xchg   %ax,%ax
  800d1e:	66 90                	xchg   %ax,%ax

00800d20 <__umoddi3>:
  800d20:	f3 0f 1e fb          	endbr32
  800d24:	55                   	push   %ebp
  800d25:	57                   	push   %edi
  800d26:	56                   	push   %esi
  800d27:	53                   	push   %ebx
  800d28:	83 ec 1c             	sub    $0x1c,%esp
  800d2b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d2f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d33:	8b 74 24 30          	mov    0x30(%esp),%esi
  800d37:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800d3b:	89 da                	mov    %ebx,%edx
  800d3d:	85 c0                	test   %eax,%eax
  800d3f:	75 17                	jne    800d58 <__umoddi3+0x38>
  800d41:	39 fb                	cmp    %edi,%ebx
  800d43:	73 53                	jae    800d98 <__umoddi3+0x78>
  800d45:	89 f0                	mov    %esi,%eax
  800d47:	f7 f7                	div    %edi
  800d49:	89 d0                	mov    %edx,%eax
  800d4b:	31 d2                	xor    %edx,%edx
  800d4d:	83 c4 1c             	add    $0x1c,%esp
  800d50:	5b                   	pop    %ebx
  800d51:	5e                   	pop    %esi
  800d52:	5f                   	pop    %edi
  800d53:	5d                   	pop    %ebp
  800d54:	c3                   	ret
  800d55:	8d 76 00             	lea    0x0(%esi),%esi
  800d58:	89 f1                	mov    %esi,%ecx
  800d5a:	39 c3                	cmp    %eax,%ebx
  800d5c:	73 12                	jae    800d70 <__umoddi3+0x50>
  800d5e:	89 f0                	mov    %esi,%eax
  800d60:	83 c4 1c             	add    $0x1c,%esp
  800d63:	5b                   	pop    %ebx
  800d64:	5e                   	pop    %esi
  800d65:	5f                   	pop    %edi
  800d66:	5d                   	pop    %ebp
  800d67:	c3                   	ret
  800d68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d6f:	00 
  800d70:	0f bd e8             	bsr    %eax,%ebp
  800d73:	83 f5 1f             	xor    $0x1f,%ebp
  800d76:	75 48                	jne    800dc0 <__umoddi3+0xa0>
  800d78:	39 d8                	cmp    %ebx,%eax
  800d7a:	0f 82 d0 00 00 00    	jb     800e50 <__umoddi3+0x130>
  800d80:	39 fe                	cmp    %edi,%esi
  800d82:	0f 83 c8 00 00 00    	jae    800e50 <__umoddi3+0x130>
  800d88:	89 c8                	mov    %ecx,%eax
  800d8a:	83 c4 1c             	add    $0x1c,%esp
  800d8d:	5b                   	pop    %ebx
  800d8e:	5e                   	pop    %esi
  800d8f:	5f                   	pop    %edi
  800d90:	5d                   	pop    %ebp
  800d91:	c3                   	ret
  800d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800d98:	89 f9                	mov    %edi,%ecx
  800d9a:	85 ff                	test   %edi,%edi
  800d9c:	75 0b                	jne    800da9 <__umoddi3+0x89>
  800d9e:	b8 01 00 00 00       	mov    $0x1,%eax
  800da3:	31 d2                	xor    %edx,%edx
  800da5:	f7 f7                	div    %edi
  800da7:	89 c1                	mov    %eax,%ecx
  800da9:	89 d8                	mov    %ebx,%eax
  800dab:	31 d2                	xor    %edx,%edx
  800dad:	f7 f1                	div    %ecx
  800daf:	89 f0                	mov    %esi,%eax
  800db1:	f7 f1                	div    %ecx
  800db3:	89 d0                	mov    %edx,%eax
  800db5:	31 d2                	xor    %edx,%edx
  800db7:	eb 94                	jmp    800d4d <__umoddi3+0x2d>
  800db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800dc0:	89 e9                	mov    %ebp,%ecx
  800dc2:	ba 20 00 00 00       	mov    $0x20,%edx
  800dc7:	29 ea                	sub    %ebp,%edx
  800dc9:	d3 e0                	shl    %cl,%eax
  800dcb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800dcf:	89 d1                	mov    %edx,%ecx
  800dd1:	89 f8                	mov    %edi,%eax
  800dd3:	d3 e8                	shr    %cl,%eax
  800dd5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800dd9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800ddd:	89 c1                	mov    %eax,%ecx
  800ddf:	8b 44 24 08          	mov    0x8(%esp),%eax
  800de3:	09 c1                	or     %eax,%ecx
  800de5:	89 d8                	mov    %ebx,%eax
  800de7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800deb:	89 e9                	mov    %ebp,%ecx
  800ded:	d3 e7                	shl    %cl,%edi
  800def:	89 d1                	mov    %edx,%ecx
  800df1:	d3 e8                	shr    %cl,%eax
  800df3:	89 e9                	mov    %ebp,%ecx
  800df5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800df9:	d3 e3                	shl    %cl,%ebx
  800dfb:	89 c7                	mov    %eax,%edi
  800dfd:	89 d1                	mov    %edx,%ecx
  800dff:	89 f0                	mov    %esi,%eax
  800e01:	d3 e8                	shr    %cl,%eax
  800e03:	89 fa                	mov    %edi,%edx
  800e05:	89 e9                	mov    %ebp,%ecx
  800e07:	09 d8                	or     %ebx,%eax
  800e09:	d3 e6                	shl    %cl,%esi
  800e0b:	f7 74 24 08          	divl   0x8(%esp)
  800e0f:	89 d3                	mov    %edx,%ebx
  800e11:	f7 64 24 0c          	mull   0xc(%esp)
  800e15:	89 c7                	mov    %eax,%edi
  800e17:	89 d1                	mov    %edx,%ecx
  800e19:	39 d3                	cmp    %edx,%ebx
  800e1b:	72 06                	jb     800e23 <__umoddi3+0x103>
  800e1d:	75 10                	jne    800e2f <__umoddi3+0x10f>
  800e1f:	39 c6                	cmp    %eax,%esi
  800e21:	73 0c                	jae    800e2f <__umoddi3+0x10f>
  800e23:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e27:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e2b:	89 d1                	mov    %edx,%ecx
  800e2d:	89 c7                	mov    %eax,%edi
  800e2f:	89 f2                	mov    %esi,%edx
  800e31:	29 fa                	sub    %edi,%edx
  800e33:	19 cb                	sbb    %ecx,%ebx
  800e35:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800e3a:	89 d8                	mov    %ebx,%eax
  800e3c:	d3 e0                	shl    %cl,%eax
  800e3e:	89 e9                	mov    %ebp,%ecx
  800e40:	d3 ea                	shr    %cl,%edx
  800e42:	d3 eb                	shr    %cl,%ebx
  800e44:	09 d0                	or     %edx,%eax
  800e46:	89 da                	mov    %ebx,%edx
  800e48:	83 c4 1c             	add    $0x1c,%esp
  800e4b:	5b                   	pop    %ebx
  800e4c:	5e                   	pop    %esi
  800e4d:	5f                   	pop    %edi
  800e4e:	5d                   	pop    %ebp
  800e4f:	c3                   	ret
  800e50:	89 da                	mov    %ebx,%edx
  800e52:	89 f1                	mov    %esi,%ecx
  800e54:	29 f9                	sub    %edi,%ecx
  800e56:	19 c2                	sbb    %eax,%edx
  800e58:	89 c8                	mov    %ecx,%eax
  800e5a:	e9 2b ff ff ff       	jmp    800d8a <__umoddi3+0x6a>
