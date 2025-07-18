package com.groo.kmw.domain.front.member.repository;

import com.groo.kmw.domain.front.member.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Transactional
public interface MemberRepository extends JpaRepository<Member, Long> {
    //맴버 id를 비교할 때 사용해야함 헷갈려하는 부분인 equals나 optinal은 null값을 비교할 때 씀
    boolean existsByMemberLoginId(String memberLoginId);

    boolean existsByMemberEmail(String memberEmail);

    Optional<Member> findByMemberLoginId(String memberLoginId);
    //findByMemberLoginId 옵셔널로 만들어서 프로필 메소드사용 불가 리펙토링때 공부할 요소
    //JPA에서는 by뒤에는 무조건 엔티티의 필드명과 일치해야함
//    Member findByGetMemberLoginId(String memberLoginId);
    Optional<Member> findByMemberRefreshToken(String memberRefreshToken);
    //Before(= sql <)는 14일이 지난걸 확인 하기 위해 있어야 함
    List<Member> findByMemberStatusAndWithdrawDateTimeBefore(int memberStatus, LocalDateTime dateTime);
}
