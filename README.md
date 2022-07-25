# gpgcacher

A posix shell script for caching gpg keys.

# Rationale
Why not just use [keychain](https://www.funtoo.org/Funtoo:Keychain)? Firstly,
let the intended usage of this script be written:

1. One manages one's `ssh` keys through `gpg-agent`, that is, by having one of
   the sub keys with the **authentication** capability;
2. Not all of one's keys have the **signing** capability.

By having these two points in mind, the use of
[keychain](https://www.funtoo.org/Funtoo:Keychain) is discouraged for:

1. Providing not only `gpg-agent` management, but also for `ssh-agent`;
2. Relying on a caching premise that every key will have the **signing**
   capability, which can be seen through this snippet of its source code:

```sh
# Load gpg keys
if wantagent gpg; then
	# ...
	for k in "$@"; do
		echo | env LC_ALL="$pinentry_lc_all" \
			"${gpg_prog_name}" --no-options --use-agent --no-tty --sign --local-user "$k" -o- >/dev/null 2>&1
		[ $? != 0 ] && tryagain=true
		done
		$tryagain || break

		if [ $gpgattempts = 1 ]; then
			die "Problem adding (is pinentry installed?); giving up"
		else
			warn "Problem adding; trying again"
		fi

		# Update the list of missing keys
		gpgkeys="$(gpg_listmissing)"  # remember, newline-separated

		# Decrement the countdown
		gpgattempts=$(expr $gpgattempts - 1)
	done
fi
```

Note the `--sign` option in the `gpg` command --- inside `${gpg_prog_name}`.
Moreover, the error message for this case is very misleading, since it leads the
user to question either the install or the configuration in of the `pinentry`
program, which has nothing to do with the problem at hand.

# Acknowledgments
[demure](https://demu.red/blog/2017/03/how-to-check-if-your-smartcards-gpg-key-is-in-cache-part-3/)
for finding a way check to check if a gpg key in a smart card is cached.
