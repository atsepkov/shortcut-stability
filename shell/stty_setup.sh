# Copyright 2015 Alexander Tsepkov <atsepkov@gmail.com>

# Tell the telegraph I want my keybindings back, it's not 1950 anymore
stty stop ''; stty start '';

# Now that we're not blind to Ctrl+Q, let's map it to termination
stty intr \^Q		# free Ctrl+C for copy
stty lnext \^-		# free Ctrl+V for paste
