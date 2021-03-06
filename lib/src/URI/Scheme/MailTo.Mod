(* 	$Id: MailTo.Mod,v 1.4 2003/06/03 21:05:18 mva Exp $	 *)
MODULE URI:Scheme:MailTo;
(*  Implementation of the "mailto" URI scheme.
    Copyright (C) 2000, 2003  Michael van Acken

    This module is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public License
    as published by the Free Software Foundation; either version 2 of
    the License, or (at your option) any later version.

    This module is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with OOC. If not, write to the Free Software Foundation,
    59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*)


IMPORT
  URI:Scheme:Opaque;


TYPE
  URI* = POINTER TO URIDesc;
  URIDesc = RECORD
  (**This class implements the @samp{mailto:} URI scheme.  Note: Syntax checks
     on the mail address are not implemented yet.  *)
    (Opaque.GenericDesc)
  END;


PROCEDURE Init* (mailto: URI; schemeId, opaque: STRING);
  BEGIN
    Opaque.Init (mailto, schemeId, opaque)
  END Init;

PROCEDURE New* (schemeId, opaque: STRING): URI;
  VAR
    mailto: URI;
  BEGIN
    NEW (mailto);
    Init (mailto, schemeId, opaque);
    RETURN mailto
  END New;

PROCEDURE (mailto: URI) Clone* (): URI;
  VAR
    copy: URI;
  BEGIN
    NEW (copy);
    mailto. Copy (copy);
    RETURN copy
  END Clone;

PROCEDURE NewPrototype*(): URI;
  BEGIN
    RETURN New("mailto", "");
  END NewPrototype;

END URI:Scheme:MailTo.
