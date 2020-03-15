" For passwordstore files

" create necessary OTP format
function! OtpAuth()
    let l:login=split(search("^login:.*"), ":")[1]
    let l:otp_template="otpauth://totp/%s?secret=%s&issuer=%s"
	let l:otp_str=printf(l:otp_template, l:login, getline('.'), "facebook")
    echo l:login
endfu!
command Otp call OtpAuth()
