the point is the semantics of the type-tests we are doing.

- "boyland" tests - my term, because I think John deserves having at least one thing named after him :-)

In that FOOL paper (sorry again, not FTFJP) John points out that to be truly "gradual"
in some conceptually pure sense  you should test only on the presence of methods, not their type annotations. 

this is the simplest kind of  dynamic type test, and what (I understand) Moth currently does.
that's why my abstract talked about "dynamic checks" rather than talking about optional
or gradual typing...

so there's no distinction between

```
type { apply( _: String) -> String }  and type { apply( _: Number) -> Number } 
```

because we only look at the method name "apply"

My suggested goal for the DLS paper is to use (or demonstrate that) existing VM mechanisms
can reduce or eliminate the overhead of those tests - by memoisation, inlining etc.

Then there are at least two other semantics for type test:

- deep structural tests, where we look at argument and return types, not just methods

here  type 

```
{ apply( _: String) -> String }  and type { apply( _: Number) -> Number } 
```

would NOT be considered subtypes, but both would be sub and supertypes of 

```
type { apply( _: Unknown) -> Unknown } 
```

(where Unknown is Grace's "dynamic" type) 


 - tests with blame - basically "read the gradual typing and blame papers" 
     the point here is that succeeding in a type-test against "Unknown" must 
     establish constraints that later calls on a method must obey. 

here you may be able to do something like 

```
def returnsUnknown : type { run -> Unknown } =   { ... some random code that returns something }

def wantsANumber : type { run -> Number } =  returnsUnknown   
   // potentially dynamically unsound - if returnsUnknown dynamcaly returns something that's not a Number 
   //staticaly OK due to type Unknown matacing everything.
   //but must set up a constraint that triggers an error if the block actually returns something other than a Number 

print (wantsANumber.run) 
```

there are a range of implementation strategies for doing this properly,
with a range of different semantics about precisely when and where they catch errors.
the point of blame tracking is to say that the error occurred at some 'assignment'
where type Unknown matches against some concrete type


I *think* that the existing VM optimisations to remove checks
should be pretty much independent of the semantics of the checks themselves
at least for shallow vs deeper structural tests. 

I think that is probably true for the stuff with blame also
but that may alter depending on the precise blame semantics - 
although I think they're always monotonic so it should be OK.


getting to the point of showing stuff with blame semantics
should have a good chance of being a top-level paper (OOPSLA, ECOOP etc).
