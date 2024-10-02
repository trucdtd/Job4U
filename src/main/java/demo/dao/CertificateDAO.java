package demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.entity.CertificateEntity;

public interface CertificateDAO  extends JpaRepository<CertificateEntity, Integer> {

}
