xcode:
	xcode-select --install

zlib_mojave:
	sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

init:
	ansible-playbook -K playbooks/init.yml $(args)

tools:
	ansible-playbook -K playbooks/tools.yml $(args)

.PHONY: xcode zlib_mojave brew init tools ;
