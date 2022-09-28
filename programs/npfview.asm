; ------------------------------------------------------------------
; Program to display NPF (320x200, 8-bit only)
; ------------------------------------------------------------------


	BITS 16
	%INCLUDE "mikedev.inc"
	ORG 32768


main_start:
	call draw_background

	call os_file_selector		; Get filename

	jc near close			; Quit if Esc pressed in dialog box

	mov bx, ax			; Save filename for now

	mov di, ax

	call os_string_length
	add di, ax			; DI now points to last char in filename

	dec di
	dec di
	dec di				; ...and now to first char of extension!

	mov si, npf_extension
	mov cx, 3
	rep cmpsb			; Does the extension contain 'NPF'?
	je valid_npf_extension		; Skip ahead if so

					; Otherwise show error dialog
	mov dx, 0			; One button for dialog box
	mov ax, err_string
	mov bx, 0
	mov cx, 0
	call os_dialog_box

	jmp main_start			; And retry


valid_npf_extension:
	mov ax, bx
	mov cx, 36864			; Load NPF at 36864 (4K after program start)
	call os_load_file


	mov ah, 0			; Switch to graphics mode
	mov al, 13h
	int 10h


	mov ax, 0A000h			; ES = video memory
	mov es, ax


	mov si, 36864+80h		; Move source to start of image data
					; (First 80h bytes is header)

	mov di, 0			; Start our loop at top of video RAM

decode:
	mov cx, 1
	lodsb
	cmp al, 192			; Single pixel or string?
	jb single
	and al, 63			; String, so 'mod 64' it
	mov cl, al			; Result in CL for following 'rep'
	lodsb				; Get byte to put on screen
single:
	rep stosb			; And show it (or all of them)
	cmp di, 64001
	jb decode


	mov dx, 3c8h			; Palette index register
	mov al, 0			; Start at colour 0
	out dx, al			; Tell VGA controller that...
	inc dx				; ...3c9h = palette data register

	mov cx, 768			; 256 colours, 3 bytes each
setpal:
	lodsb				; Grab the next byte.
	shr al, 2			; Palettes divided by 4, so undo
	out dx, al			; Send to VGA controller
	loop setpal


	call os_wait_for_key

	mov ax, 3			; Back to text mode
	mov bx, 0
	int 10h
	mov ax, 1003h			; No blinking text!
	int 10h

	mov ax, 2000h			; Reset ES back to original value
	mov es, ax
	call os_clear_screen
	jmp main_start


draw_background:
	mov ax, title_msg		; Set up screen
	mov bx, footer_msg
	mov cx, WHITE_ON_GREEN
	call os_draw_background
	ret


close:
	call os_clear_screen
	ret


	npf_extension	db 'NPF', 0

	err_string	db 'Please select a NPF file!', 0

	title_msg	db 'Nebukin Presentation Viewer', 0
	footer_msg	db 'Select a PPF file to view, or press Esc to exit', 0

	skiplines	dw 0


; ------------------------------------------------------------------
