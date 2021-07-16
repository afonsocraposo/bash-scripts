#!/bin/sh

/sbin/notmuch new
/sbin/notmuch tag +personal 'folder:"/(afonsocraposo|afonsale|afonsoacr|tecnico|afonso-scientisst)/"'
/sbin/notmuch tag +scientisst 'folder:"/(admin|developer|info|social)-scientisst/"'
