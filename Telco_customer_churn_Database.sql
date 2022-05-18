-- Write a SQL query to find those reviewers who have rated nothing for some movies. Return reviewer name.

select rev_name from reviewer
join rating on rating.rev_id = reviewer.rev_id
where rev_stars is null ;

-- Write a SQL query to find the movies, which have been reviewed by any reviewer body except by 'Paul Monks'. Return movie title.
select mov_title from movie
join rating on movie.mov_id= rating.mov_id
join reviewer on rating.rev_id= reviewer.rev_id
where rev_name != 'Paul Monks';

-- Write a SQL query to find the lowest rated movies. Return reviewer name, movie title, and number of stars for those movies. 

select rev_name, mov_title, rev_stars
from rating 
join reviewer on reviewer.rev_id= rating.rev_id
join movie on rating.mov_id= movie.mov_id
WHERE rating.rev_stars = (
SELECT MIN(rating.rev_stars)
FROM rating);

-- Write a SQL query to find the movies directed by 'James Cameron'. Return movie title.

select mov_title from movie 
join movie_direction on movie.mov_id= movie_direction.mov_id
join director on movie_direction.dir_id= director.dir_id
where  dir_fname = 'James' AND dir_lname='Cameron';

-- Write a query in SQL to find the name of those movies where one or more actors acted in two or more movies. 

select mov_title from movie 
where mov_id in (select mov_id from movie_cast where act_id in 
(select act_id from actors 
where act_id in (select act_id from movie_cast group by act_id HAVING COUNT(act_id)>1)));

-- Given a relation R( A, B, C, D) and Functional Dependency set FD = { AB → CD, B → C }, determine whether the given R is in 2NF? If not, convert it into 2 NF.

Ans: R is not in 2NF, because non-prime attribute should be partially dependent on Candidate Key.
Since R has 4 attributes: - A, B, C, D, and Candidate Key is AB, Therefore, prime attributes 
are A and B while a non-prime attribute are C and D
we can make it  like R1(B,C) and R2 (A,B,D)


-- Given a relation R( P, Q, R, S, T) and Functional Dependency set FD = { PQ → R, S → T }, determine whether the given R is in 2NF? If not, convert it into 2 NF.

Ans : R is not in 2NF, becuse , it's non-prime attributes are partially dependent on part of candidate key PQS.
we can make it like R1( P, Q, R),R2(S, T),R3(P, Q, S) 

-- Given a relation R( P, Q, R, S, T, U, V, W, X, Y) and Functional Dependency set FD = { PQ → R, PS → VW, QS → TU, P → X, W → Y }, determine whether the given R is in 2NF? If not, convert it into 2 NF.

Ans : It also ot satisfy 2NF, becuse it's non-prime attributes are partially dependent on part of candidate key PQS.
we can make it like R1(P, Q, R),R2( P, S, V, W),R3( Q, S, T, U),R4( P, X),R5( W, Y),R6(P, Q, S)

-- Given a relation R( X, Y, Z, W, P) and Functional Dependency set FD = { X → Y, Y → P, and Z → W}, determine whether the given R is in 3NF? If not, convert it into 3 NF.

Ans: X → Y does not satisfy the definition of 3NF, that neither X is Super Key nor Y is a prime attribute.
     Y → P does not satisfy the definition of 3NF, that neither Y is Super Key nor P is a prime attribute.
     Z → W satisfies the definition of 3NF, that neither Z is Super Key nor W is a prime attribute.
     we can make it like R1(X, Y), R2(Y, P), R3( Z, W), and R4( X, Z)
     
-- Given a relation R( P, Q, R, S, T, U, V, W, X, Y) and Functional Dependency set FD = { PQ → R, P → ST, Q → U, U → VW, and S → XY}, determine whether the given R is in 3NF? If not, convert it into 3 NF.

Ans: PQ → R satisfy the definition of 3NF, as PQ Super Key
	 P →  ST does not satisfy the definition of 3NF, that neither P is Super Key nor ST is the prime attribute
	 Q → U does not satisfy the definition of 3NF, that neither Q is Super Key nor U is a prime attribute
	 U → VW does not satisfy the definition of 3NF, that neither U is Super Key nor VW is a prime attribute
	 S → XY does not satisfy the definition of 3NF, that neither S is Super Key nor XY is a prime attribute     
     we can make it like R1(P, S, T), R2(Q, U), R3(U, V, W), R4( S, X, Y), and R5( P, Q, R)
     


